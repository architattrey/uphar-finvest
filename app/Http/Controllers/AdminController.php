<?php

namespace App\Http\Controllers;
//use Illuminate\Http\Request;
use Illuminate\Http\Request; 
use App\Http\Controllers\Controller; 
use Illuminate\Support\Facades\Auth; 
use Illuminate\Support\Facades\Storage;
//use Illuminate\Filesystem\FilesystemManager;
use Illuminate\Support\Facades\Hash;
use Illuminate\Mail\Sendloginagentinfo;
use GuzzleHttp\Exception\GuzzleException;
use GuzzleHttp\Client;
use Validator;
use Session;
//use App\Models\user; 
use App\User;
use App\Agent;
use Mail;
use App\Customer;
use App\Products;
use App\References;
use DB;

class AdminController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
     
    public function __construct()
    {
        $this->middleware('auth')->only(['index','agentRegistrationSubmit','getAllAgent','agentRegistration','deleteAgent','allAgentCustomers','UpdateCustomerRequest','asignFieldBoy','getAllDeclineCustomers','getAllApprovedCustomers','getAllPendingCustomers']);
        
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        //return view('home');
        $data['agents']    = count(Agent::where('user_type',2)->get());
        $data['fieldsBoy'] = count(Agent::where('user_type',1)->get());
        $data['customers_request'] = count(Customer::whereNotIn('status', [5,6])->get());
        $data['our_customers'] = count(Customer::where('status',5)->get());
        return view('admin.dashboard',$data);
        
    }
    //login admin
    public function login(Request $request)
    {
        try{
            $validator = Validator::make($request->all(), [
                'email'              => 'required|Email',
                'password'           => 'required|min:6',
            ]);
            if($validator->fails()) {
                Session::flash('flash_message', $validator->messages());    
                return back();
               
            }
            $userdata = array(
                'email'     =>  $request['email'],
                'password'  =>  $request['password'],
            );
            //check in auth for login
            if(Auth::attempt($userdata)){
                $user_role = User::where('email',$request['email'])->value('role');
                if($user_role == "1"){
                    $admin = User::where('email',$request['email'])->first();
                    // $request->session()->put('data', $admin);
                    return redirect('/dashboard');
                }else{
                    Session::flash('flash_message','User is not exist.');    
                    return back();
                }
            }else{
                Session::flash('flash_message','User is not exist.');    
                return back();
            }    
        }catch(\Exception $e){
            //$e->getMessage()
            Session::flash('flash_message',"Something went wrong. please contact to administration"); 
            return back();
        } 
    }
    // get all agent
    public function getAllAgent(Request $request,$type=NULL){
        try{
            
           // Session::put('get_agent', 'agent_list');
            #get agents
            if($type == '2'){
                $data['agents'] = Agent::with('userAgents')->where('delete_status',"1")->where('user_type','2')
                                ->get();
                            // return $data;
                            // Storage::url($file_name);
                            //$file_name = $data['agents'][0]['user_image'];
                            //$file = Storage::url($file_name);
                            //dd('public'.$file);
            #get verification
            }elseif($type == '3'){
                $data['agents'] = Agent::with('userAgents')->where('delete_status',"1")->where('user_type','3')
                                ->get();
            }
            return view('admin.agent.agent_listing',$data);
        }catch(\Exception $e){
            Session::flash('flash_error',"Something went wrong with this request.Please contact to administer"); 
            return back();
        }
    }
   //agent registration view for insert and also for update data
    public function agentRegistration(Request $request){
       
        if($request->id){
            $data['agent'] = Agent::with('userAgents')
                                    ->where('delete_status',"1")
                                    ->where('id',$request->id)
                                    ->get();
        }else{
            $data['agent']="";
        }
        
        return view('admin.agent.registration',$data);
    }
    //submit and update agent details
    public function agentRegistrationSubmit(Request $request){
         
        // dd($request->user_image->getClientOriginalExtension());
        try{
            $user = new User();
            $agent = new Agent();

            //update agent information
            // dd($request);
            if(!empty($request->agent_id) && isset($request->agent_id)){
             
                $agentId = $request->agent_id;
                $userData= Agent::with('userAgents')->where('id',$agentId)->first();
               // $userId  =  $userData;
                
                           
                //check user is in database
                if(!empty($userData) && isset($userData)) {
                    $validator = Validator::make($request->all(),[
                        
                        'first_name'       =>'required',
                        'last_name'        =>'required',
                        'gender'           =>'required',
                        'address'          =>'required',  
                        'date_of_birth'    =>'required',
                        'marital_status'   =>'required',
                        'state'            =>'required',
                        'city'             =>'required',
                        'education'        =>'required',
                        
                        'email'            =>'required|Email',
                        'phone_number'     =>'required',
                        
                    ]);
                    if ($validator->fails()) {
                        Session::flash('flash_error', 'fill data carefully');    
                        return back();
                    }
                    $returnAgentData = Agent::where('id', $agentId)->update([
                       
                        'first_name' => $request->first_name,
                        'last_name'  => $request->last_name,
                        'gender'     => $request->gender,
                        'state'      => strtoupper($request->state),
                        'city'       => strtoupper($request->city),
                        'address'    => ucfirst($request->address),
                        'marital_status' => $request->marital_status,
                        'date_of_birth'  => $request->date_of_birth,
                        'education'      => $request->education,
                        'phone_number'   => $request->phone_number,
                        'user_image'     => $request->user_image,
                        'updated_at'     => date("Y-m-d"),
                    ]);
                    $returnUserData =  User::where('id',$userData->user_id)->update([
                        'email'  => $request->email
                    ]);
                    
                    if(($returnAgentData && $returnUserData)){
                        Session::flash('flash_message','Profile successfully updated');    
                        # send sms to agent or field bpoy for updated details
                         
                        $ch = curl_init();
                        $encoded_message = urlencode("Dear Sir/Mam please login with Uphar Finvest. Your updated username ".$request->email);
                        $string1 = "http://api.smscountry.com/SMSCwebservice_bulk.aspx?User=upharfinvest&passwd=Uphar@1074&mobilenumber=".$request->phone_number."&message=".$encoded_message."&sid=smscntry&mtype=N&DR=Y";
                        curl_setopt($ch, CURLOPT_URL, $string1);
                        $response = curl_exec($ch);
                        curl_close($ch);

                        if($response == true){
                            Session::flash('flash_error',"Data has updated successfully."); 
                            return redirect('/agents');
                        }else{
                            Session::flash('flash_error',"Message not sent yet. But data has updated successfully."); 
                            return back();
                        }
                    }else{
                        Session::flash('flash_error',"Something went wrong with this request.Please contact to administer"); 
                        return back();
                    }
                }else{
                    Session::flash('flash_error', 'Agent Not Found ');    
                    return back();
                } 
            }else{
                //insert new data of agent
                $validator = Validator::make($request->all(), [
                     
                    'first_name'       =>'required',
                    'last_name'        =>'required',
                    'user_type'        =>'required',
                    'gender'           =>'required',
                    'state'            =>'required',
                    'city'             =>'required',
                    'address'          =>'required',  
                    'date_of_birth'    =>'required',
                    'marital_status'   =>'required',
                    'education'        =>'required',
                    'email'            =>'required|Email',
                    'phone_number'     =>'required|min:10',
                    'password'         =>'required',
                    
                ]);
                if($validator->fails()){
                    Session::flash('flash_error','please fill all fields carefully or do not use existing email');    
                    return back();

                }else{
                    //dd("after status");
                    $user->name   = $request->first_name." ".$request->last_name;
                    $user->email  = $request->email;
                    $user->role   = $request->user_type;
                    $user->password = Hash::make($request['password']);
                    $user->save();
                    //dd($user->id);
                    if(isset($user->id) && !empty($user->id)){

                        $agent->user_id       = $user->id;
                        $agent->user_type     = $request->user_type;
                        $agent->first_name    = $request->first_name;
                        $agent->last_name     = $request->last_name;
                        $agent->phone_number  = $request->phone_number;
                        $agent->gender        = $request->gender;
                        $agent->state         = strtoupper($request->state);
                        $agent->city          = strtoupper($request->city);
                        $agent->address       = $request->address;
                        $agent->marital_status = $request->marital_status;
                        
                        $agent->education      = $request->education;
                        $agent->delete_status = "1";
                        $agent->date_of_birth  = $request->date_of_birth;
                        $agent->created_at     = date("Y-m-d");
                        //save user image in directory as well in database
                        if($request->user_image){
                            $file_name = '_user'.time(). ".".$request->user_image->getClientOriginalExtension();
                            $path = Storage::put($file_name, $request->user_image,'public');
                            $path = $request->user_image->storeAs('public/user_images', $file_name);
                            // dd($path);
                            if($path){  
                                $agent->user_image  = $path;
                                // dd($agent->user_image);
                            }else{
                                Session::flash('flash_error','Image is not uploading cause of server problem');    
                                return back();
                            }
                        }else{
                            $agent->user_image = "";

                        }
                        $agent->save();
                        if($agent->id){
                            # send sms to agent for login details
                            $ch = curl_init();
                            $encoded_message = urlencode( "Dear Sir/Mam please login with Uphar Finvest. Your username:" .$request->email." and password :".$request['password']);
                            $string1 = "http://api.smscountry.com/SMSCwebservice_bulk.aspx?User=upharfinvest&passwd=Uphar@1074&mobilenumber=".$request->phone_number."&message=".$encoded_message."&sid=smscntry&mtype=N&DR=Y";
                            curl_setopt($ch, CURLOPT_URL, $string1);
                            $response = curl_exec($ch);
                            curl_close($ch);
                            if($response == true){
                                if($request->user_type == 2){
                                    Session::flash('flash_message','sales exicutive has created successfull');    
                                    return back();
                                }else{
                                    Session::flash('flash_message',' varification has created successfull');    
                                    return back();
                                }
                            }else{
                                Session::flash('flash_error',"Server is not responding. Please try again later"); 
                                return back();
                            } 
                            
                        }else{
                            Session::flash('flash_error','we are unable to save the information cause of server error. Contact to your administer');    
                            return back();
                        }
                    }else{
                        Session::flash('flash_error','we are unable to save the information cause of server error. Contact to your administer');    
                        return back();
                    }     
                }
            }
        }catch(\Exception $e){
            Session::flash('flash_error',"Please do not use existing email id try with other"); 
            return back();
        }

    }
    // soft delete the details of agent
    public function deleteAgent(Request $request){
        try{
            $userId = $request->id;
            if(!empty($userId) && isset($userId)){
                $agent = Agent::where('id', $userId)->orWhere('delete_status',1)->first();
                if(!empty($agent) && isset($agent)){
                 
                    $result =  Agent::where('id', $userId)->orWhere('delete_status',1)->update([
                      'delete_status'    => '0',
                    ]);
                    if($result){
                        Session::flash('flash_message',"Agent information has been successfully deleted"); 
                        return back();
                    }else{
                        
                        Session::flash('flash_error',"Something went wrong with this request.Please contact to administer"); 
                        return back();
                    }
                }else{
                    Session::flash('flash_error',"User not found"); 
                    return back();
                }
            }else{
                Session::flash('flash_error',"Something went wrong please try again"); 
                return back();
            }
        }catch(\Exception $e){
            Session::flash('flash_error',"We can not delete this user. please contact to administration"); 
            return back();
        }
    }
    //show customers bases on particular agent
    public function allAgentCustomers($id = null, $redirect = null, Request $request){
        
        try{
            if($request->id || $id){
                //$data['allCustomers'] = Agent::find($request->id)->agentsCustomers->get();
                $id = $id ? $id : $request->id;
                $data['allCustomers'] =  $customer = Customer::with('agentCustomer')->where('agent_id',$id)
                                        ->whereNotIn('status', [5,6])->get();
                                        
                if(count($data['allCustomers']) == 0 ) {
                    if(!$redirect) {
                         Session::flash('flash_error',"No customers avaialable for this agent"); 
                    }else{
                        Session::flash('flash_message',"Status Successfully Updated"); 
                    }
                     return redirect()->route('get-all-agent','2');
                   
                }
                                    
              
                $userId = count($customer) > 0 ? $customer[0]->agentCustomer['user_id'] : "";
                $agent_email = $userId  ? User::where('id',$userId)->get(['email']):  "";
                
                $agents = Agent::where('user_type','3')->get();


                $allCustomers = $data['allCustomers']->map(function ($item, $key) use($agents) {
                     $item['fieldBoy'] = $agents->where('city', $item['city'])->all();
                     

                     return $item;
                });

                 
                return view('admin.agent.agent_customers', compact('allCustomers', 'agent_email'));
            }else{
                Session::flash('flash_error',"Something went wrong please try again"); 
                
            }
        }catch(\Exception $e){
            Session::flash('flash_error',"Something went wrong. Or customer not found with this agent"); 
           
        }
        
         return redirect()->route('get-all-agent','2');
    }
    //decline request
    public function UpdateCustomerRequest($id = null, $status = null, $phone = null, $agentId = null, Request $request){
        try{
             
            if(($request->phone_number) && ($request->status) && ($request->id)){
                $customer = Customer::where('id',$request->id)->first();
                if(!empty($customer) && isset($customer)){
                    
                    if($request->status==6){$status = "Decline";}elseif($request->status==5){$status="Approved";}
                    //send notification to customer
                    $ch = curl_init();
                    $encoded_message = urlencode("Loan request for ".$customer['name']." has been ".$status." Please contact to your administrator ".$customer['phone_number']." for further proccedings.");
                    $string1 = "http://api.smscountry.com/SMSCwebservice_bulk.aspx?User=upharfinvest&passwd=Uphar@1074&mobilenumber=".$customer['phone_number']."&message=".$encoded_message."&sid=smscntry&mtype=N&DR=Y";
                    curl_setopt($ch, CURLOPT_URL, $string1);
                    $response1 = curl_exec($ch);
                    curl_close($ch);

                    #send notification to agent of this customer
                    $ch = curl_init();
                    $encoded_message = urlencode("Loan request for ".$customer['name']." has been ".$status." Please contact to your customer ".$customer['phone_number']." for further proccedings.");
                    $string1 = "http://api.smscountry.com/SMSCwebservice_bulk.aspx?User=upharfinvest&passwd=Uphar@1074&mobilenumber=".$request->phone_number."&message=".$encoded_message."&sid=smscntry&mtype=N&DR=Y";
                    curl_setopt($ch, CURLOPT_URL, $string1);
                    $response2 = curl_exec($ch);
                    curl_close($ch);

                    if($response1 == true  || $response2 == true){
                        $returnUserData =  Customer::where('id', $request->id)->update([
                            'status'    => $request->status,
                        ]);
                        Session::flash('flash_message',"Status Successfully Updated"); 
                        
                    }else{
                        Session::flash('flash_error',"Server is not responding. Please try again later"); 
                    
                    } 
                    
                }else{
                    Session::flash('flash_error',"We have can not handle this request"); 
                }
            }else{
                Session::flash('flash_error',"Something went wrong. please contact to administration"); 
            }
            
          
        //  return redirect()->route('allCustomers', ['id' => $request->id]);

        }catch(\Exception $e){
            Session::flash('flash_error',"Something went wrong. please contact to administration");
            // return redirect()->route('allCustomers', ['id' => $request->id]);

        } 
        
        //   return "ddd";
           return redirect()->route('allCustomers', ['id' => $agentId, 'redirect' => 1]);  
      //return redirect()->route('get-all-agent');
    } 
     
    #assign field boy
    public function asignFieldBoy(Request $request){
        if(!empty($request->data)){
            
            $splictData = explode('-',$request->data);
            $id = $splictData[0];
            $customer_id = $splictData[3];
            $firstName = $splictData[1];
            $lastName  = $splictData[2];
            // get data from agent table
            $getDataFromAgent = Agent::where('id',$id)->first();
            $userId =  $getDataFromAgent['user_id'];
            
           
            if(!empty($getDataFromAgent)){
                // get data from customer table
                $getDataFromCust = Customer::where('id',$customer_id)->first();
                $customerName   = $getDataFromCust['name'];
                $customerNumber = $getDataFromCust['phone_number'];
                $customerId     = $getDataFromCust['customer_id'];
                $customerAddress= $getDataFromCust['residential_address'];
                
                
                if(!empty($customerName) && !empty($customerNumber) && !empty($customerId) && !empty($customerAddress)){

                    if(!empty($userId) && isset($userId)){

                        $getDataFromUser = User::where('id',$userId)->first();
                        $getToken = $getDataFromUser['firebase_token'];
                        #send firebase push notification
                        $return = $this->notification($getToken,$customerNumber,$customerId,$customerAddress);
                        //if($return){
                        return $return;
                        if($return->success == 1){
                            #update customer table for insert field boy
                            $returnData =  Customer::where('id',$customer_id)->update([
                                'field_boy'  => $firstName.' '.$lastName,
                                'status' => '1'
                            ]);
                            
                            if($returnData){
                                return response()->json([
                                    'message'=>'Field boy has been successfully assigned ',
                                    'status'=>'success'
                                ]);
                            }else{
                                return response()->json([
                                    'message'=>'Please contact to administrator',
                                    'status'=>'error'
                                ]);
                            }
                        }else{
                            return response()->json([
                                'message'=>'Notification can not be send.Please contact to administrator',
                                'status'=>'error'
                            ]);

                        }
                        
                    }else{
                        return response()->json([
                            'message'=>'Something went wrong with this request.Please try again later1',
                            'status'=>'error'
                        ]);
                    }
                }else{
                    return response()->json([
                        'message'=>'Something went wrong with this request.Please try again later2',
                        'status'=>'error'
                    ]);
                }     
            }else{
                return response()->json([
                    'message'=>'Found something wrong from server end.',
                    'status'=>'error'
                ]);
            }

        }else{
            return response()->json([
                'message'=>'You are not able to performe this task',
                'status'=>'error'
            ]);

        }
    }
    #send fireBase notification 
    public function notification($token,$customerNumber,$customerId,$customerAddress)
    {
        $fcmUrl = 'https://fcm.googleapis.com/fcm/send';
        $fcmNotification = [
            
            'to'        => $token, //single token
            'data' => [
                'title' => "Verification Task",
                'message' =>[
                    'number'=> $customerNumber,
                    'case_number' => $customerId,
                    'residential_address'=>$customerAddress
                ],
                "image-url"=>" http://estateahead.com/uphar_finvest/dist/img/verification-3-612999.png",
            ]
        ];
        // return  
        //     $fcmNotification;
        $headers = [
            'Authorization: key= AAAAOQ1cedg:APA91bHZTK94CKLBw-T-WnMOGYoxxfzzcWHF1rhdDv61Y3Nnwzhs3QqcHB97Y-TxibLCAUL3Ed8O_-GlOEn5oTRZID_gUKlKFZrnrTvg1urQ81k429kNai0vo35org7BNSaL8zmcnUhc',
            'Content-Type: application/json'
        ];

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL,$fcmUrl);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fcmNotification));
        $result = curl_exec($ch);
        curl_close($ch);
        $result = json_decode($result);
        
        #if success
        #"{"multicast_id":6500699649929892850,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1548762747012179c6ddb1f9fd7ecd"}]}"
    }
    #get all decline customers
    public function getAllDeclineCustomers(Request $request){
        try{
            $data['declineCustomers'] = Customer::where('status',6)->get();
            return   view('admin.customers.all_decline_customers',$data);
        }catch(\Exception $e){
            Session::flash('flash_error',"Something went wrong. please contact to administration");
            return back();
        }
    }
    #get all approved customers
    public function getAllApprovedCustomers(Request $request){
        try{
            $data['approvedCustomers'] = Customer::where('status',5)->get();
            return   view('admin.customers.all_approved_customers',$data);
        }catch(\Exception $e){
            Session::flash('flash_error',"Something went wrong. please contact to administration");
            return back(); 
        }
    }
    #get all pending customers
    public function getAllPendingCustomers(Request $request){
        try{
            $data['pendingCustomers'] = Customer::where('status',0)->get();
            //dd($data['pendingCustomers']);
            return   view('admin.customers.all_pending_customers',$data);
        }catch(\Exception $e){
            Session::flash('flash_error',"Something went wrong. please contact to administration");
            return back(); 
        }
    }
}
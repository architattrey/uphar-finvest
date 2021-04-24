<?php

namespace App\Http\Controllers;

//use Illuminate\Http\Request;
use Illuminate\Http\Request; 
use App\Http\Controllers\Controller; 
//use Illuminate\Support\Facades\Auth; 
use Illuminate\Support\Facades\Storage;
//use Illuminate\Filesystem\FilesystemManager;
// use Validator;
//use App\Models\user; 
use App\User;
use App\Agent;
//use Mail;
use App\Customer;
use App\Products;
use App\Vehicle;
use App\References;
use App\Coborrower_and_guarantor;
use App\FinancialBuddyLogin;
// use DB;
use HTML,Form,Validator,Mail,Response,Session,Auth,DB,Redirect,Image,Password,Cookie,File,View,Hash,JsValidator,Input,URL;

class ApiController extends Controller
{
    // private $SMS_SENDER = "TXTLCL";
    // private $RESPONSE_TYPE = 'json';
    // private $SMS_USERNAME = '';
    // private $SMS_PASSWORD = '';
    // private $API_KEY = "F/UB8hz3Jas-c4tCIHOYE6swkDUujzSWMykZHICw1O";
    //login method
    public function financialBuddyLogin(Request $request){
        try{
            $idData = FinancialBuddyLogin::where('mac_id',$request->androidId)->first();
           
            if($idData){
                return response()->json([
                    'data'=>true,
                    'status'=>'success'
                ]);
            }else{
                
                $Data = FinancialBuddyLogin::all();
                if(count($Data) >= 3){
                    return response()->json([
                        'data'=>false,
                        'status'=>'false'
                    ]);
                }else{
                    $fbuddy = new FinancialBuddyLogin();
                    $fbuddy->mac_id   = $request->androidId;
                    $fbuddy->save();
                    if($fbuddy->id){
                        return response()->json([
                            'data'=>true,
                            'status'=>'success'
                        ]);
                    }else{
                        return response()->json([
                            'message'=>'something went wrong.Please try again later',
                            'status'=>'error'
                        ]);
                    }
                }
            }
        }catch(\Exception $e){
            return response()->json([
                'message' => 'There is something wrong. Please contact administrator.'.$e->getMessage(),
                'error'=> true,
            ]);
        } 
    }
    public function login(Request $request)
    {
        try{
            $validator = Validator::make($request->all(), [
                'email'    => 'Email',
                'password' => 'min:5',
            ]);
            if($validator->fails()) {
                return response()->json([
                    'message'=>$validator->messages(),
                    'status'=>'error'
                ]);
            }
            $userdata = array(
                'email'     =>  $request['email'],
                'password'  =>  $request['password'],
            );
            //check in auth for login
            if (Auth::attempt($userdata)) {
                // return response('success', 200);
                $response = [];
                $user_role = User::where('email',$request['email'])->value('role');
                #if user is agent or field boy
                if($user_role == "2" || $user_role == "3" ){
                    // update user table for firebasetoken
                    $response['user'] = $user = User::where('email',$request['email'])->first();
                    User::where('id',$user->id)->update([
                        'firebase_token'    => $request['token'],
                    ]);
                    $response['user'] = $user = User::where('email',$request['email'])->first();
                    //save or update data in agent table
                    $response['agent'] = Agent::where('user_id',$user->id)->first();

                   
                    if(!empty($response['agent']) && isset($response['agent'])){
                        Agent::where('user_id',$user->id)->update([
                            'user_id'    => $user->id,
                        ]);
                    }else{
                        $agent = new Agent();
                        $agent->user_id   = $user->id;
                        $agent->save();
                        $response['agent'] = $agent;
                    }

                    $response['agent']['user_image'] = $response['agent']['user_image'] ?  url('/')."/public".Storage::url($response['agent']['user_image']) : url('/')."/public/dist/img/user-dummy-pic.png";

                    return response()->json([
                        'message'=>'user data',
                        'code'=>200,
                        'data'=>$response,
                        'status'=>'success'
                    ]);
                }else{
                    return response()->json([
                        'message'=>'Credentials is not matched',
                        'status'=>'error'
                    ]);
                }
            }else{
                return response()->json([
                    'message'=>'User is not Exist',
                    'status'=>'error'
                ]);
            }
        }
        catch(\Exception $e){
        return response()->json([
                'message' => 'There is something wrong. Please contact administrator.'.$e->getMessage(),
                'error'=> true,
            ]);
        } 
    }
    // forget password reset by admin
    public function resetPassword(Request $request){
        try{
            //return response()->json(['message'=>$request['email']]);
            $validator = Validator::make($request->all(), ['email' => 'Email']);
            if ($validator->fails()) {
                return response()->json([
                    'message'=>$validator->messages(),
                    'status'=>'error'
                ]);
            }
            $userdata = array('email' => $request['email']);
            if ($userdata) {
                $user = User::where('email',$userdata)->first();
               
                if (!empty($user) && isset($user)) {
                    //generate password
                    $seed = str_split('abcdefghijklmnopqrstuvwxyz'.'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.'0123456789'); // and any other characters
                    shuffle($seed); // probably optional since array_is randomized; this may be redundant
                    $stringcode = '';
                    foreach (array_rand($seed, 5) as $k) $stringcode .= $seed[$k];
                    
                    $tokn_data = DB::table('password_resets')->insert(['email' => $request['email'], 'token' =>$stringcode]);
                    //send sms
                    $message = "http://api.smscountry.com/SMSCwebservice_bulk.aspx?User=upharfinvest&passwd=Uphar@1074&mobilenumber=9810741588&message=Forget%20password%20request%20for%20id%20:%20".$request['email']."%20has%20been%20requested.%20Please%20provide%20this%20new%20password%20".$stringcode."%20for%20login.&sid=smscntry&mtype=N&DR=Y";
                    $ch = curl_init($message);
                    $response = curl_exec($ch);

                    if($response == true){
                        $returnUserData =  User::where('email', $request->email)->update([
                            'email'    => $request->email,
                            'password' => Hash::make($stringcode),
                        ]);
                        if($returnUserData){
                            return response()->json([
                                'message'=>'Sent your reset password request to administor.Please wait for new password',
                                'status'=>'success',
                                'code'=>200
                            ]);
                        }else{
                            return response()->json([
                                'message'=>'Server is not responding.Please try again later',
                                'status'=>'error'
                            ]);
                        }
                    }else{
                        return response()->json([
                            'message'=>'Server is not responding. Please try again later',
                            'status'=>'error'
                        ]);
                    }    
                }else{
                    return response()->json([
                        'message'=>'User not found',
                        'status'=>'error'
                    ]);
                }
            }else{
                return response()->json([
                    'message'=>'Something went wrong please try again later',
                    'status'=>'error'
                ]);
            }

        }catch(\Exception $e){
            return response()->json([
                "message" => "There is something wrong. Please contact administrator.".$e->getMessage(),
                "error" => true,
            ]);
        }
    }
    // user[agent] image upload
    public function imageUpload(Request $request){
        try{
            //return  response()->json([base64_decode($request->userImage)]);
            $userId = $request['user_id'];
            //check request have data or not
            if(!empty($userId) && isset($userId)){
                $user = User::where('id',$userId)->first();
                //check user is in database
                if (!empty($user) && isset($user)) {
                    $validator = Validator::make($request->all(), ['userImage' => 'required']);
                    if ($validator->fails()) {
                        return response()->json([
                            'message'=>$validator->messages(),
                            'status'=>'error'
                        ]);
                    }
                    if($request->userImage){
                        $file_name = 'public/user_images/_user'.time().'.png';
                        $path = Storage::put($file_name, base64_decode($request->userImage),'public');
                        // return collect(Storage::files($directory))->map(function($file_name) {
                        //     return Storage::url($file_name);
                        // });
                        // if(\File::exists(public_path('upload/bio.png'))){

                            //\File::delete(public_path('upload/bio.png'));

                            //}else{

                            //dd('File does not exists.');

                            //}

                        if($path==true){
                            //update image in agent table of agent
                            $agent =   Agent::where('user_id', $userId)->first();
                            $agent->update(['user_image' => $file_name]);
                            //send url for android
                            //$agent->imagePath = url('public/user_images')."/".$file_name;
                            //$path = Storage::url($file_name);
                            $finalPath = $file_name ?   url('/')."/public".Storage::url($file_name) : url('/')."/public/dist/img/user-dummy-pic.png";
                            return response()->json(['message'=>'Image successfully uploaded','status'=>'success','response'=>$finalPath,'code'=>200]);

                        }else{
                            return response()->json([
                                'message'=>'Something went wrong with request.Please try again later','status'=>'error'
                            ]);
                        }
                    }else{
                        return response()->json([
                            'message'=>'Please provide image for uploading',
                            'status'=>'error'
                        ]);
                    }
                    // if($request->hasFile('userImage')){
                    //     //get filename with extension
                    //     $fileNameWithExt = $request->file('userImage')->getClientOriginalImage();
                    //     //get filename
                    //     $fileName = pathinfo($fileNameWithExt,PATHINFO_FILENME);
                    //     //get ext
                    //     $extension = $request->file('userImage')->getOriginalClientExtension();
                    //     //filename to store
                    //     $fileNameToStore = $fileName.'_'.time().'.'.$extension;
                    //     //upload Image folderpath[public/userImage],filename[$fileNameToStore]
                    //     $path = $request->file('userImage')->storeAs('public/users_images', $fileNameToStore);

                   
                }else{
                    return response()->json([
                        'message'=>'User not found',
                        'status'=>'error'
                    ]);
                }
            }else{
                return response()->json([
                    'message'=>'You are not able to performe this task',
                    'status'=>'error'
                ]);
            }
        }catch(\Exception $e){
            return response()->json([
                "message" => "Something went wrong. Please contact administrator.".$e->getMessage(),
                "error" =>true,
            ]);
        }
    }
    //user[agent] profile update
    public function userProfileUpdate(Request $request){
        try{
            $userId = $request['user_id'];
            //check request have data or not
            if(!empty($userId) && isset($userId)){
                $user = User::where('id',$userId)->first();
                //check user is in database
                if(!empty($user) && isset($user)) {
                    $validator = Validator::make($request->all(),[
                        'user_id'        =>'required',
                        'email'          =>'Email',
                        'gender'         =>'string',
                        'phone_number'   =>'min:10',    
                    ]);
                    if ($validator->fails()) {
                        return response()->json([
                            'message'=>$validator->messages(),
                            'status'=>'error'
                        ]);
                    }
                    Agent::where('user_id', $userId)->update([
                        
                       'user_id'    => $userId,
                       'first_name' => $request->first_name,
                       'user_type'  => $request->user_type,
                       'last_name'  => $request->last_name,
                       'user_id'    => $userId,
                       'gender'     => $request->gender,
                       'state'      => ucfirst($request->state),
                       'city'       => ucfirst($request->city),
                       'address'    => $request->address,
                       'marital_status' => $request->marital_status,
                       'date_of_birth'  => $request->date_of_birth,
                       'education'      => $request->education,
                       'phone_number'   => $request->phone_number,
                       'user_type'      => $request->user_type,
                       'updated_at'     => date("Y-m-d"),
                    ]);
                    User::where('id', $userId)->update([
                        'email'    => $request->email
                    ]);
                    $response = [];
                    $response['agent'] =  Agent::where('user_id', $userId)->first();
                    $response['user'] =   User::where('id', $userId)->first();
                    
                    
                    return response()->json([
                        'message'=>'Profile successfully updated',
                        'status'=>'success',
                        'data'=>$response
                    ]);
                }else{
                    return response()->json([
                        'message'=>'User not found',
                        'status'=>'error'
                    ]);
                }
            }else{
                return response()->json([
                    'message'=>'You are not able to performe this task',
                    'status'=>'error'
                ]);
            }        
        }catch(\Exception $e){
            return response()->json([
                "message" => "Something went wrong. Please contact administrator.".$e->getMessage(),
                "error" =>true,
            ]);
        }

    }
    // get all products
    public function getAllProducts(Request $request){
        try{
            $products = DB::table('products')->select('id','product_type')->get();
            if(!empty($products) && isset($products)){
                return response()->json([
                    'message'=>'Successfully found data',
                    'status'=>'success',
                    'products'=>$products
                ]);
            }else{
                return response()->json([
                    'message'=>'Products not found',
                    'status'=>'error'
                ]);
            }
        }catch(\Exception $e){
            return response()->json([
                "message" => "Something went wrong. Please contact administrator.".$e->getMessage(),
                "error" =>true,
            ]);
        }
    }
    //insert all loan customer
    public function insertDataOfCustomer(Request $request){
        
        try{
           // return response()->json([$request->referencedetails['reference']['name']]);
            $validator = Validator::make($request->borrowerdetails, [
                'agent_id'              =>'required',
                'name'                  =>'string|max:50',
                'date_of_birth'         =>'date',
                'father_or_husbamd_name'=>'string|max:50',
                'police_station'        =>'string|max:100',
                'phone_number'          =>'min:10',
                'ofc_phone_number'      =>'min:10',
                'marital_status'        =>'string|max:20',
                'adhar_card_number'     =>'min:12',
                'adhar_card_image'      =>'min:12|mimes:jpeg,bmp,png,jpg',
                'pan_card_number'       =>'min:10',
                'city'                  =>'required',
                'state'                 =>'required',
                'pan_card_image'        =>'min:12|mimes:jpeg,bmp,png,jpg',
            ]);
            //validation for references for atleast one manadatroy
            if(count($request->referencedetails) != 0){
                for($i=0; $i<count($request->referencedetails['reference']); $i++){
                    $validator = Validator::make($request->referencedetails['reference'][$i], [
                        'agent_id'              =>'required',
                        'name'                  =>'string|max:50',
                        'phone_number'          =>'min:10',
        
                    ]);
                    if ($validator->fails()) {
                        return response()->json(['error'=>$validator->errors()], 401);            
                    }
                }
            }else{
                return response()->json([
                    "message" =>"please give atleast one Reference's details",
                    "status" =>"error",
                ]);
            }
            //save adhar card image in directory
            $file_name_adhar = 'public/documents/_adhar'.time().'.png';
            $adhar_path = Storage::put($file_name_adhar, base64_decode($request->borrowerdetails['adhar_card_image']),'public');
            if($adhar_path != true){  
                return response()->json([
                    'message'=>'Please provide adhar card image',
                    'status'=>'error'
                ]);
            }  
            //save pan card image in directory
            $file_name_pan = 'public/documents/_pan'.time().'.png';
            #get path of image to save in table
            $pan_path = Storage::put($file_name_pan, base64_decode($request->borrowerdetails['pan_card_image']),'public');
            if($pan_path != true){  
                return response()->json([
                    'message'=>'Please provide pan card image',
                    'status'=>'error'
                ]);
            }
            
            // save data in agent table
            if($request->borrowerdetails['agent_id'] !=''){

                $customer = new Customer();
                $customer->agent_id        = $request->borrowerdetails['agent_id'];
                $customer->customer_id     = substr($request->borrowerdetails['state'],0,3).'/'.substr($request->borrowerdetails['city'],0,4).'/'.rand(1000,2000);
                $customer->name            = $request->borrowerdetails['name'];
                $customer->date_of_birth   = $request->borrowerdetails['date_of_birth'];
                $customer->father_or_husband_name  = $request->borrowerdetails['father_or_husband_name'];
                $customer->residential_address     = $request->borrowerdetails['residential_address'];
                $customer->land_mark               = $request->borrowerdetails['land_mark'];
                $customer->police_station          = $request->borrowerdetails['police_station'];
                $customer->phone_number            = $request->borrowerdetails['phone_number'];
                $customer->years_of_res_address    = $request->borrowerdetails['years_of_res_address'];
                $customer->residance_type          = $request->borrowerdetails['residance_type'];
                $customer->office_address          = $request->borrowerdetails['office_address'];
                $customer->ofc_phone_number        = $request->borrowerdetails['ofc_phone_number'];
                $customer->years_of_ofc_address    = $request->borrowerdetails['years_of_ofc_address'];
                $customer->email                   = $request->borrowerdetails['email'];
                $customer->profile                 = $request->borrowerdetails['profile'];
                $customer->marital_status          = $request->borrowerdetails['marital_status'];
                $customer->no_of_dependants        = $request->borrowerdetails['no_of_dependants'];
                $customer->loan_amount             = $request->borrowerdetails['loan_amount'];
                $customer->EMI                     = $request->borrowerdetails['EMI'];
                $customer->city                    = strtoupper($request->borrowerdetails['city']);
                $customer->state                   = strtoupper($request->borrowerdetails['state']);
                $customer->Period                  = $request->borrowerdetails['Period'];
                $customer->adhar_card_number       = $request->borrowerdetails['adhar_card_number'];
                $customer->adhar_card_image        = $file_name_adhar;
                $customer->pan_card_number         = $request->borrowerdetails['pan_card_number'];
                $customer->pan_card_image          = $file_name_pan;
                $customer->status                  = 0;
                $customer->Created_At              = date("Y-m-d");
                
                //save data of references in reference tab  return response()->json([$customer]);
                $customer->save();
              
                if(!empty($customer->id)){
                    #insert vehicle
                    $vehicle = new Vehicle();
                    $vehicle->customer_id =  $customer->id;
                    $vehicle->vehicle_type = $request->vehicledetails['vehicle_type'];
                    $vehicle->vehicle_manufacture = $request->vehicledetails['vehicle_manufacture'];
                    $vehicle->vehicle_name = $request->vehicledetails['vehicle_name'];
                    $vehicle->vehicle_model_no = $request->vehicledetails['vehicle_model_no'];
                    $vehicle->save();
                    
                }else{
                    response()->json([
                        'message'=>'Something is missing or going to wrong.Please try again.',
                        'status' =>'error',
                    ]);
                }

                if(!empty($customer->id) && !empty($vehicle->id)){
                    #insert references 
                    for($i=0; $i<count($request->referencedetails['reference']); $i++){
                        $reference = new References();
                        $reference->customer_id  = $customer->id;
                        $reference->name         = $request->referencedetails['reference'][$i]['name'];
                        $reference->agent_id     = $request->referencedetails['reference'][$i]['agent_id'];
                        $reference->son_of       = $request->referencedetails['reference'][$i]['son_of'];
                        $reference->address      = $request->referencedetails['reference'][$i]['address'];
                        $reference->phone_number = $request->referencedetails['reference'][$i]['phone_number'];
                        $reference->created_at   = date("Y-m-d"); 
                        $reference->save();
                    }
                }
                
                if(!empty($customer->id)){
                    //return json_encode ($request->cobrw_grntrs['cobrw_grntr']);
                    #insert coborrower and guarantors
                    for($i=0; $i<count($request->cobrw_grntrs['cobrw_grntr']); $i++){
                        $cobrw_grntr = new Coborrower_and_guarantor();
                        $cobrw_grntr->customer_id  = $customer->id;
                        $cobrw_grntr->agent_id     = $request->cobrw_grntrs['cobrw_grntr'][$i]['agent_id'];
                        $cobrw_grntr->name         = $request->cobrw_grntrs['cobrw_grntr'][$i]['name'];
                        $cobrw_grntr->date_of_birth= $request->cobrw_grntrs['cobrw_grntr'][$i]['date_of_birth'];
                        $cobrw_grntr->father_or_husband_name = $request->cobrw_grntrs['cobrw_grntr'][$i]['father_or_husband_name'];
                        $cobrw_grntr->residential_address    = $request->cobrw_grntrs['cobrw_grntr'][$i]['residential_address'];
                        $cobrw_grntr->land_mark              = $request->cobrw_grntrs['cobrw_grntr'][$i]['land_mark'];
                        $cobrw_grntr->police_station         = $request->cobrw_grntrs['cobrw_grntr'][$i]['police_station'];
                        $cobrw_grntr->phone_number           = $request->cobrw_grntrs['cobrw_grntr'][$i]['phone_number'];
                        $cobrw_grntr->years_of_res_address   = $request->cobrw_grntrs['cobrw_grntr'][$i]['years_of_res_address'];
                        $cobrw_grntr->residance_type         = $request->cobrw_grntrs['cobrw_grntr'][$i]['residance_type'];
                        $cobrw_grntr->office_address         = $request->cobrw_grntrs['cobrw_grntr'][$i]['office_address'];
                        $cobrw_grntr->ofc_phone_number       = $request->cobrw_grntrs['cobrw_grntr'][$i]['ofc_phone_number'];
                        $cobrw_grntr->years_of_ofc_address   = $request->cobrw_grntrs['cobrw_grntr'][$i]['years_of_ofc_address'];
                        $cobrw_grntr->email                  = $request->cobrw_grntrs['cobrw_grntr'][$i]['email'];
                        $cobrw_grntr->profile                = $request->cobrw_grntrs['cobrw_grntr'][$i]['profile'];
                        $cobrw_grntr->marital_status         = $request->cobrw_grntrs['cobrw_grntr'][$i]['marital_status'];
                        $cobrw_grntr->no_of_dependants       = $request->cobrw_grntrs['cobrw_grntr'][$i]['no_of_dependants'];
                        $cobrw_grntr->loan_amount            = $request->cobrw_grntrs['cobrw_grntr'][$i]['loan_amount'];
                        $cobrw_grntr->EMI                    = $request->cobrw_grntrs['cobrw_grntr'][$i]['EMI'];
                        $cobrw_grntr->Period                 = $request->cobrw_grntrs['cobrw_grntr'][$i]['Period'];
                        $cobrw_grntr->reference              = $request->cobrw_grntrs['cobrw_grntr'][$i]['reference'];
                        $cobrw_grntr->reference_phone_number = $request->cobrw_grntrs['cobrw_grntr'][$i]['reference_phone_number'];
                        $cobrw_grntr->reference_address      = $request->cobrw_grntrs['cobrw_grntr'][$i]['reference_address'];
                        $cobrw_grntr->user_type              = $request->cobrw_grntrs['cobrw_grntr'][$i]['user_type'];
                        $cobrw_grntr->created_at             = date("Y-m-d"); 
                        $cobrw_grntr->save();
                    }
                    return response()->json([
                        'message'=>'customer successfully inserted',
                        'status' =>'success',
                        #new  1 line added 5-june-2019
                        'costumer_id'=>$customer->id,
                        'code'   =>200,
                    ]);
                }else{
                    response()->json([
                        'message'=>'Something is missing or going to wrong.Please try again.',
                        'status' =>'error',
                    ]);
                }
            }else{
                response()->json([
                    'message'=>'Something is missing or going to wrong.Please try again.',
                    'status' =>'error',
                ]);

            }
        }catch(\Exception $e){
            return response()->json([
                'message' =>'something went wrong. Please contact administrator.'.$e->getMessage(),
                'status' => 'error',
            ]);
        }
    }
    #new method added 5-6-2019
    # user image upload
    public function documentsimageUpload(Request $request){
        try{
            $appCustomerId = $request['customer_id'];
            //check request have data or not
            if(!empty($appCustomerId) && isset($appCustomerId)){
                $customer = Customer::where('id',$appCustomerId)->first();
                //check customer is in database
                if (!empty($customer) && isset($customer)) {
                    $validator = Validator::make($request->all(), ['image1' => 'required','image2' => 'required','image3' => 'required',]);
                    if ($validator->fails()) {
                        return response()->json([
                            'message'=>$validator->messages(),
                            'status'=>'error'
                        ]);
                    }
                    if($request->image1 && $request->image2 && $request->image3){
                        #image1
                        $file_name1 = 'public/customer_extra_document/_doc1'.time().'.png';
                        $path = Storage::put($file_name1, base64_decode($request->image1),'public');
                        if($path==true){
                            //upload document image 
                            $customer =  Customer::where('id', $appCustomerId)->first();
                            $customer->update(['image1' => $file_name1]);
                        }else{
                            return response()->json([
                                'message'=>'Something went wrong with image1 request.Please try again later',
                                'status'=>'error'
                            ]);
                        }
                        #image2
                        $file_name2 = 'public/customer_extra_document/_doc2'.time().'.png';
                        $path = Storage::put($file_name2, base64_decode($request->image2),'public');
                        if($path==true){
                            //upload document image 
                            $customer =  Customer::where('id', $appCustomerId)->first();
                            $customer->update(['image2' => $file_name2]);
                        }else{
                            return response()->json([
                                'message'=>'Something went wrong with image2 request.Please try again later',
                                'status'=>'error'
                            ]);
                        }
                        #image3
                        $file_name3 = 'public/customer_extra_document/_doc3'.time().'.png';
                        $path = Storage::put($file_name3, base64_decode($request->image3),'public');
                        if($path==true){
                            //upload document image 
                            $customer =  Customer::where('id', $appCustomerId)->first();
                            $customer->update(['image3' => $file_name3]);
                        }else{
                            return response()->json([
                                'message'=>'Something went wrong with image2 request.Please try again later',
                                'status'=>'error'
                            ]);
                        }
                        #return response
                        return response()->json([
                            'message'=>"documents successfully uploaded",
                            'status' =>'success',
                            'code' =>200,
                        ]);
                    }else{
                        return response()->json([
                            'message'=>'Please provide image for uploading',
                            'status'=>'error'
                        ]);
                    }
                }else{
                    return response()->json([
                        'message'=>'User not found',
                        'status'=>'error'
                    ]);
                }
            }else{
                return response()->json([
                    'message'=>'You are not able to performe this task',
                    'status'=>'error'
                ]);
            }
        }catch(\Exception $e){
            return response()->json([
                "message" => "Something went wrong. Please contact administrator.".$e->getMessage(),
                "error" =>true,
            ]);
        }
    }
    //get history of agent 
    public function getAllLoansDetails(Request $request){
        try{
            if($user = $request->agent_id){
                if($user){ 
                    //$allCustomers = Agent::find($user)->agentsCustomers;
                    $data['allCustomers'] = Agent::find($request->agent_id)->agentsCustomers->get();
                    if(!empty($data) && isset($data)){
                        return response()->json([
                            'customers'=>$data,
                            'status' =>'success',
                            'code' =>200,
                        ]);
                    }else{
                        response()->json([
                            'message'=>'Customers not found',
                            'status' =>'error',
                        ]);
                    }
                }else{
                    response()->json([
                        'message'=>'User doest not axist.',
                        'status' =>'error',
                    ]);
                }
            }else{
                response()->json([
                    'message'=>'Please login your account',
                    'status' =>'error',
                ]);
            }
        }catch(\Exception $e){
            return response()->json([
               'message'=>"something went wrong.Please contact administrator.".$e->getMessage(),
               'error' =>true,
            ]);
       }
    }
    // get all customer data
    public function getCustomerData(Request $request){
        try{
            if($request->customer_id){
                $data['customer'] = $customer = Customer::where('customer_id',$request->customer_id)->first();
                //$allCustomers = Agent::find($user)->agentsCustomers;
                $data['customerVhicles'] = Vehicle::where('customer_id',$customer->id)->get();
                $data['customerCobrwrGrntr'] = Coborrower_and_guarantor::where('customer_id',$customer->id)->get();
                $data['customerReferences']  = References::where('customer_id',$customer->id)->get();
                 
                //$data['allData'] = Vehicle::find($customer->id)->customerVehicle->get();
                if(!empty($data) && isset($data)){
                    return response()->json([
                        'customers'=>$data,
                        'status' =>'success',
                        'code' =>200,
                    ]);
                }else{
                    response()->json([
                        'message'=>'Customers not found',
                        'status' =>'error',
                    ]);
                }
            }else{
                response()->json([
                    'message'=>'Please login your account',
                    'status' =>'error',
                ]);
            }
        }catch(\Exception $e){
            return response()->json([
            'message'=>"something went wrong.Please contact administrator.".$e->getMessage(),
            'error' =>true,
            ]);
        }
    }
    public function updateStatusFromFieldBoy(Request $request){
        try{
            $customerId = $request->customer_id;
            $status = $request->status;
            if(!empty($customerId) && !empty($status)){
                $returnData = Customer::where('customer_id', $customerId)->update([
                                'status'  => $status
                            ]);
                if($returnData){
                    return response()->json([
                        'message'=>'Successfully Updated',
                        'status' =>'success',
                        'code' =>200,
                    ]);
                }else{
                    response()->json([
                        'message'=>'Something went wrong with this request.Please try again',
                        'status' =>'error',
                    ]);
                }
            }else{
                response()->json([
                    'message'=>'Something went wrong with this request.Please Contact your administrator',
                    'status' =>'error',
                ]);
            }
        }catch(\Exception $e){
            return response()->json([
            'message'=>"something went wrong.Please contact administrator.".$e->getMessage(),
            'error' =>true,
            ]);
        }
    }
    #get all leads of agent
    public function getAllLeadsOfAgent(Request $request){
        try{
            if(!empty($request->agent_id)){
                $data['leads'] =  Customer::where('agent_id', $request->agent_id)->get();
                
                if($data['leads']){
                    return response()->json([
                        'agent_customers'=>$data,
                        'status' =>'success',
                        'code' =>200,
                    ]);
                }else{
                    response()->json([
                        'message'=>'Data not found',
                        'status' =>'error',
                    ]);
                }
            }else{
                response()->json([
                    'message'=>'Something went wrong with this request.Please Contact your administrator',
                    'status' =>'error',
                ]);
            }
        }catch(\Exception $e){
            return response()->json([
            'message'=>"something went wrong.Please contact administrator.".$e->getMessage(),
            'error' =>true,
            ]);
        }
    }
    #update firebase token
    public function updateFireBaseToken(Request $request){
        try{
            
            if($request->id  &&  $request->fireBaseToken){
                
                $user = User::where('id',$request->id)->first();
                
                if($user){
                     
                    $updateToken = User::where('id',$request->id)->update([
                        
                                'firebase_token' => $request->fireBaseToken
                            ]);
                    if($updateToken){
                         
                        return response()->json([
                            'message'=>"token successfully updated",
                            'status' =>'success',
                            'code' =>200,
                        ]);
                    }else{
                        return response()->json([
                            'message'=>'token is not updated yet. please try again',
                            'status' =>'error',
                        ]);

                    }
                } else{
                   return response()->json([
                        'message'=>'user is not found in database',
                        'status' =>'error',
                    ]);
                }
                   
            }else{
                return response()->json([
                    'message'=>' userId or token not provided',
                    'status' =>'error',
                ]);
            }
        }catch(\Exception $e){
            return response()->json([
                'message'=>"something went wrong.Please contact administrator.".$e->getMessage(),
                'error' =>true,
            ]);
        }
    }
}
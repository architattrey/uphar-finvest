@extends('admin.layouts.app')

@section('content')
    <style>
        .headding_1{
            background:#fff;
            border:1px solid #ccc;
            border-bottom:none;
        }
        .head_name{
            padding:10px 13px;
            margin:15px -10px 15px 0;
            color:#777;
        }
        .headding_1 span{
        margin-right:11%;
        }
        .headding_1 strong{
        font-size: 16px;
        margin-left: 15px;
        margin-right: 15px;
        }
        .headding_2{
            background:#fff;
            border:1px solid #ccc;
            border-bottom:none;
        }
        #customer_wrapper{
            margin-top:50px;
        }
    </style>
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">All Customers</li>
      </ol>
    </section>
    
    <!-- view list of agents -->
    <!-- Main content -->
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="back-bg" style="background-color:#fff; height: 64px; margin-top: 20px;">
                    <div class="buttons" style="float: right;margin: 15px 19px 0px 0px;">
                        <button type="button" class="btn btn-warning">Hide Agent Details</button>&nbsp;
                         
                    </div>
               </div>
            </div>
        </div>
     
    <section class="content">
        @if(Session::has('flash_message'))
        <div class="alert alert-success"><span class="glyphicon glyphicon-ok"></span><em> {!! session('flash_message') !!}</em></div>
        @elseif(Session::has('flash_error'))
        <div class="alert alert-danger"><span class="glyphicon glyphicon-ok"></span><em> {!! session('flash_error') !!}</em></div>
        @endif
        
        <!-- agent info div -->
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="headding_1">
                <center><h3>Agent</h3></center>
                <hr>
               
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th width="10%">First name</th>
                                <th width="10%">Last name</th>
                                <th width="10%">Image</th>
                                <th width="10%">Email</th>
                                <th width="10%">Marital Status</th>
                                <th width="10%">Gender</th>
                                <th width="10%">DOB</th>
                                <th width="10%">Phone Number</th>
                                <th width="10%">Education</th>
                                <th width="10%">Address</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            
                            @if(!empty($allCustomers[0]->agentCustomer["user_image"]) && isset ($allCustomers[0]->agentCustomer["user_image"]))
                            @php $url = $allCustomers[0]->agentCustomer["user_image"]; $agent = ""; $agentID = $allCustomers[0]->agentCustomer['id']? $allCustomers[0]->agentCustomer['id']:'';@endphp
                            
                            @php 
                            //dd("fuck");
                                $image = $url ? url('/')."/public".Storage::url($url) : url('/')."/public/dist/img/user-dummy-pic.png";
                                //dd($image);
                            @endphp
                            
                            @endif
                                <td>{{$allCustomers[0]->agentCustomer['first_name'] ? ucfirst($allCustomers[0]->agentCustomer['first_name']) : "NA"}}</td>
                                <td>{{$allCustomers[0]->agentCustomer['last_name'] ? ucfirst($allCustomers[0]->agentCustomer['last_name']) : "NA"}}</td>
                                <td> <img src="{{$image?$image:''}}" style="width: 48px"; alt="NA"></td>
                                <td>{{$agent_email[0]->email ?  $agent_email[0]->email:"NA"}}</td>
                                <td>{{$allCustomers[0]->agentCustomer['marital_status'] ? ucfirst($allCustomers[0]->agentCustomer['marital_status']):"NA"}}</td>
                                <td>{{$allCustomers[0]->agentCustomer['gender'] ? ucfirst($allCustomers[0]->agentCustomer['gender']):"NA"}}</td>
                                <td>{{$allCustomers[0]->agentCustomer['date_of_birth'] ? date('d-M-Y',strtotime($allCustomers[0]->agentCustomer['date_of_birth'])):"NA"}}</td>
                                <td>{{$allCustomers[0]->agentCustomer['phone_number']?$allCustomers[0]->agentCustomer['phone_number']:"NA"}}</td>
                                <td>{{$allCustomers[0]->agentCustomer['education']?ucfirst($allCustomers[0]->agentCustomer['education']):"NA"}}</td>
                                <td><textarea name="message" cols="40" disabled>{{$allCustomers[0]->agentCustomer['address']?$allCustomers[0]->agentCustomer['address']:"NA"}}</textarea></td>
                            </tr>
                            
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- /div -->
   
        <table id="customer" class="stripe row-border order-column" style="width:100%">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Customer Id</th>
                    <th>email</th>
                    <th>Date Of Birth</th>
                    <th>Residential Address</th>
                    <th>phone_number</th>
                    <th>Adhar Card Number</th>
                    <th>Pan Card Number</th> 
                    <th>Loan Amount</th>
                    <th>EMI</th>
                    <th>Verification State</th>
                    <th>Period</th>
                    
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            
            @if(!empty($allCustomers) && isset($allCustomers))
                @foreach($allCustomers as $key => $customer)
                    @php $key++;@endphp
                    @if($customer->status == "0")
                    @php $style = "style= background-color:#ffff"; @endphp
                    @elseif($customer->status == "1")
                    @php $style = "style= background-color:#ffff99"; @endphp
                    @elseif($customer->status == "2")
                    @php $style = "style= background-color:#d9ffcc"; @endphp
                    @else 
                    @php $style = "style= background-color:#ffe6e6"; @endphp
                    @endif
                    <tr <?= $style;?>>
                        <td>{{$key}}</td>
                        <td>{{$customer['name'] ? ucfirst($customer['name']): "NA" }}</td> 
                        <td>{{$customer->customer_id ? $customer->customer_id:"NA"}}</td>
                        <td>{{$customer->email ? $customer->email : "NA"}} </td>
                        <td>{{$customer->date_of_birth ? date('d-M-Y',strtotime($customer->date_of_birth)) : "NA"}}</td>
                        <td>{{$customer->residential_address ? $customer->residential_address : "NA"}}</td>
                        <td>{{$customer->phone_number ? $customer->phone_number : "NA"}}</td>
                        <td>{{$customer->adhar_card_number ? $customer->adhar_card_number : "NA"}}</td>
                        <td>{{$customer->pan_card_number ? $customer->pan_card_number : "NA"}}</td>
                        <td>{{$customer->loan_amount ? $customer->loan_amount : "NA"}}</td>
                        <td>{{$customer->EMI ? $customer->EMI : "NA"}}</td>
                        <td>
                            @php $customerId = $customer->id; @endphp
                            @if($customer->status == 0)
                            <select class = 'status' id="{{$customer->id}}">
                            <option value = " ">Select field boy </option>
                                @foreach($customer->fieldBoy as $key => $boy)
                                    <option value = "{{$boy->id.'-'.$boy->first_name.'-'.$boy->last_name.'-'.$customerId}}">{{$boy->first_name.' '.$boy->last_name}}</option>
                                @endforeach 
                            </select>    
                            @elseif($customer->status == 1)
                                <p>In Verification By {{$customer->field_boy}}</p>
                            @elseif($customer->status == 2)
                                <p>Approved By {{$customer->field_boy}}</p>
                            @else
                                <p>Declined By {{$customer->field_boy}}</p>
                            @endif
                                
                        </td>
                        <td>{{$customer->Period ? $customer->Period : "NA"}}</td>
                        <td>
                            <a href="{{url('update-customer-request/'.$customer->id.'/'.'6'.'/'.$customer->agentCustomer->phone_number)}}/{{$agentID}}"><i class="fa fa-close" style="font-size:24px;color:red"></i></a>&nbsp;&nbsp;
                            <a href="{{url('update-customer-request/'.$customer->id.'/'.'5'.'/'.$customer->agentCustomer->phone_number)}}/{{$agentID}}"><i class="fa fa-check"  style="font-size:22px;color:green" aria-hidden="true"></i></a>
                        </td>  
                    </tr>
                @endforeach
            @else
            <tr><p>USER NOT FOUND</p></tr>   
            @endif 
            </tbody> 
        </table>
    </section>    
    <!-- /.content -->


@endsection

          
@section('script')
<script>
    $(document).ready(function() {
        var table = $('#customer').removeAttr('width').DataTable( {
            scrollY:        "400px",
            scrollX:        true,
            scrollCollapse: true,
            paging:         true,
            columnDefs: [
                { width: 40, targets: 0 }
            ],
            fixedColumns: true
        });

        // select value from dropdown
        $(".status").change(function () {
            var data = this.value;
            
            $.ajax({
                type:'post',
                url: "{{URL::route('asign-field-boy')}}",
                data:{'data':data,"_token": "{{ csrf_token() }}"},
                dataType:'json',
                success: function(result){
                        alert(result.message);
                    location.reload();
                }
            });    
        });
        //toggle for agent details
        $(".btn-warning").click(function(){
            $(".headding_1").slideToggle();
        });
        // var r =$('#status option:selected').text();
        //alert(r);
    });  


 
</script>
@endsection	
 

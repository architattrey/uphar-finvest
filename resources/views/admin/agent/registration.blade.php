@extends('admin.layouts.app')

@section('content')

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
        <li class="active">Agent Reg.</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      @if(Session::has('flash_message'))
        <div class="alert alert-success"><span class="glyphicon glyphicon-ok"></span><em>{!! session('flash_message') !!}</em></div>
      @elseif(Session::has('flash_error'))
      <div class="alert alert-danger"><span class="glyphicon glyphicon-ok"></span><em> {!! session('flash_error') !!}</em></div>
      @endif
        <div class="row">
          <!-- ./col -->
          <div class ="col-md-3"></div>
          <!-- form -->
          <div class ="col-md-6 register" style="background: #fff;padding: 0 15px;">
            @if(!empty($agent) && isset($agent))
              <h2>Update Sales Executive/Verification details</h2>
            @else
            <h2 style=" text-align: center;padding: 15px 0;">Register New Executive/Verification</h2>
            @endif
            <form action="{{route('registeration-submit')}}" method="post" enctype="multipart/form-data">
            @csrf
            <input type="hidden" name="agent_id" value = "{{(!empty($agent[0]->id))?$agent[0]->id:''}}">
            <input type="hidden" name="user_id" value = "{{(!empty( $agent[0]['userAgents']->id))? $agent[0]['userAgents']->id:''}}">
              <!-- user type -->
              @if(empty($agent))
              <div class="form-group">
                <label for="user_type" style="margin-left: 13px;">User Type</label>
                <select name="user_type" style="width: 100%; padding: 10px; border-radius: 21px; border-color: #ccc;">
                  <option value="">Select User</option>
                  <option value="2">Sales Executive</option>
                  <option value="3">Verification</option>
                </select>
              </div>
              @endif
              <!-- First name -->
              <div class="form-group" style="margin-bottom: 15px; font-size: 16px;">
                <label for="first_name" style="margin-left: 13px;">First Name</label>
                <input type="text" class="form-control" id="first_name" placeholder="Enter First Name" name="first_name" value="{{(!empty($agent[0]->first_name))?$agent[0]->first_name:''}}" style ="border-radius: 21px; height: 41px;" required>
              </div>
              <!-- Last name -->
              <div class="form-group">
                <label for="last_name" style="margin-left: 13px;">Last Name</label>
                <input type="text" class="form-control" id="last_name" placeholder="Enter Last Name" name="last_name" value="{{(!empty($agent[0]->last_name))?$agent[0]->last_name:''}}"   style="border-radius: 21px; height: 41px;" required>
              </div>
              <!-- Email -->
              <div class="form-group">
                <label for="email" style="margin-left: 13px;">Email</label>
                <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" value="{{(!empty($agent[0]['userAgents']) || !empty($agent[0]['userAgents']->email))?$agent[0]['userAgents']->email:''}}"
                style="border-radius: 21px; height: 41px; " required>
              </div>
              <!-- Phone number -->
              <div class="form-group">
                <label for="phone_number" style="margin-left: 13px;">Phone Number</label>
                <input type="number" class="form-control" id="phone_number" placeholder="Enter Phone Number" name="phone_number"  max-length = "10" value="{{(!empty($agent[0]->phone_number))?$agent[0]->phone_number:''}}" 
                style="border-radius: 21px; height: 41px;"required>
              </div>
              <!-- address -->
              <div class="form-group">
                <label for="address" style="margin-left: 13px;">Address:</label>
                <input type="text" class="form-control" id="address" placeholder="Enter Address" name="address" value="{{(!empty($agent[0]->address))?$agent[0]->address:''}}" style="border-radius: 21px; height: 41px; "required>
              </div>
              <!-- state -->
              <div class="form-group">
                <label for="state" style="margin-left: 13px;">State:</label>
                <input type="text" class="form-control" id="state" placeholder="Enter State" name="state" value="{{(!empty($agent[0]->state))?$agent[0]->state:''}}" style="border-radius: 21px; height: 41px; "required>
              </div>
              <!-- city -->
              <div class="form-group">
                <label for="city" style="margin-left: 13px;">City:</label>
                <input type="text" class="form-control" id="city" placeholder="Enter City" name="city" value="{{(!empty($agent[0]->city))?$agent[0]->city:''}}" style="border-radius: 21px; height: 41px; "required>
              </div>
              <!-- gender -->
              <div class="form-group">
                <label for="gender" style="margin-left: 13px;">Gender:</label>
                <select name="gender" style="width: 100%; padding: 10px; border-radius: 21px; border-color: #ccc;">
                  <option value="{{(!empty($agent[0]->gender))?$agent[0]->gender:''}}">{{(!empty($agent[0]->gender))?ucfirst($agent[0]->gender):'Select Gender'}}</option>
                  <option value="male">Male</option>
                  <option value="female">Female</option>
                  <option value="other">Other</option>
                </select>
              </div>
              <!-- marital status -->
              <div class="form-group">
                <label for="marital_status" style="margin-left: 13px;">Marital Status:</label>
                <select name="marital_status" style="width: 100%; padding: 10px; border-radius: 21px; border-color: #ccc;">
                <option value="{{(!empty($agent[0]->marital_status))?$agent[0]->marital_status:''}}">{{(!empty($agent[0]->marital_status))?ucfirst($agent[0]->marital_status):'Select Marital Status'}}</option>
                  <option value="single">Single</option>
                  <option value="married">Married</option>
                </select>
              </div>
              <!-- education -->
              <div class="form-group">
                <label for="education" style="margin-left: 13px;">Education</label>
                <select name="education" id= "education" style="width: 100%; padding: 10px; border-radius: 21px; border-color: #ccc;">
                <option value="{{(!empty($agent[0]->education))?$agent[0]->education:''}}">{{(!empty($agent[0]->education))?$agent[0]->education:'Select Education type'}}</option>
                  <option value="graduate">Graduate</option>
                  <option value="post graduate">Post Graduate</option>
                  <option value="under graduate">Under Graduate</option>
                </select>
              </div>
              <!-- DOB -->
              <div class="form-group">
                <label for="date_of_birth" style="margin-left: 13px;">Date Of Birth:</label>
                <input type="date" class="form-control" id="date_of_birth" placeholder="Date Of Birth" name="date_of_birth" value="{{(!empty($agent[0]->date_of_birth))? date('d-M-Y',strtotime($agent[0]->date_of_birth)):''}}" style="border-radius: 21px;     height: 41px; " required>{{(!empty($agent[0]->date_of_birth))? date('d-M-Y',strtotime($agent[0]->date_of_birth)):''}}
              </div>
              @if(empty($agent))
              <!-- upload image -->
              <div class="form-group">
                <label for="user_image" style="margin-left: 13px;">Upload Image</label>
                <input type="file" class="form-control" style="border-radius: 21px; height: 41px; "id="user_image" name="user_image" value ="{{(!empty($agent[0]->user_image))?$agent[0]->user_image:''}}" >
              </div>
              <!-- password -->
              <div class="form-group">
                <label for="password" style="margin-left: 13px;">Password:</label>
                <input type="password" class="form-control" style="border-radius: 21px; height: 41px; "id="password" name="password">
              </div>
              @endif
              <!-- submit button -->
              <button type="submit" class="btn btn-success" style=" float: right; margin: 16px;">{{!empty($agent)?'Update':'Submit'}}
               </button>
            </form>
            </div>
          </div>
          <!-- form -->
          <div class ="col-md-3"></div>
            <!-- ./col -->
        </div>
        <div class="row">
        
        </div>
        <!-- /.row (main row) -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
@endsection
@section('css')

<style>

.register h2{
  text-align: center;
  padding: 15px 0;
}
form{
  background-color: #ffff;
  padding: 15px 30px;
}
label {
    display: inline-block;
    max-width: 100%;
    margin-bottom: 12px;
    font-weight: 700;
}
</style>
@endsection

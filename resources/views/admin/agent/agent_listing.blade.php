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
        <li class="active">All Agents</li>
      </ol>
    </section>

    <!-- view list of agents -->
    <!-- Main content -->
    <section class="content">
        @if(Session::has('flash_message'))
        <div class="alert alert-success"><span class="glyphicon glyphicon-ok"></span><em> {!! session('flash_message') !!}</em></div>
        @elseif(Session::has('flash_error'))
        <div class="alert alert-danger"><span class="glyphicon glyphicon-ok"></span><em> {!! session('flash_error') !!}</em></div>
        @endif
        <table id="example" class="stripe row-border order-column" style="width:100%">
            <thead>
                <tr>
                    <th>#</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Image</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th>Marital Status</th>
                    <th>Date Of Birth</th>
                    <th>Education</th>
                    <th>Phone Number</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @if(!empty($agents) && isset($agents))
                    @foreach($agents as $key => $agent)
                    @php 
                        $key++;
                        $image = $agent->user_image ? url('/')."/public".Storage::url($agent->user_image) : url('/')."/public/dist/img/user-dummy-pic.png";
                    @endphp
                        <tr>
                            <td>{{$key}}</td>
                            <td>{{$agent->first_name ? ucfirst($agent->first_name): "NA" }}</td>
                            <td>{{$agent->last_name ? ucfirst($agent->last_name):"NA"}}</td>
                            <td> <img src="{{$image}}" style="width: 48px;" alt="NA"></td>
                            
                            <td>{{$agent->userAgents ? $agent->userAgents->email : "NA"}} </td>
                            <td>{{$agent->gender ? ucfirst($agent->gender) : "NA"}}</td>
                            <td>{{$agent->address ? $agent->address : "NA"}}</td>
                            <td>{{$agent->marital_status ? ucfirst($agent->marital_status): "NA"}}</td>
                            <td>{{$agent->date_of_birth ? date('d-M-Y',strtotime($agent->date_of_birth)) : "NA"}}</td>
                            <td>{{$agent->education ? ucfirst($agent->education) : "NA"}}</td>
                            <td>{{$agent->phone_number ? $agent->phone_number : "NA"}}</td>
                            <td>@if($agent->user_type =='2')
                                <a href="{{url('all-customers/'.$agent->id)}}"><i class="fa fa-eye"
                                style="font-size:16px;color:blue" aria-hidden="true"></i></a>&nbsp;
                                @endif
                                <a href="{{url('update-agent/'.$agent->id)}}"><i class="fa fa-pencil" style="font-size:16px;color:green" aria-hidden="true"></i></a>&nbsp;
                                <a href="{{url('delete-agent/'.$agent->id)}}"><i class="fa fa-trash" style="font-size:16px;color:red" aria-hidden="true"></i></a>&nbsp;
                            </td>
                        </tr>
                    @endforeach 
                @else
                <tr><p>Agents not found</p></tr>  
                @endif  
            </tbody> 
        </table>
    </section>    
    <!-- /.content -->
@endsection
@section('script')
<script>
 
    $(document).ready(function() {
        var table = $('#example').removeAttr('width').DataTable({
            scrollY:        "400px",
            scrollX:        true,
            scrollCollapse: true,
            paging:         true,
            columnDefs: [
                { width: 200, targets: 0 }
            ],
            fixedColumns: true
        });
    });
</script>
@endsection	
 

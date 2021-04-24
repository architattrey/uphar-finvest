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
        <li class="active">All Pendings Customers</li>
      </ol>
    </section>

    <!-- view list of agents -->
    <!-- Main content -->
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="back-bg" style="background-color:#fff; height: 64px; margin-top: 20px;">
                </div>
            </div>
        </div>
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
                    <th>Period</th>
                </tr>
            </thead>
            <tbody>
            @if(!empty($pendingCustomers) && isset($pendingCustomers))
                @foreach($pendingCustomers as $key => $customer)
                    @php $key++;@endphp
                    <tr style= "background-color:#ffe6e6;">
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
                        <td>{{$customer->Period ? $customer->Period : "NA"}}</td>
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
    });  
</script>
@endsection	
 

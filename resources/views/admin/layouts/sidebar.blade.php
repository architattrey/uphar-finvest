
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="<?=url('/')?>/public/dist/img/uphaar_home_logo.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p> {{ucfirst(Auth::User()->name)}}</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>
        <li class="active treeview">
          <a href="{{route('dashboard')}}">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
           </a>
         
        </li>
        <!-- agents tab -->
        <li class="treeview">
          <a href="#">
            <i class="fa fa-pie-chart"></i>
            <span>Agents</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
            
          <ul>
            <li><a href="{{route('agent-registration')}}"><i class="fa fa-circle-o"></i>&nbsp; Registar</a></li>
            <li><a href="{{url('get-all-agent','2')}}"><i class="fa fa-circle-o"></i>&nbsp; All Agents</a></li>
            <li><a href="{{url('get-all-verification','3')}}"><i class="fa fa-circle-o"></i>&nbsp; All Verifications</a></li>
            <li><a href="{{route('all-pending-customers')}}"><i class="fa fa-circle-o"></i>&nbsp; Pending Customers</a></li>
            <li><a href="{{route('all-decline-customers')}}"><i class="fa fa-circle-o"></i>&nbsp; Decline Customers</a></li>
            <li><a href="{{route('all-approved-customers')}}"><i class="fa fa-circle-o"></i>&nbsp; Approved Customers</a></li>
          </ul>
        </li>
        <!-- -->
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
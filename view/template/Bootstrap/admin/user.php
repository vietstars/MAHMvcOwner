<div class="content-wrapper">
  <section class="content-header">
        <h1>
          	<?=$title?> <small>controller</small>
        </h1>
        <ol class="breadcrumb">
          	<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
          	<li class="active">User manage</li>
        </ol>
    </section>
    <section class="content">
      <!-- content -->
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">User List</h3>
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-modal="open" data-toggle="tooltip" data-target="#new-items" data-placement="top" data-guide="true" data-title="new-btn" title="Add new user"><i class="fa fa-user-plus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" data-placement="top" title="Show/hide this tab"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" data-placement="top" title="Temporary hide this tab"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <table id="user-list" class="table table-bordered table-hover dataTable">
            <thead>
            <tr>
              <th>Display name/ <small>Email</small></th>
              <th>NRIC no/ <small>Gender</small></th>
              <th>Birthdate/ <small>Join date</small></th>
              <th>Phone/ <small>Address</small></th>
              <th>Visited times/ <small>Last visited</small></th>
              <th>Action</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
            <!-- <tfoot>
            <tr>
              <th>Display name/ <small>Email</small></th>
              <th>NRIC no/ <small>Gender</small></th>
              <th>Birthdate/ <small>Join date</small></th>
              <th>Phone/ <small>Address</small></th>
              <th>Visited times/ <small>Last visited</small></th>
              <th>Action</th>
            </tr>
            </tfoot> -->
          </table>
        </div>
        <div class="box-footer">
          When you searching and with date searching, please you input like yyyy-mm-dd!
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /content -->
    </section> 
</div>
<div class="fixed-action-btn horizontal">
    <a class="btn btn-danger">
        <i class="fa fa-pencil fa-lg" data-toggle="tooltip" data-placement="left" title="Action tool"></i>
    </a>
    <ul data-activity="#user-list">
        <li><a class="btn btn-warning multi-lock-btn"><i class="fa fa-lock" data-toggle="tooltip" data-placement="left" title="Multiple lock"></i></a></li>
        <li><a class="btn btn-success multi-unlock-btn"><i class="fa fa-unlock" data-toggle="tooltip" data-placement="left" title="Multiple unlock"></i></a></li>
        <li><a class="btn btn-danger multi-delete-btn"><i class="fa fa-trash" data-toggle="tooltip" data-placement="left" title="Multiple delete"></i></a></li>
    </ul>
</div>
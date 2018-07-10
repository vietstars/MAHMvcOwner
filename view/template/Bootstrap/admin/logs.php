<div class="content-wrapper">
  <section class="content-header">
        <h1>
          	<?=$title?>
        </h1>
        <ol class="breadcrumb">
          	<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
          	<li class="active">Transaction logs</li>
        </ol>
    </section>
    <section class="content">
      <div class="row">
        <div class="col-xs-8">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Logs</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool delete-log" data-log="<?=date('d-m-Y')?>"><i class="fa fa-trash" data-toggle="tooltip" data-placement="left" title="Delete this logs"></i></button>
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus" data-toggle="tooltip" data-placement="left" title="Show/hide this tab"></i></button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove" data-toggle="tooltip" data-placement="left" title="Temporary hide this tab"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="logs-list" class="table table-bordered table-hover dataTable">
                <thead>
                <tr>
                  <th width="20%">IP</th>
                  <th width="12%">Visitor</th>
                  <th width="12%">Browser<small>[version]</small></th>
                  <th width="12%">Os</th>
                  <th width="34%">Url</th>
                  <th width="20%">Time</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
                <!-- <tfoot>
                <tr>
                  <th>IP</th>
                  <th>Browser<small>[version]</small></th>
                  <th>Os</th>
                  <th>Url</th>
                  <th>Time</th>
                </tr>
                </tfoot> -->
              </table>
            </div>
            <div class="box-footer">
              Please click date on calendar for change the logs!
            </div>
            <!-- /.box-body -->
          </div>
        </div>
        <div class="col-xs-4">
          <div class="box box-default">
            <div class="box-header with-border">
              <i class="fa fa-calendar"></i>
              <h3 class="box-title">Calendar</h3>
              <div class="box-tools pull-right">                
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus" data-toggle="tooltip" data-placement="left" title="Show/hide this tab"></i></button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove" data-toggle="tooltip" data-placement="top" title="Temporary hide this tab"></i></button>
              </div>
            </div>
            <div class="box-body no-padding">
              <div id="calendar" style="width: 100%" data-log="log.csv" class='bg-teal-gradient'></div>
            </div>
            <div class="box-footer">
              If you can't view records when it's really had,<br>maybe the log file is big size!
            </div>
          </div>
        </div>
      </div>
    </section> 
</div>

<div class="content-wrapper meta-manage">
  <section class="content-header">
        <h1>
            <?=$title?> <small>controller</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?=URL?>admin"><i class="fa fa-dashboard"></i> System</a></li>
            <li class="active"><?=$title?></li>
        </ol>
    </section>
    <section class="content">      
        <div class="row">
            <div class="col-xs-8">
              <div class="box box-default">
                <div class="box-header with-border">
                  <h3 class="box-title">Image list</h3>
                  <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool delete-image" data-log="<?=date('d-m-Y')?>"><i class="fa fa-trash" data-toggle="tooltip" data-placement="left" title="Delete this images"></i></button>
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" data-placement="top" title="Show/hide this tab"><i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" data-placement="top" title="Temporary hide this tab"><i class="fa fa-remove"></i></button>
                  </div>
                </div>
                <div class="box-body show-image">
                </div>
                <div class="box-footer">
                </div>
              </div>
            </div>
            <div class="col-xs-4">
              <div class="box box-default img-uploader">
                <div class="box-header with-border">
                  <i class="fa fa-calendar"></i>
                  <h3 class="box-title">Image uploader</h3>
                  <div class="box-tools pull-right">   
                    <div class="input-group input-group-sm pull-right select-folder">
                      <span class="input-group-addon">Upload to:</span>
                      <input id="select-folder" type="text" class="form-control" data-response="#upload-image" data-append=".appending" data-source="<?=URL.'admin'.S.CTL?>/getFolder" value="underfined">
                      <div class='appending'></div>
                    </div>

                  </div>
                </div>
                <div class="box-body no-padding">
                  <form action="#" class="dropzone" id="upload-image" data-folder='underfined'>
                    <div class="dz-message">
                      <h3>Drop files here or <br>click to upload.</h3>
                    </div>
                  </form>
                </div>
                <div class="box-footer">
                  <div class="text-left">
                    Please select upload to folder before upload!
                  </div>
                  <a class="btn btn-icon-toggle ink-reaction btn-danger dtn-delete-template"><i class="fa fa-trash" data-toggle="tooltip" data-placement="left" title="Delete templates images"></i></a>
                </div>
              </div>
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
                  <div id="calendar" style="width: 100%" data-log="image" class='bg-teal-gradient'></div>
                </div>
                <div class="box-footer">
                  Please select day for view image upload on that day!
                </div>
              </div>
            </div>          
        </div>
    </section> 
</div>
<div class="modal fade" id="show-image">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" class="close btn-icon-toggle ink-reaction" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"><i class="fa fa-close"></i></span></span></button>
        <div class="info-box"></div>
      </div>
    </div>
  </div>
</div>
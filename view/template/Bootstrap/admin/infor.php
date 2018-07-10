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
      <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">System Information</h3>
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" data-placement="top" title="Show/hide this tab"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" data-placement="top" title="Temporary hide this tab"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <div class="box-body">
          <div class="row">
            <div class="col-xs-9 show-system">
              <div class="col-xs-6 email-form">
                <label for="template">Email information</label>
                <form action="<?=URL.'admin/'.CTL.'/email'?>" method="post">
                  <?php foreach ($email as $k => $v):?>
                  <div class="input-group input-group-sm">
                    <span class="input-group-addon first-item"><?=str_replace('_',' ',$v->sys_key)?></span>
                    <input type="text" name="<?=$v->sys_key?>" class="form-control second-item" value="<?=$v->sys_value?>">
                  </div>
                  <?php endforeach;?>
                  <button type="submit" class="btn btn-info btn-submit pull-right" data-toggle="tooltip" data-placement="left" title="" data-original-title="Update for this email information"><i class="fa fa-send-o"></i> Update email</button>
                </form>
              </div>
              <div class="col-xs-6 app-form">
                <label for="template">Application information</label>
                <form action="<?=URL.'admin/'.CTL.'/application'?>" method="post">
                <div class="input-group input-group-sm">
                  <span class="input-group-addon first-item">Application key</span>
                  <input type="text" name="appkey" class="form-control second-item" value="<?=$app->sys_key?>">
                </div>
                <div class="input-group input-group-sm">
                  <span class="input-group-addon first-item">Domain</span>
                  <input type="text" name="domain" class="form-control second-item" value="<?=$_SERVER['SERVER_NAME']?>">
                </div>
                <div class="input-group input-group-sm">
                  <span class="input-group-addon first-item">Expiry date</span>
                  <input type="text" name="expiry" class="form-control second-item" value="<?=$app->sys_value?>">
                </div>
                <button type="submit" class="btn btn-info btn-submit pull-right" data-toggle="tooltip" data-placement="left" title="" data-original-title="Update for application information"><i class="fa fa-send-o"></i> Update Application</button>
                </form>
              </div>
              <div class="col-xs-6 data-form">
                <label for="template">Database information</label>
                <form action="<?=URL.'admin/'.CTL.'/system'?>" method="post">
                <?php foreach($sys as $k => $v):?>
                  <div class="input-group input-group-sm">
                    <span class="input-group-addon first-item"><?=str_replace('_',' ',$k)?></span>
                    <input type="text" name="<?=$k?>" class="form-control second-item" value="<?=$v?>">
                  </div>
                <?php endforeach;?>
                <button type="submit" class="btn btn-info btn-submit pull-right" data-toggle="tooltip" data-placement="left" title="" data-original-title="Update for database information"><i class="fa fa-send-o"></i> Update Batabase</button>
                </form>
              </div>
            </div>
            <div class="col-xs-3 template-setting">
              <div class="form-group">
                <label for="template">System template</label>
                <select id="template" name="template" class="form-control">
                  <option value="default">Material</option>
                  <?php foreach ($templates as $layout):?>
                    <option value="<?=$layout?>" <?= $layout==$current?'selected':'';?>><?=$layout?></option>
                  <?php endforeach;?>
                </select>
              </div>
            </div>
          </div>
        </div>
    </section> 
</div>
<div class="modal fade" id="new-items">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">New meta data</h4>
      </div>
      <div class="modal-body">
        <div class="input-group">
          <span class="input-group-addon" width="100px">Name</span>
          <input type="text" class="form-control" name="name" placeholder="Meta name">
        </div>
        <div class="input-group">
          <span class="input-group-addon">Content</span>
          <input type="text" class="form-control" name="content" placeholder="Meta content">
        </div>
        <div class="input-group">
          <span class="input-group-addon">Type</span>
          <input type="text" class="form-control" name="type" placeholder="meta" value='meta'>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Close</button>
        <button id="meta-btn" type="button" class="btn btn-primary">Submit</button>
      </div>
    </div>
  </div>
</div>
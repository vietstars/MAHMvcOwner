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
          <h3 class="box-title">Meta data (SEO)</h3>
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-modal="open" data-toggle="tooltip" data-target="#new-items" data-placement="top" data-guide="true" data-title="new-btn" title="Add new meta"><i class="fa fa-code"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" data-placement="top" title="Show/hide this tab"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" data-placement="top" title="Temporary hide this tab"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <div class="box-body">
          <div class="row">
            <div class="col-xs-12 show-meta"></div>
            <!-- <div class="col-xs-3 template-setting">
              <div class="form-group">
                <label for="template">System template</label>
                <select id="template" name="template" class="form-control">
                  <option value="default">Material</option>
                  <?php foreach ($templates as $layout):?>
                    <option value="<?=$layout?>" <?= $layout==$current?'selected':'';?>><?=$layout?></option>
                  <?php endforeach;?>
                </select>
              </div>
            </div> -->
          </div>
          <div class="box-footer">
            When you change value of template system will change skin (default is first skin)!
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
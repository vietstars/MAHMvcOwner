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
          <h3 class="box-title">Menu record</h3>
          <div class="box-tools pull-right">
            <button type="button" id="new-menuItem" class="btn btn-box-tool" data-modal="open" data-toggle="tooltip" data-target="#new-items" data-placement="top" data-guide="true" data-title="new-btn" title="Add new menu"><i class="fa fa-bars"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" data-placement="top" title="Show/hide this tab"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" data-placement="top" title="Temporary hide this tab"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <div class="box-body">
          <div class="row show-menu"></div>
          <div class="box-footer">
            If sub menu can't found it's parents menu, which will not show on menu list!
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
        <h4 class="modal-title">New menu</h4>
      </div>
      <div class="modal-body">
        <div class="input-group">
          <span class="input-group-addon" width="100px">Menu</span>
          <input type="text" class="form-control" name="menu" placeholder="menu">
        </div>
        <div class="input-group">
          <span class="input-group-addon">Controller</span>
          <input type="text" class="form-control" name="controller" placeholder="controller">
        </div>
        <div class="input-group">
          <span class="input-group-addon">Action</span>
          <input type="text" class="form-control" name="action" placeholder="action">
        </div>
        <div class="input-group">
          <span class="input-group-addon">Icon</span>
          <input id="new-menuIcon" type="text" class="form-control" name="icon" data-modal="open" data-target="#getIcons" placeholder="icon">
        </div>
        <div class="input-group">
          <span class="input-group-addon">Parent</span>
          <select id="new-menuParent" class="form-control" name="parents"><option value=0>root</option></select>
        </div>
        <div class="input-group">
          <span class="input-group-addon">Sorting</span>
          <input type="text" class="form-control" name="sorted" placeholder="sort">
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Close</button>
        <button id="menu-btn" type="button" class="btn btn-primary">Submit</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="getIcons">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Icon list</h4>
      </div>
      <div class="modal-body row icon-list">
        <?php foreach($icon as $i):?>
          <a class="col-xs-4 icon-item"><i class="<?=$i?> fa-lg"></i> <small><?=$i?></small></a>
        <?php endforeach;?>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<div class="fixed-action-btn horizontal">
    <a class="btn btn-danger">
        <i class="fa fa-pencil fa-lg" data-toggle="tooltip" data-placement="left" title="Action tool"></i>
    </a>
    <ul data-activity=".show-menu">
        <li><a class="btn btn-warning multi-lock-btn"><i class="fa fa-lock" data-toggle="tooltip" data-placement="left" title="Multiple lock"></i></a></li>
        <li><a class="btn btn-success multi-unlock-btn"><i class="fa fa-unlock" data-toggle="tooltip" data-placement="left" title="Multiple unlock"></i></a></li>
        <li><a class="btn btn-danger multi-delete-btn"><i class="fa fa-trash" data-toggle="tooltip" data-placement="left" title="Multiple delete"></i></a></li>
        <li><a class="btn btn-info multi-edit-btn"><i class="fa fa-send-o" data-toggle="tooltip" data-placement="left" title="Multiple edit"></i></a></li>
    </ul>
</div>
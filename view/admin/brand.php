<div id="base"><!-- DIV BASE -->
    <div id="content">      
        <section class="style-default-bright">
            <div class="section-body">
              <div class="card">
                <div class="card-head style-primary">
                  <div class="tools pull-left">
                    <h4>Brand list</h4>
                  </div>
                  <div class="tools fixed-action-btn">
                    <a href="#" class="btn btn-icon-toggle ink-reaction hidden-xs"><i class="fa fa-ellipsis-v"></i></a>
                    <ul data-activity=".show-menu">
                      <li><a class="btn btn-danger multi-delete-btn"><i class="fa fa-trash" data-toggle="tooltip" data-placement="left" title="Multiple delete"></i></a></li>
                      <li><a class="btn btn-success multi-unlock-btn"><i class="fa fa-unlock" data-toggle="tooltip" data-placement="left" title="Multiple unlock"></i></a></li>
                      <li><a class="btn btn-warning multi-lock-btn"><i class="fa fa-lock" data-toggle="tooltip" data-placement="left" title="Multiple lock"></i></a></li>
                      <!-- <li><a class="btn btn-info multi-edit-btn"><i class="fa fa-send-o" data-toggle="tooltip" data-placement="left" title="Multiple edit"></i></a></li> -->
                      <li><a class="btn btn-accent" id="new-menuItem" data-modal="show" data-target="#new-items"><i class="fa fa-plus" data-toggle="tooltip" data-placement="left" title="Add new menu"></i></a></li>
                    </ul>
                  </div>
                </div>
                <div class="card-tiles">
                  <div class="hbox-md">
                    <div class="show-menu">
                    </div>                    
                  </div>
                </div>
              </div>
            </div>
        </section>
    </div>
<div class="modal fade" id="new-items">
<form id="new_brand" action="<?=URL?>admin/brand/newItem" method="post" enctype="multipart/form-data">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">New Brand</h4>
      </div>
      <div class="modal-body">
        <div class="form-group floating-label">
          <input id="menu" type="text" class="form-control" name="name">
          <label for="name">Name</label>
        </div>
        <div class="form-group floating-label">
          <input id="new-menuIcon" type="text" class="form-control" name="icon" data-modal="show" data-target="#getIcons">
          <label for="icon">Icon</label>
        </div>
        <div class="form-group floating-label">
          <input type="file" name="file" id="file" class="new-img" data-name=".image-name">
          <input id="image" type="text" class="form-control image-name" name="image">
          <label for="image">Image</label>
        </div>
        <div class="form-group floating-label">
          <input type="text" class="form-control" name="sorted" id="sorted">
          <label for="sorted">Sorting</label>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Close</button>
        <button id="menu-btn" type="submit" class="btn btn-primary">Submit</button>
      </div>
    </div>
  </div>
</form>
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
<div class="modal fade" id="getImage">
  <form action="<?=URL?>admin/brand/changeImg" method="post" enctype="multipart/form-data">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Current Image</h4>
            <input type="hidden" name="id" class="hidden_id">
        </div>
        <div class="modal-body row">
          <div class="current-image">
            <input type="file" name="file" class="update-img" id="file" data-responsive=".current-image">
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary pull-left">Update</button>
        </div>
      </div>
    </div>
  </form>
</div>
<div id="base"><!-- DIV BASE -->
    <div id="content">      
        <section class="style-default-bright">
            <div class="section-body">
              <div class="card">
                <div class="card-head style-primary">
                  <div class="tools pull-left">
                    <h4>Menu list</h4>
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
                    <div class="row show-menu"></div>
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
        <h4 class="modal-title">New menu</h4>
      </div>
      <div class="modal-body">
        <div class="form-group floating-label">
          <input id="menu" type="text" class="form-control" name="menu">
          <label for="menu">Menu</label>
        </div>
        <div class="form-group floating-label">
          <input type="text" class="form-control" name="controller" id="controller">
          <label for="controller">Controller</label>
        </div>
        <div class="form-group floating-label">
          <input type="text" class="form-control" name="action" id="action">
          <label for="action">Action</label>
        </div>
        <div class="form-group floating-label">
          <input id="new-menuIcon" type="text" class="form-control" name="icon" id="icon" data-modal="show" data-target="#getIcons">
          <label for="icon">Icon</label>
        </div>
        <div class="form-group floating-label">
          <select id="new-menuParent" class="form-control" name="parents" id="parents"><option value=0>root</option></select>
          <label for="parents">Parent</label>
        </div>
        <div class="form-group floating-label">
          <input type="text" class="form-control" name="sorted" id="sorted">
          <label for="sorted">Sorting</label>
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
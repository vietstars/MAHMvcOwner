<div id="base"><!-- DIV BASE -->
    <div id="content">      
        <section class="style-default-bright">
            <div class="section-body">
              <div class="card">
                <div class="card-head style-primary">
                  <div class="tools pull-left">
                    <h4>Meta list</h4>
                  </div>
                  <div class="tools fixed-action-btn">
                    <a href="#" class="btn btn-icon-toggle ink-reaction hidden-xs"><i class="fa fa-ellipsis-v"></i></a>
                    <ul data-activity="#user-list">
                      <li><a class="btn btn-floating btn-primary multi-lock-btn"><i class="fa fa-plus" data-modal="show" data-target="#new-items" data-toggle="tooltip" data-placement="left" title="New user"></i></a></li>
                    </ul>
                  </div>
                </div>
                <div class="card-tiles">
                  <div class="hbox-md col-md-12">
                    <div class="hbox-column show-meta">                     
                    </div>
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
        <div class="form-group floating-label">
          <input id="meta-name" type="text" class="form-control" name="name">
          <label for="meta-name">Name</label>
        </div>
        <div class="form-group floating-label">
          <input id="meta-content" type="text" class="form-control" name="content">
          <label for="meta-content">Content</label>
        </div>
        <div class="form-group floating-label">
          <input id="meta-type" type="text" class="form-control" name="type" value='meta'>
          <label for="meta-type">Type</label>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Close</button>
        <button id="meta-btn" type="button" class="btn btn-primary">Submit</button>
      </div>
    </div>
  </div>
</div>
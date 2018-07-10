<div id="base"><!-- DIV BASE -->
    <div id="content">      
        <section class="style-default-bright">
            <div class="section-body">
              <div class="card">
                <div class="card-head style-primary">
                  <div class="tools pull-left">
                    <h4>Plugin list</h4>
                  </div>
                  <div class="tools fixed-action-btn">
                    <a href="#" class="btn btn-icon-toggle ink-reaction hidden-xs"><i class="fa fa-ellipsis-v"></i></a>
                    <ul data-activity="#user-list">
                      <li><a class="btn btn-floating btn-primary multi-deleted-btn"><i class="fa fa-trash" data-toggle="tooltip" data-placement="left" title="Delete select images"></i></a></li>
                    </ul>
                  </div>
                </div>
                <div class="card-tiles">
                  <div class="hbox-md col-md-12">
                    <div class="hbox-column col-md-9 show-plugin">
                      <?php if($packages): foreach($packages as $plugin):?>
                        <div class="menu-form row">
                          <div class="col-xs-7">
                            <div class="form-group floating-label">
                              <input type="text" class="form-control first-item dirty" id="package_<?=$plugin['name']?>" value="<?=$plugin['name']?>" readonly>
                              <label for="package_<?=$plugin['name']?>">Package</label>
                            </div>
                          </div>
                          <div class="col-xs-2">
                            <div class="form-group floating-label">
                              <input type="text" data-input="controller" class="form-control second-item dirty" id="<?=$plugin['name']?>_<?=$plugin['name']?>1" value="<?=$plugin['datetime']?>" readonly>
                              <label for="<?=$plugin['name']?>_<?=$plugin['name']?>">uploaded date</label>
                            </div>
                          </div>
                          <div class="col-xs-3 text-right" data-id="1">
                            <button type="button" class="btn btn-warning btn-lock" data-toggle="tooltip" data-placement="left" title="Delete this plugin"><i class="fa fa-trash"></i></button>
                            <button type="button" class="btn btn-info btn-submit" data-toggle="tooltip" data-placement="left" title="Install this plugin"><i class="fa fa-share-square-o"></i> Install</button>
                          </div>
                        </div>
                      <?php endforeach;endif;?>
                      <h3>Installed</h3>
                      <?php if($installed): foreach($installed as $plugin):?>
                        <div class="menu-form row">
                          <div class="col-xs-7">
                            <div class="form-group floating-label">
                              <input type="text" class="form-control first-item dirty" id="package_<?=$plugin['name']?>" value="<?=$plugin['name']?>" readonly>
                              <label for="package_<?=$plugin['name']?>">Package</label>
                            </div>
                          </div>
                          <div class="col-xs-2">
                            <div class="form-group floating-label">
                              <input type="text" data-input="controller" class="form-control second-item dirty" id="<?=$plugin['name']?>_<?=$plugin['name']?>1" value="<?=$plugin['datetime']?>" readonly>
                              <label for="<?=$plugin['name']?>_<?=$plugin['name']?>">uploaded date</label>
                            </div>
                          </div>
                          <div class="col-xs-3 text-right" data-id="1">
                            <button type="button" class="btn btn-warning btn-lock" data-toggle="tooltip" data-placement="left" title="Remove this plugin"><i class="fa fa-trash"></i> Remove</button>
                            <button type="button" class="btn btn-info btn-submit" data-toggle="tooltip" data-placement="left" title="Reinstall this plugin"><i class="fa fa-share-square-o"></i> Reinstall</button>
                          </div>
                        </div>
                      <?php endforeach;endif;?>
                    </div>
                    <div class="hbox-column col-md-3 style-default-light img-uploader">
                      <div class="card">
                        <div class="card-head style-primary">
                          <header>Plugin package uploader</header>                            
                        </div>
                        <div class="card-body no-padding">
                          <form action="#" class="dropzone" id="upload-image" data-folder='underfined'>
                            <div class="dz-message">
                              <h3>Drop files here or <br>click to upload.</h3>
                            </div>
                          </form>
                        </div>
                        <div class="card-actionbar style-default-light">
                          <div class="card-actionbar-row">
                            <div class="text-left">
                              Please select plugin package file!
                            </div>
                            <a class="btn btn-icon-toggle ink-reaction btn-danger dtn-delete-template position-toast" data-position="toast-top-center" data-response="#upload-image"><i class="fa fa-trash" data-toggle="tooltip" data-placement="left" title="Delete templates images"></i></a>
                          </div>
                        </div>
                      </div>                      
                    </div>
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
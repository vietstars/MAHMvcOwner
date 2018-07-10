<div id="base"><!-- DIV BASE -->
    <div id="content">      
        <section class="style-default-bright">
            <div class="section-body">
              <div class="card">
                <div class="card-head style-primary">
                  <div class="tools pull-left">
                    <h4>Image list</h4>
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
                    <div class="hbox-column col-md-9 show-image">
                      <!-- <div class="col-sm-2">
                        <div class="card img-thumb">
                          <div class="card-body">
                            <div style="background:url(<?=$this->modun('image')->getImg('1502769675_user2_160x160.jpg','avatar')?>)" class="img"></div>
                            <div class="overlay">
                              <div class="content" data-modal="show" data-target="#show-image">Hello World</div>
                            </div>
                          </div>
                          <a class="btn btn-icon-toggle ink-reaction"><i class="fa fa-close"></i></a>
                        </div>
                      </div> -->
                    </div>
                    <div class="hbox-column col-md-3 style-default-light img-uploader">
                      <div class="card">
                        <div class="card-head style-primary">
                          <header>Image uploader</header>
                            <div class="form-group floating-label pull-right select-folder">
                              <input type="text" id="select-folder" class="form-control ui-autocomplete-input" data-response="#upload-image" data-append=".appending" data-source="<?=URL.'admin'.S.CTL?>/getFolder" autocomplete="off" value="underfined">
                              <label for="select-folder">Upload to:</label>
                              <div class='appending'></div>
                            </div>
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
                              Please select upload to folder before upload!
                            </div>
                            <a class="btn btn-icon-toggle ink-reaction btn-danger dtn-delete-template position-toast" data-position="toast-top-center" data-response="#upload-image"><i class="fa fa-trash" data-toggle="tooltip" data-placement="left" title="Delete templates images"></i></a>
                          </div>
                        </div>
                      </div>
                      <div id="calendar" data-log="image" class='card style-default-bright'></div>
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
<div id="base"><!-- DIV BASE -->
    <div id="content">      
        <section class="style-default-bright">
            <div class="section-body">
              <div class="card">
                <div class="card-head style-primary">
                  <div class="tools pull-left">
                    <h4>Product list</h4>
                  </div>
                  <div class="tools fixed-action-btn">
                    <a href="#" class="btn btn-icon-toggle ink-reaction hidden-xs"><i class="fa fa-ellipsis-v"></i></a>
                    <ul data-activity="#product-list">
                      <li><a class="btn btn-floating btn-danger multi-delete-btn"><i class="fa fa-trash" data-toggle="tooltip" data-placement="left" title="Multiple delete"></i></a></li>
                      <li><a class="btn btn-floating btn-success multi-unlock-btn"><i class="fa fa-unlock" data-toggle="tooltip" data-placement="left" title="Multiple unlock"></i></a></li>
                      <li><a class="btn btn-floating btn-warning multi-lock-btn"><i class="fa fa-lock" data-toggle="tooltip" data-placement="left" title="Multiple lock"></i></a></li>
                      <li><a class="btn btn-floating btn-warning multi-outstock-btn"><i class="fa fa-ban" data-toggle="tooltip" data-placement="left" title="Multiple out of stock"></i></a></li>
                      <li><a class="btn btn-floating btn-info multi-active-btn"><i class="fa fa-tags" data-toggle="tooltip" data-placement="left" title="Multiple Active"></i></a></li>
                      <li><a class="btn btn-floating btn-danger multi-best-btn"><i class="fa fa-thumbs-up" data-toggle="tooltip" data-placement="left" title="Multiple Best"></i></a></li>
                      <li><a class="btn btn-floating btn-primary multi-lock-btn"><i class="fa fa-plus" data-modal="show" data-target="#import-product" data-toggle="tooltip" data-placement="left" title="Import product list"></i></a></li>
                    </ul>
                  </div>
                </div>
                <div class="card-tiles">
                  <div class="hbox-md col-md-12">
                    <table id="product-list" class="table table-bordered table-hover dataTable table-responsive">
                      <thead>
                      <tr>
                        <th width="23%">Name/ <small>Description</small></th>
                        <th width="7%">Express Interest</th>
                        <th width="30%">Display image</th>
                        <th width="10%">Price/ <small>Brand</small></th>
                        <th width="10%">Category/ <small>type</small></th>
                        <th width="10%">Created/ <small>Modified</small></th>
                        <th width="10%">Status</th>
                      </tr>
                      </thead>
                      <tbody>
                      </tbody>
                    </table>                        
                  </div>
                </div>
              </div>
            </div>
        </section>
    </div>
<div class="modal fade" id="import-product">
  <div class="modal-dialog">
    <form action="<?=URL.'admin/'.CTL.S?>import" method="post" enctype="multipart/form-data">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Import products</h4>
        </div>
        <div class="modal-body">
          <div class="form-group floating-label">
            <input type="file" name="file" class="import-product" id="file">
            <input id="upload-file" type="text" class="form-control">
            <label for="upload-file">Choose file</label>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Close</button>
          <button id="upload-btn" type="submit" class="btn btn-primary">Submit</button>
        </div>
      </div>
    </form>
  </div>
</div>
<div class="modal fade" id="image-manager">
  <div class="modal-dialog">
    <form action="<?=URL.'admin/'.CTL.S?>uploadImg" method="post" enctype="multipart/form-data">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Image manager</h4>
        </div>
        <div class="modal-body dropzone" data-folder='product'>
            <div class="dz-message">
              <h3>Drop files here or <br>click to upload.</h3>
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Close</button>
        </div>
      </div>
    </form>
  </div>
</div>
<div class="modal fade" id="like-list">
  <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Interested list</h4>
        </div>
        <div class="modal-body">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Close</button>
        </div>
      </div>
  </div>
</div>
<div class="modal fade" id="product-detail">
  <div class="modal-dialog">
    <form action="<?=URL.'admin/'.CTL.S?>editor" method="post" enctype="multipart/form-data">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Product Editor</h4>
        </div>
        <div class="modal-body">
          <div class="form-group floating-label">
            <input type="hidden" name="id">
            <input id="edit-name" type="text" class="form-control" name="name">
            <label for="edit-name">Name</label>
          </div>
          <div class="form-group floating-label">
            <input id="edit-desc" type="text" class="form-control" name="desc">
            <label for="edit-desc">Description</label>
          </div>
          <div class="form-group floating-label">
            <input id="edit-price" type="text" class="form-control" name="price">
            <label for="edit-price">Price</label>
          </div>
          <div class="form-group floating-label">
            <select class="form-control" id="edit-brand-text" name="brand">
              <?php foreach($brands as $brand):?>
              <option value="<?=$brand->id?>"><?=$brand->name?></option>
              <?php endforeach;?>
            </select>
            <label for="edit-brand-text">Brand</label>
          </div>
          <div class="form-group floating-label">
            <select class="form-control" id="edit-cate-text" name="cate">
              <?php foreach($category as $cate):?>
              <option value="<?=$cate->id?>"><?=$cate->name?></option>
              <?php endforeach;?>
            </select>
            <label for="edit-cate-text">Category</label>
          </div>
          <div class="form-group floating-label">
            <select class="form-control" id="edit-type-text" name="type">
              <?php foreach($type as $tp):?>
              <option value="<?=$tp->id?>"><?=$tp->name?></option>
              <?php endforeach;?>
            </select>
            <label for="edit-type-text">Type</label>
          </div>
          <div class="form-group floating-label row">
            <span class='col-xs-4 text-center'>
                <input class="with-gap info" name="status" value="b" type="radio" id="best"/>
                <label for="best">Best Seller</label>
            </span>
            <span class='col-xs-4 text-center'>
                <input class="with-gap primary" name="status" value="a" type="radio" id="available"/>
                <label for="available">Available</label>
            </span>
            <span class='col-xs-4 text-center'>
                <input class="with-gap danger" name="status" value="o" type="radio" id="outstock"/>
                <label for="outstock">Out of stock</label>
            </span>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Close</button>
          <button id="upload-btn" type="submit" class="btn btn-primary">Submit</button>
        </div>
      </div>
    </form>
  </div>
</div>
<div id="base"><!-- DIV BASE -->
    <div id="content">      
        <section class="style-default-bright">
            <div class="section-body">
              <div class="card">
                <div class="card-head style-primary">
                  <div class="tools pull-left">
                    <h4>Order list</h4>
                  </div>
                  <div class="tools fixed-action-btn">
                    <a href="#" class="btn btn-icon-toggle ink-reaction hidden-xs"><i class="fa fa-ellipsis-v"></i></a>
                    <ul data-activity="#product-list">
                      <li><a class="btn btn-floating btn-danger multi-delete-btn"><i class="fa fa-trash" data-toggle="tooltip" data-placement="left" title="Multiple delete"></i></a></li>
                      <li><a class="btn btn-floating btn-success multi-unlock-btn"><i class="fa fa-unlock" data-toggle="tooltip" data-placement="left" title="Multiple unlock"></i></a></li>
                      <li><a class="btn btn-floating btn-warning multi-lock-btn"><i class="fa fa-lock" data-toggle="tooltip" data-placement="left" title="Multiple lock"></i></a></li> 
                    </ul>
                  </div>
                </div>
                <div class="card-tiles">
                  <div class="hbox-md col-md-12">
                    <table id="product-list" class="table table-bordered table-hover dataTable table-responsive">
                      <thead>
                      <tr>
                        <th width="14%">Order code</th>
                        <th width="8%">Sub total/ <small>Tax</small></th>
                        <th width="8%">Amount</th>
                        <th width="12%">Contact: Name/ <small>Mail</small></th>
                        <th width="46%">Description</th>
                        <th width="12%">Created/ <small>Modified</small></th>
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
<div class="modal fade" id="item-list">
  <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Item list</h4>
        </div>
        <div class="modal-body">
          <table id="item-list" class="table table-bordered table-hover dataTable table-responsive">
            <thead>
            <tr>
              <th width="5%">Image</th>
              <th width="80%">Product name/ <small>Description</small></th>
              <th class="text-right" width="5%">Quantity</th>
              <th class="text-right" width="5%">Price</th>
              <th class="text-right" width="5%">Total</th>
            </tr>
            </thead>
            <tbody>
              
            </tbody> 
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Close</button>
        </div>
      </div>
  </div>
</div>
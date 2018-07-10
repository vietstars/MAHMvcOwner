<div id="base"><!-- DIV BASE -->
    <div id="content">      
        <section class="style-default-bright">
            <div class="section-body">
              <div class="card">
                <div class="card-head style-primary">
                  <div class="tools pull-left">
                    <h4>Logs</h4>
                  </div>
                  <div class="tools fixed-action-btn">
                    <a href="#" class="btn btn-icon-toggle ink-reaction hidden-xs"><i class="fa fa-ellipsis-v"></i></a>
                    <ul data-activity="#user-list">
                      <li><a class="btn btn-floating btn-warning delete-log" data-log="<?=date('d-m-Y')?>"><i class="fa fa-trash" data-toggle="tooltip" data-placement="left" title="Delete this logs"></i></a></li>
                    </ul>
                  </div>
                </div>
                <div class="card-tiles">
                  <div class="hbox-md col-md-12">
                    <div class="hbox-column col-md-9">  
                      <table id="logs-list" class="table table-bordered table-hover dataTable">
                        <thead>
                        <tr>
                          <th width="20%">IP/<small>Url</small></th>
                          <th width="12%">Visitor</th>
                          <th width="12%">Os/<small>Browser</small></th>
                          <th width="38%">Record</th>
                          <th width="18%">Time</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                        <!-- <tfoot>
                        <tr>
                          <th>IP/<small>Os</small></th>
                          <th>Browser<small>[version]/ Url</small></th>
                          <th>Record</th>
                          <th>Time</th>
                        </tr>
                        </tfoot> -->
                      </table>                      
                    </div>
                    <div class="hbox-column col-md-3 style-default-light">
                      <div id="calendar" data-log="get.csv" class='card style-default-bright'></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </section>
    </div>
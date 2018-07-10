<div id="base"><!-- DIV BASE -->
    <div id="content">      
        <section class="style-default-bright">
            <div class="section-body">
              <div class="card">
                <div class="card-head style-primary">
                  <div class="tools pull-left">
                    <h4>System Information</h4>
                  </div>
                </div>
                <div class="card-tiles">
                  <div class="hbox-md col-md-12">
                    <div class="hbox-column col-md-9 show-system">
                      <div class="col-md-6">  
                        <h3 class='sys-title'>Email infomation</h3> 
                          <form action="<?=URL.'admin/'.CTL.'/email'?>" method="post">
                          <div class="row email-form">
                            <?php foreach ($email as $k => $v):?>
                            <div class=" col-xs-12">
                              <div class="form-group floating-label">
                                <?php if($v->sys_key=='email_confirm_content'):?>
                                <textarea class="form-control input-sm second-item" id="<?=$v->sys_key?>" rows="7" name="<?=$v->sys_key?>"><?=$v->sys_value?></textarea>
                                <?php elseif($v->sys_key=='email_contact_content'):?>
                                <textarea class="form-control input-sm second-item" id="<?=$v->sys_key?>" rows="3" name="<?=$v->sys_key?>"><?=$v->sys_value?></textarea>
                                <?php else:?>
                                <input type="text" class="form-control input-sm second-item" id="<?=$v->sys_key?>" name="<?=$v->sys_key?>" value="<?=$v->sys_value?>">
                                <?php endif;?>
                                <label for="<?=$v->sys_key?>"><?=str_replace('_',' ',$v->sys_key)?></label>
                              </div>
                            </div>
                            <?php endforeach;?>
                          </div>
                          <button type="submit" class="btn btn-sm btn-info btn-submit pull-right" data-toggle="tooltip" data-placement="left" title="Update for email infomation"><i class="fa fa-send-o"></i> Update email</button>
                        </form>
                      </div>
                      <div class="col-md-6">
                        <h3 class='sys-title'>Database infomation</h3>
                        <form action="<?=URL.'admin/'.CTL.'/system'?>" method="post">
                          <div class="row sys-form">                        
                            <?php foreach($sys as $k => $v):?>
                              <div class=" col-xs-6">
                                <div class="form-group floating-label">
                                  <input type="text" class="form-control input-sm second-item" id="<?=$k?>" name="<?=$k?>" value="<?=$v?>">
                                  <label for="<?=$k?>"><?=str_replace('_',' ',$k)?></label>
                                </div>
                              </div>
                            <?php endforeach;?>
                          </div>
                          <button type="submit" class="btn btn-sm btn-info btn-submit pull-right" data-toggle="tooltip" data-placement="left" title="Update for database infomation"><i class="fa fa-send-o"></i> Update database</button>
                          If you change database information will be change application process.
                        </form>
                      </div>
                      <div class="col-md-6">  
                        <h3 class='sys-title'>Application infomation</h3> 
                          <form action="<?=URL.'admin/'.CTL.'/application'?>" method="post">
                          <div class="row app-form">
                            <div class=" col-xs-12">
                              <div class="form-group floating-label">
                                <input type="text" class="form-control input-sm second-item" id="appkey" name="appkey" value="<?=$app->sys_key?>">
                                <label for="appkey">Application key</label>
                              </div>
                              <div class="form-group floating-label">
                                <input type="text" class="form-control input-sm second-item" id="domain" name="domain" value="<?=$_SERVER['SERVER_NAME']?>">
                                <label for="domain">Domain</label>
                              </div>
                              <div class="form-group floating-label">
                                <input type="text" class="form-control input-sm second-item" id="expiry" name="expiry" value="<?=$app->sys_value?>">
                                <label for="expiry">Expiry date</label>
                              </div>
                            </div>
                          </div>
                          <button type="submit" class="btn btn-sm btn-info btn-submit pull-right" data-toggle="tooltip" data-placement="left" title="Update for application infomation"><i class="fa fa-send-o"></i> Update application</button>
                          If you change application information will be change application process
                        </form>
                      </div>
                    </div>
                    <div class="hbox-column col-md-3 style-default-light template-setting">
                      <div class="form-group floating-label">
                        <select id="template" name="template" class="form-control">
                          <option value="default">Material</option>
                          <?php foreach ($templates as $layout):?>
                            <option value="<?=$layout?>" <?= $layout==$current?'selected':'';?>><?=$layout?></option>
                          <?php endforeach;?>
                        </select>
                        <label for="template">System template</label>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </section>
    </div>
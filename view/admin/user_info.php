<div id="base">
  <div id="content">
    <section>
      <div class="section-header">
          <h4 class="text-primary">User profile</h4>
      </div>      
      <div class="section-body">
        <div class="card">
          <div class="card-head style-primary">
            <div class="tools pull-left">
              <form class="navbar-search" role="search">
                <div class="form-group">
                  <input type="text" class="form-control" name="contactSearch" placeholder="Enter your keyword">
                </div>
                <button type="submit" class="btn btn-icon-toggle ink-reaction"><i class="fa fa-search"></i></button>
              </form>
            </div>
            <div class="tools">
              <a href="#" class="btn btn-icon-toggle ink-reaction hidden-xs"><i class="fa fa-ellipsis-v"></i></a>
            </div>
          </div>
          <div class="card-tiles">
            <div class="hbox-md col-md-12">
              <div class="hbox-column col-md-9">
                <div class="row">
                  <div class="col-sm-5 col-md-4 col-lg-3">
                    <ul class="nav nav-pills nav-stacked">
                      <li><small>CATEGORIES</small></li>
                      <li><a href="#">All contacts <small class="pull-right text-bold opacity-75">153</small></a></li>
                      <li><a href="#">Family <small class="pull-right text-bold opacity-75">16</small></a></li>
                      <li><a href="#">Friends <small class="pull-right text-bold opacity-75">76</small></a></li>
                      <li class="hidden-xs"><small>LAST VIEWED</small></li>
                      <li class="hidden-xs focus">
                        <a href="#">
                          <img class="img-circle img-responsive pull-left width-1" src="<?= $this->modun('image')->getImg('1502726314_avatar.jpg','avatar')?>" alt="">
                          <span class="text-medium">Philip  Ericsson</span><br>
                          <span class="opacity-50">
                            <span class="glyphicon glyphicon-phone text-sm"></span> &nbsp;123-123-3210
                          </span>
                        </a>
                      </li>
                      <li class="hidden-xs">
                        <a href="#">
                          <img class="img-circle img-responsive pull-left width-1" src="<?= $this->modun('image')->getImg('1502726314_avatar.jpg','avatar')?>" alt="">
                          <span class="text-medium">Ann Laurens</span><br>
                          <span class="opacity-50">
                            <span class="glyphicon glyphicon-phone text-sm"></span> &nbsp;567-890-1234
                          </span>
                        </a>
                      </li>
                      <li class="hidden-xs">
                        <a href="#">
                          <img class="img-circle img-responsive pull-left width-1" src="<?= $this->modun('image')->getImg('1502726314_avatar.jpg','avatar')?>" alt="">
                          <span class="text-medium">Buck Rogers</span><br>
                          <span class="opacity-50">
                            <span class="glyphicon glyphicon-phone text-sm"></span> &nbsp;787-878-8787
                          </span>
                        </a>
                      </li>
                      <li class="hidden-xs">
                        <a href="#">
                          <img class="img-circle img-responsive pull-left width-1" src="<?= $this->modun('image')->getImg('1502726314_avatar.jpg','avatar')?>" alt="">
                          <span class="text-medium">Kimberly Aston</span><br>
                          <span class="opacity-50">
                            <span class="glyphicon glyphicon-phone text-sm"></span> &nbsp;555-444-3333
                          </span>
                        </a>
                      </li>
                      <li class="hidden-xs">
                        <a href="#">
                          <img class="img-circle img-responsive pull-left width-1" src="<?= $this->modun('image')->getImg('1502726314_avatar.jpg','avatar')?>" alt="">
                          <span class="text-medium">Mabel Logan</span><br>
                          <span class="opacity-50">
                            <span class="glyphicon glyphicon-phone text-sm"></span> &nbsp;234-567-8901
                          </span>
                        </a>
                      </li>
                    </ul>
                  </div>
                  <div class="col-sm-7 col-md-8 col-lg-9">
                    <form action="" method="post" enctype="multipart/form-data">
                      <div class="margin-bottom-xxl">
                        <div class="pull-left width-3 clearfix hidden-xs">
                          <input type="hidden" id="acc_id" name="acc[id]" value="<?=$user->id?>">
                          <img class="img-circle size-2" src="<?= $this->modun('image')->getImg($user->avatar,'avatar')?>" alt="">
                        </div>
                        <input type="text" class="acc-fullname" name="acc[fullname]" value="<?=$user->fullname?>">
                        <h5>
                          <select id="role" name="acc[role]" class="acc-role">
                            <?php foreach($role as $position):?>
                            <option value="<?=$position->id?>" <?php if($position->id==$user->role):?>selected<?php endif;?>><?=$position->role?></option>
                            <?php endforeach;?>
                          </select>
                          <i class="fa fa-<?=$user->gender?> gender-<?=$user->gender?>"></i></h5>
                        <div class="star-rating">
                          <div class="rating-input"><span class="fa fa-star text-primary" data-value="0"></span><span class="fa fa-star text-primary" data-value="1"></span><span class="fa fa-star text-primary" data-value="2"></span><span class="fa fa-star-half-full text-primary" data-value="3"></span><span class="fa fa-star-o opacity-25" data-value="4"></span><span class="fa fa-star-o opacity-25" data-value="5"></span><input type="number" name="rating" class="rating hidden" value="3"></div>
                        </div>
                      </div>
                      <ul class="nav nav-tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#setting" aria-controls="setting" role="tab" data-toggle="tab">SETTING</a></li>
                          <li role="presentation"><a href="#note" aria-controls="note" role="tab" data-toggle="tab">NOTES</a></li>
                          <li role="presentation"><a href="#activity" aria-controls="activity" role="tab" data-toggle="tab">ACTIVITY</a></li>
                          <li role="presentation"><a href="#detail" aria-controls="detail" role="tab" data-toggle="tab">DETAILS</a></li>
                      </ul>
                      <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="setting">
                          <div class="card">
                              <div class="card-head style-default-dark">
                                <header>User Profile</header>
                              </div>
                              <div class="card-body style-default-dark form-inverse">
                                <div class="row">
                                  <div class="col-xs-12">
                                    <div class="row">
                                      <div class="col-md-6">
                                        <div class="form-group floating-label">
                                          <input type="text" class="form-control input-lg" id="email" name="acc[email]" value="<?=$user->email?>">
                                          <label for="email">Email</label>
                                        </div>
                                      </div>
                                      <div class="col-md-6">
                                        <div class="form-group floating-label">
                                          <input type="password" class="form-control input-lg" id="password" name="acc[password]" autocomplete="new-password">
                                          <label for="password">Password</label>
                                        </div>
                                      </div>
                                    </div>
                                    <div class="row">
                                      <div class="col-md-6">
                                        <div class="form-group floating-label">
                                          <input type="text" class="form-control" id="id_no" name="acc[id_no]" value="<?=$user->id_no?>">
                                          <label for="id_no">ID No.</label>
                                        </div>
                                      </div>
                                      <div class="col-md-6">
                                        <div class="form-group floating-label">
                                          <input type="text" class="form-control" id="birthday" name="acc[birthday]" value="<?=$user->birthday?>">
                                          <label for="birthday">Birthdate</label>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="card-head style-default-dark">
                                <ul class="nav nav-tabs tabs-text-contrast tabs-accent" data-toggle="tabs">
                                  <li class="active"><a href="#contact">CONTACT INFO</a></li>
                                  <li class=""><a href="#experience">EXPERIENCE</a></li>
                                  <li class=""><a href="#skills">SKILLS</a></li>
                                  <li class=""><a href="#general">GENERAL</a></li>
                                </ul>
                              </div>
                              <div class="card-body tab-content">
                                <div class="tab-pane active" id="contact">
                                  <div class="row">
                                    <div class="col-md-8">
                                      <div class="row">
                                        <div class="col-md-4">
                                          <div class="form-group floating-label">
                                            <input type="text" class="form-control" id="mobile" name="acc[mobile]" value="<?=$user->mobile?>">
                                            <label for="mobile">Mobile</label>
                                          </div>
                                        </div>
                                        <div class="col-md-4">
                                          <div class="form-group floating-label">
                                            <input type="text" class="form-control" id="phone" name="acc[phone]" value="<?=$user->phone?>">
                                            <label for="phone">Phone</label>
                                          </div>
                                        </div>
                                        <div class="col-md-4">
                                          <div class="form-group floating-label">
                                            <select class="form-control dirty" name="acc[gender]">
                                              <option value="male" <?php if($user->gender=='male'):?>selected<?php endif;?>>Male</option>
                                              <option value="female" <?php if($user->gender=='female'):?>selected<?php endif;?>>Female</option>
                                            </select>
                                            <label for="phone">Gender</label>
                                          </div>
                                        </div>
                                        <div class="col-md-12">
                                          <div class="form-group floating-label">
                                            <input type="text" class="form-control" id="address" name="acc[address]" value="<?=$user->address?>">
                                            <label for="address">Address</label>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                    <div class="col-md-4">
                                      <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1994.3550213943695!2d103.84850501901134!3d1.3505025003176556!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da1716cf08d56d%3A0x943b6bb45403dc59!2sBishan+Pl%2C+Singapore!5e0!3m2!1sen!2s!4v1502351391480" width="100%" height="280" frameborder="0" style="border:0" allowfullscreen></iframe>
                                    </div>
                                  </div>
                                </div>
                                <div class="tab-pane" id="experience">
                                  <?php if(!empty($experience)):?>
                                    <div class="row exp-row" data-id="1">
                                      <div class="page-header no-border holder">
                                        <a class="btn btn-icon-toggle btn-accent btn-more stick-top-right" data-toggle="tooltip" data-placement="left" title="Add more experience"><span class="fa fa-plus"></span></a>                                        
                                        <h4 class="text-accent top-title" data-content="Experience ">Experience 1</h4>
                                      </div>
                                      <div class="col-sm-6">
                                        <div class="form-group floating-label">
                                          <input type="text" class="form-control" id="exp-company-1" name="exp[1][company]">
                                          <label for="exp-company-1">Company</label>
                                        </div>
                                      </div>
                                      <div class="col-sm-6">
                                        <div class="form-group floating-label">
                                          <input type="text" class="form-control" id="exp-position-<?=$exp->id?>" name="exp[1][position]"> 
                                          <label for="exp-position-1">Function</label>      
                                        </div>
                                      </div>
                                      <div class="col-sm-12">
                                        <div class="form-group floating-label">
                                          <div class="input-daterange input-group" id="date-range-1">
                                            <div class="input-group-content">
                                              <input type="text" class="form-control" name="exp[][date_from]">
                                              <label>Date range</label>
                                            </div>
                                            <span class="input-group-addon">to</span>
                                            <div class="input-group-content">
                                              <input type="text" class="form-control" name="exp[1][date_to]">
                                              <div class="form-control-line"></div>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                      <div class="col-sm-12">
                                        <div class="form-group floating-label">
                                          <textarea name="exp[1][description]" id="exp-description-<?=$exp->id?>" class="form-control" rows="3"></textarea>
                                          <label for="exp-description-1">Job description</label>
                                        </div>
                                      </div> 
                                    </div>
                                  <?php else: foreach($experience as $key=>$exp):$key++;?>
                                    <div class="row exp-row" data-id="<?=$key?>">
                                      <div class="page-header no-border holder">
                                        <?php if(count($experience)==$key):?>
                                        <a class="btn btn-icon-toggle btn-accent btn-more stick-top-right" data-toggle="tooltip" data-placement="left" title="Add more experience"><span class="fa fa-plus"></span></a>
                                        <?php else:?>
                                        <a class="btn btn-icon-toggle btn-accent btn-delete stick-top-right" data-toggle="tooltip" data-placement="left" title="Delete this experience"><span class="fa fa-trash"></span></a>
                                        <?php endif;?>
                                        <h4 class="text-accent top-title" data-content="Experience ">Experience <?=$key?></h4>
                                      </div>
                                      <div class="col-sm-6">
                                        <div class="form-group floating-label">
                                          <input type="text" class="form-control" id="exp-company-<?=$exp->id?>" name="exp[<?=$key?>][company]" value="<?=$exp->company?>">
                                          <label for="exp-company-<?=$exp->id?>">Company</label>
                                        </div>
                                      </div>
                                      <div class="col-sm-6">
                                        <div class="form-group floating-label">
                                          <input type="text" class="form-control" id="exp-position-<?=$exp->id?>" name="exp[<?=$key?>][position]" value="<?=$exp->position?>"> 
                                          <label for="exp-position-<?=$exp->id?>">Function</label>      
                                        </div>
                                      </div>
                                      <div class="col-sm-12">
                                        <div class="form-group floating-label">
                                          <div class="input-daterange input-group" id="date-range-<?=$exp->id?>">
                                            <div class="input-group-content">
                                              <input type="text" class="form-control" name="exp[<?=$key?>][date_from]" value="<?=$exp->date_from?>">
                                              <label>Date range</label>
                                            </div>
                                            <span class="input-group-addon">to</span>
                                            <div class="input-group-content">
                                              <input type="text" class="form-control" name="exp[<?=$key?>][date_to]" value="<?=$exp->date_to?>">
                                              <div class="form-control-line"></div>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                      <div class="col-sm-12">
                                        <div class="form-group floating-label">
                                          <textarea name="exp[<?=$key?>][description]" id="exp-description-<?=$exp->id?>" class="form-control" rows="3"><?=$exp->description?></textarea>
                                          <label for="exp-description-<?=$exp->id?>">Job description</label>
                                        </div>
                                      </div> 
                                    </div>
                                  <?php endforeach;endif;?>
                                </div>
                                <div class="tab-pane" id="skills">
                                  <?php if(empty($skills)):?>
                                  <div class="row skill-row" data-id="1">
                                    <div class="page-header no-border holder">
                                      <a class="btn btn-icon-toggle btn-accent btn-more stick-top-right" data-toggle="tooltip" data-placement="left" title="Add more skill"><span class="fa fa-plus"></span></a>                                      
                                      <h4 class="text-accent top-title" data-content="Skill ">Skill 1</h4>
                                    </div>
                                    <div class="col-xs-10">
                                      <div class="form-group floating-label">
                                        <input type="text" class="form-control" id="skill-1" name="skill[1][skill]">
                                        <label for="skill-1">Skill</label>
                                      </div>     
                                    </div>     
                                    <div class="col-xs-2">
                                      <div class="form-group floating-label">
                                        <select id="skill-rated-1" name="skill[1][rated]" class="form-control">
                                          <option value="" selected hidden></option>
                                          <?php for($i=100;$i>=10;$i-=5):?>        
                                          <option value="<?=$i?>"><?=$i?></option>        
                                          <?php endfor;?>      
                                        </select>
                                        <label for="skill-rated-1">Rating</label>
                                      </div>
                                    </div>
                                  </div> 
                                  <?php else: foreach($skills as $k=>$skill):$k++;?>
                                  <div class="row skill-row" data-id="<?=$k?>">
                                    <div class="page-header no-border holder">
                                      <?php if(count($skills)==$k):?>
                                      <a class="btn btn-icon-toggle btn-accent btn-more stick-top-right" data-toggle="tooltip" data-placement="left" title="Add more skill"><span class="fa fa-plus"></span></a>
                                      <?php else:?>
                                      <a class="btn btn-icon-toggle btn-accent btn-delete stick-top-right" data-toggle="tooltip" data-placement="left" title="Delete this skill"><span class="fa fa-trash"></span></a>
                                      <?php endif;?>
                                      <h4 class="text-accent top-title" data-content="Skill ">Skill <?=$k?></h4>
                                    </div>
                                    <div class="col-xs-10">
                                      <div class="form-group floating-label">
                                        <input type="text" class="form-control" id="skill-<?=$k?>" name="skill[<?=$k?>][skill]" value="<?=$skill->skill?>">
                                        <label for="skill-1">Skill</label>
                                      </div>     
                                    </div>     
                                    <div class="col-xs-2">
                                      <div class="form-group floating-label">
                                        <select name="skill[<?=$k?>][rated]" class="form-control">
                                          <option value="" selected hidden></option>
                                          <?php for($i=100;$i>=10;$i-=5):?>        
                                          <option value="<?=$i?>" <?php if($skill->rated==$i):?>selected<?php endif;?>><?=$i?></option>        
                                          <?php endfor;?>      
                                        </select>
                                        <label for="skill-rating-1">Rating</label>
                                      </div>
                                    </div>
                                  </div>
                                  <?php endforeach;endif;?>
                                </div>
                                <div class="tab-pane" id="general">
                                  <textarea id="inpuGeneral" name="general"><?=(isset($general->general))?$general->general:'not availbility';?></textarea>
                                </div>
                              </div>
                              <div class="card-actionbar">
                                <div class="card-actionbar-row">
                                  <a class="btn btn-primary" href="#">CANCEL</a>
                                  <button type="submit" class="btn btn-accent">UPDATE PROFILE</button>
                                </div>
                              </div>                            
                          </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="note">
                          <br>
                          <div class="form-group floating-label">
                            <textarea class="form-control input-sm second-item dirty" id="add_note" rows="3" name="note"></textarea>
                            <label for="note">Add a note</label>
                          </div>
                          <div class="form-group clearfix">
                            <button type="button" id="btn-addnote" data-target='#add_note' class="btn btn-raised btn-teal pull-right">Add this note</button>
                          </div>
                          <div class="list-results list-results-underlined">
                            <?php foreach($notes as $note):?>
                            <div class="col-xs-12">
                              <p class="clearfix">
                                <span class="fa fa-fw fa-file-o fa-2x pull-left"></span>
                                <span class="pull-left">
                                  <span class="text-bold"><?=date('l, F jS, Y',strtotime($note->created))?></span><br>
                                  <span class="opacity-50">Modified: <?=date('l, F jS, Y H:i a',strtotime($note->modified))?></span>
                                </span>
                              </p>
                              <div>
                                <em>"<?=$note->notes?>"</em>
                              </div>
                            </div>
                            <?php endforeach;?>
                          </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="activity">
                          <br>
                          <div class="text-center">
                            <label class="checkbox-inline checkbox-styled checkbox-default">
                              <input type="checkbox" value="option1" checked=""><span>System alerts</span>
                            </label>
                            <label class="checkbox-inline checkbox-styled checkbox-primary">
                              <input type="checkbox" value="option2" checked=""><span>Social activity</span>
                            </label>
                            <label class="checkbox-inline checkbox-styled checkbox-default-dark">
                              <input type="checkbox" value="option3" checked=""><span>Event</span>
                            </label>
                          </div>
                          <br>
                          <hr class="no-margin">
                          <ul class="timeline collapse-md">
                            <li class="timeline-inverted">
                              <div class="timeline-circ"></div>
                              <div class="timeline-entry">
                                <div class="card style-default-light">
                                  <div class="card-body small-padding">
                                    <img class="img-circle img-responsive pull-left width-1" src="<?= $this->modun('image')->getImg('1502726314_avatar.jpg','avatar')?>" alt="">
                                    <span class="text-medium">Received a <a class="text-primary" href="#message</a> from <span class="text-primary">Ann Lauren</span><br>
                                    <span class="opacity-50">
                                      Saturday, Oktober 18, 2014
                                    </span>
                                  </div>
                                </div>
                              </div>
                            </li>
                            <li>
                              <div class="timeline-circ"></div>
                              <div class="timeline-entry">
                                <div class="card style-default-light">
                                  <div class="card-body small-padding">
                                    <img class="img-circle img-responsive pull-left width-1" src="<?= $this->modun('image')->getImg('1502726314_avatar.jpg','avatar')?>" alt="">
                                    <span class="text-medium">User login at <span class="text-primary">8:15 pm</span><br>
                                    <span class="opacity-50">
                                      Saturday, August 2, 2014
                                    </span>
                                  </div>
                                </div>
                              </div>
                            </li>
                            <li class="timeline-inverted">
                              <div class="timeline-circ style-default-dark"></div>
                              <div class="timeline-entry">
                                <div class="card style-default-dark">
                                  <div class="card-body small-padding">
                                    <img class="img-circle img-responsive pull-left width-1" src="<?= $this->modun('image')->getImg('1502726314_avatar.jpg','avatar')?>" alt="">
                                    <span class="text-medium">Meeting in the <span class="text-primary">conference room</span></span><br>
                                    <span class="opacity-50">
                                      Saturday, Juli 29, 2014
                                    </span>
                                  </div>
                                </div>
                              </div>
                            </li>
                            <li>
                              <div class="timeline-circ circ-xl style-accent"><span class="glyphicon glyphicon-upload"></span></div>
                              <div class="timeline-entry">
                                <div class="card style-primary">
                                  <div class="card-body small-padding">
                                    <p><img class="img-circle img-responsive pull-left width-1" src="<?= $this->modun('image')->getImg('1502726314_avatar.jpg','avatar')?>" alt="">
                                      <span class="text-medium">Contacted <a class="text-primary-dark" href="#Mabel Logan"></a></span><br>
                                      <span class="opacity-50">
                                        Saturday, Juli 23, 2014
                                      </span>
                                    </p>
                                    <em>
                                      Can you send me the latest updates? Then I can see the new colors for the themes.
                                    </em>
                                  </div>
                                </div>
                              </div>
                            </li>
                            <li class="timeline-inverted">
                              <div class="timeline-circ circ-lg"><span class="glyphicon glyphicon-plus-sign"></span></div>
                              <div class="timeline-entry">
                                <div class="card style-default-light">
                                  <div class="card-body small-padding">
                                    <img class="img-circle img-responsive pull-left width-1" src="<?= $this->modun('image')->getImg('1502726314_avatar.jpg','avatar')?>" alt="">
                                    <span class="text-medium">User registered on website</span><br>
                                    <span class="opacity-50">
                                      Saturday, March 2, 2014
                                    </span>
                                  </div>
                                </div>
                              </div>
                            </li>
                          </ul>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="detail">
                          <h3 class="opacity-50">Summary</h3>
                          <article class="text-columns-2">
                            <img class="img-circle size-3 pull-left" src="<?= $this->modun('image')->getImg($user->avatar,'avatar')?>" alt="">
                            <?=(isset($general->general))?$general->general:'not availbility';?>
                          </article>
                          <br>
                          <h3 class="opacity-50">Experience</h3>
                          <ul class="timeline collapse-lg timeline-hairline no-shadow">
                            <?php foreach ($experience as $k => $exp):?>
                            <li class="timeline-inverted">
                              <div class="timeline-circ style-accent"></div>
                              <div class="timeline-entry">
                                <div class="card style-default-bright">
                                  <div class="card-body small-padding">
                                    <small class="text-uppercase text-primary pull-right"><?=date('M, Y',strtotime($exp->date_from));?> - <?= DateTime::createFromFormat('Y-m-d', $exp->date_to)!== FALSE?date('M, Y',strtotime($exp->date_to)):$exp->date_to;?></small>
                                    <p>
                                      <span class="text-lg text-medium"><?=$exp->position?></span><br>
                                      <span class="text-lg text-light"><?=$exp->company?></span>
                                    </p>
                                    <p><?=$exp->description?></p>
                                  </div>
                                </div>
                              </div>
                            </li>
                            <?php endforeach;?>
                          </ul>
                          <br>
                          <h3 class="opacity-50">Skills</h3>
                          <div class="row">
                            <div class="col-md-12 col-lg-8">
                              <dl>
                              <?php foreach($skills as $skill):?>
                                <dt data-toggle="tooltip" data-placement="right" title="Skill: <?= $skill->skill?>, Rated: <?= $skill->rated?>%"><?= $skill->skill?></dt>
                                <dd><div class="progress progress-hairline"><div class="progress-bar progress-bar-accent" style="width: <?= $skill->rated?>%"></div></div></dd>
                              <?php endforeach;?>
                              </dl>
                            </div>
                          </div>
                          <br>
                          <h3 class="opacity-50">Ratings</h3>
                          <blockquote>
                            <div class="star-rating pull-left">
                              <span class="glyphicon text-primary glyphicon-star"></span><span class="glyphicon text-primary glyphicon-star"></span><span class="glyphicon text-primary glyphicon-star"></span><span class="glyphicon text-primary glyphicon-star"></span><span class="glyphicon text-primary glyphicon-star"></span>
                            </div>
                            <p>
                              &nbsp;&nbsp;
                              Don't forget to rate this theme.
                            </p>
                            <footer>Kimberly Aston</footer>
                          </blockquote>
                          <blockquote>
                            <div class="star-rating pull-left">
                              <span class="glyphicon text-primary glyphicon-star"></span><span class="glyphicon text-primary glyphicon-star"></span><span class="glyphicon text-primary glyphicon-star"></span><span class="glyphicon text-primary glyphicon-star"></span><span class="glyphicon glyphicon-star opacity-25"></span>
                            </div>
                            <p>
                              &nbsp;&nbsp;
                              A very talented manager who likes to talk to people.
                            </p>
                            <footer>Ann Laurens</footer>
                          </blockquote>
                          <blockquote>
                            <div class="star-rating pull-left">
                              <span class="glyphicon text-primary glyphicon-star"></span><span class="glyphicon text-primary glyphicon-star"></span><span class="glyphicon text-primary glyphicon-star"></span><span class="glyphicon glyphicon-star opacity-25"></span><span class="glyphicon glyphicon-star opacity-25"></span>
                            </div>
                            <p>
                              &nbsp;&nbsp;
                              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.
                            </p>
                            <footer>Buck Rogers</footer>
                          </blockquote>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              <div class="hbox-column col-md-3 style-default-light">
                <div class="row">
                  <div class="col-xs-12">
                    <h4>Short info</h4>
                    <br>
                    <dl class="dl-horizontal dl-icon">
                      <dt><span class="fa fa-fw fa-graduation-cap fa-lg opacity-50"></span></dt>
                      <dd>
                        <span class="opacity-50">Career</span><br>
                        <span class="text-medium">Manager director, Commercial manager, Commercial assistant</span>
                      </dd>
                      <dt><span class="fa fa-fw fa-gift fa-lg opacity-50"></span></dt>
                      <dd>
                        <span class="opacity-50">Birthday</span><br>
                        <span class="text-medium">Juli 30</span>
                      </dd>
                    </dl>
                    <br>
                    <h4>Contact info</h4>
                    <br>
                    <dl class="dl-horizontal dl-icon">
                      <dt><span class="fa fa-fw fa-mobile fa-lg opacity-50"></span></dt>
                      <dd>
                        <span class="opacity-50">Phone</span><br>
                        <span class="text-medium">233-332-342</span> &nbsp;<span class="opacity-50">work</span><br>
                        <span class="text-medium">766-766-4532</span> &nbsp;<span class="opacity-50">mobile</span>
                      </dd>
                      <dt><span class="fa fa-fw fa-envelope-square fa-lg opacity-50"></span></dt>
                      <dd>
                        <span class="opacity-50">Email</span><br>
                        <a class="text-medium" href="#philip@Ericsson.com">philip@Ericsson.com</a>
                      </dd>
                      <dt><span class="fa fa-fw fa-location-arrow fa-lg opacity-50"></span></dt>
                      <dd>
                        <span class="opacity-50">Address</span><br>
                        <span class="text-medium">
                          Damrak 7<br>
                          Amsterdam, 1012 LG<br>
                          Netherlands
                        </span>
                      </dd>
                    </dl>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1994.3550213943695!2d103.84850501901134!3d1.3505025003176556!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da1716cf08d56d%3A0x943b6bb45403dc59!2sBishan+Pl%2C+Singapore!5e0!3m2!1sen!2s!4v1502351391480" width="100%" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
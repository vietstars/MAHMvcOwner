<main>
	<div class="container">
		<nav>
	    	<div class="nav-wrapper red darken-1">
		      	<a href="#" class="brand-logo">Guide list</a>
		      	<ul id="nav-mobile" class="right hide-on-med-and-down">
			        <li><a href="#new-items" class="modal-trigger"><i class="material-icons icon-2x helper" data-position="left" data-tooltip="new-btn">add</i></a></li>
		      	</ul>
	    	</div>
	  	</nav>
	  	<div class="guide-list">
		</div>
	</div>
</main>
<div class="fixed-action-btn">
    <a class="btn-floating btn-large red">
      	<i class="large material-icons">settings</i>
    </a>
    <ul>
      	<li><a class="btn-floating blue helper multi-unlock-btn" data-activity=".guide-list" data-position="left" data-tooltip="multi-unlock"><i class="material-icons">lock_open</i></a></li>
      	<li><a class="btn-floating red lighten-5 helper multi-lock-btn" data-activity=".guide-list" data-position="left" data-tooltip="multi-lock"><i class="material-icons red-text text-darken-1">lock</i></a></li>
      	<li><a class="btn-floating red helper multi-delete-btn" data-activity=".guide-list" data-position="left" data-tooltip="multi-delete"><i class="material-icons">delete</i></a></li>
    </ul>
</div>
<div id="new-items" class="modal" data-width='30%'>
    <div class="modal-content">
      <h4>New guide</h4>
      <div class="row">
        <div class="input-field col s12">
          <input id="name" name="id" type="text" class="validate">
          <label for="name">Key <small class="red-text"><em>*(required)</em></small></label>
        </div>
        <div class="input-field col s12">
          <input id="content" name="tooltip" type="text" class="validate">
          <label for="content">Tooltip <small class="red-text"><em>*(required)</em></small></label>
        </div>
        <div class="input-field col s12">
          <input id="helper" name="helper" type="text" class="validate">
          <label for="helper">Helper <small class="red-text"><em>*(required)</em></small></label>
        </div>
      </div>
    </div>
    <div class="modal-footer">
      <button id="new-item-btn" type="button" class="modal-action modal-close waves-effect waves-green blue btn helper" data-position="left" data-tooltip="submit-btn">Submit</button>
    </div>
</div>
<div class="content-wrapper">
  <section class="content-header">
        <h1>
          	<?=$title?> <small>controller</small>
        </h1>
        <ol class="breadcrumb">
          	<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
          	<li class="active">Editor</li>
        </ol>
    </section>
    <section class="content">
		<button class="btn left" data-modal="open" data-target="#editor-modal">Editor</button>
		<br><br>
		<textarea id="show-editor"></textarea>
		<div class="modal fade" id="editor-modal">
		  	<div class="modal-dialog">
			    <div class="modal-content">
			      	<div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title">Editor</h4>
			      	</div>
			      	<div class="modal-body">
				        <textarea id="editor"></textarea>
			      	</div>
			      	<div class="modal-footer">
				        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
				        <button id="meta-btn" type="button" class="btn btn-primary">Submit</button>
			      	</div>
			    </div>
		  	</div>
		</div>
    </section> 
</div>
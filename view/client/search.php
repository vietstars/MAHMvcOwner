<section class="main-content" style="margin-top:153px">
		<div class="container">
		<div class="row block false-sale-block" style="padding: 10px;">
			<h3 class="text-uppercase">Key your product name or description for search!</h3>
			<form action="" method="post">
			 	<div class="input-group input-group-lg">
			      <input type="text" class="form-control" name="search" placeholder="Key name or description.">
			      	<span class="input-group-btn">
				        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
			      	</span>
		    	</div>
	      	</form>
		</div>
		<?php if(isset($cate)&&$cate): ?>
		<div class="row block <?=$cat->name?>-sale-block">
			<?php foreach ($cate as $item): ?>
			<div class="col-md-2 text-center product-item">
			  <a href="<?=URL.'product/'.$item->id?>">
				<div class="img-item" style="background:url('<?=$this->modun("image")->getImg($item->image,"product",1)?>')"></div>
				<h5 class='product-name'><?=$this->modun('text')->cut(htmlspecialchars_decode($item->name),20).' - '.htmlspecialchars_decode($item->brand)?></h5>
				<h4 class='category'><?=$this->modun('text')->cut(htmlspecialchars_decode($item->desc),50)?></h4>
				<h3 class='price'>$ <?=$item->price?></h3>
			  </a>
			</div>
			<?php endforeach; ?>
		</div>
		<?php endif;?>
		</div>
</section>
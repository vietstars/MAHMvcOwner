<section class="subcribe-area" style="background: url('<?=IMG?>bg_welcome.jpg')">
	<div class="row container subcribe-bar text-center">
	    <h1 class="section__title">Welcome to Mah Pte Ltd <small> Singapore's premier motorcycle distributor.</small></h1>
	    <div class='welcome-content'>
	    	Built on passion, we are currently the exclusive distributor for top international motorcycling brands including Triumph, Piaggio, Aprilia, Vespa, Moto Guzzi, Gilera, Indian, Victory, SYM, ADIVA, and GIVI, among others.
	    </div>
	</div>
</section>
<section class="main-content">
	<?php if(!empty($best)):?>
	<div class="row block best-sale-block">
		<h1 class="cat-title text-center">
			<a href="#">Best Sellers</a>
		</h1>
		<?php foreach($best as $item):?>
		<div class="col-md-3 text-center product-item">
		  <a href="<?=URL.'product/'.$item->id?>">
			<div class="img-item" style="background:url('<?=$this->modun("image")->getImg($item->image,"product",1)?>')"></div>
			<h2 class='product-name'><?=$this->modun('text')->cut(htmlspecialchars_decode($item->name),20).' - '.htmlspecialchars_decode($item->brand)?></h2>
			<h5 class='category'><?=$this->modun('text')->cut(htmlspecialchars_decode($item->desc),50)?></h5>
			<h3 class='price'>$ <?=$item->price?></h3>
		  </a>
		</div>
		<?php endforeach;?>
		<?php if(count($best)==8):?>
			<h3 class="cat-btn text-center">
				<a href="#" class="goto-btn">Shop Best Sellers <i class="fa fa-long-arrow-right"></i></a>
			</h3>
		<?php endif;?>
	</div>
	<?php endif;
	if($cate):
	foreach ($cate as $cat): $items=$this->modun('index')->getShop($cat->id);?>
	<?php if($items):?>
	<div class="row block <?=$cat->name?>-sale-block">
		<h1 class="cat-title text-center">
			<a href="<?=URL.'category/'.$cat->id?>"><?=htmlspecialchars_decode($cat->name)?></a>
		</h1>
		<?php foreach($items as $item):?>
		<div class="col-md-3 text-center product-item">
		  <a href="<?=URL.'product/'.$item->id?>">
			<div class="img-item" style="background:url('<?=$this->modun("image")->getImg($item->image,"product",1)?>')"></div>
			<h2 class='product-name'><?=$this->modun('text')->cut(htmlspecialchars_decode($item->name),20).' - '.htmlspecialchars_decode($item->brand)?></h2>
			<h5 class='category'><?=$this->modun('text')->cut(htmlspecialchars_decode($item->desc),50)?></h5>
			<h3 class='price'>$ <?=$item->price?></h3>
		  </a>
		</div>
		<?php endforeach;?>
		<?php if(count($items)==8):?>
		<h3 class="cat-btn text-center">
			<a href="<?=URL.'category/'.$cat->id?>" class="goto-btn">Shop <?=htmlspecialchars_decode($cat->name)?> <i class="fa fa-long-arrow-right"></i></a>
		</h3>
		<?php endif;?>
	</div>
	<?php endif;?>
	<?php endforeach;else:?>
		<div class="row block false-sale-block">
			<h1 class="cat-title text-center">
				<a href="javascript:;">Category not available!</a>
			</h1>
		</div>
	<?php endif;?>
</section>
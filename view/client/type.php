<section class="main-content">
	<?php if(!empty($best)):?>
	<div class="row block best-sale-block">
		<h1 class="cat-title text-center">
			<a href="#">Best Sellers</a>
		</h1>
		<?php foreach($best as $item):?>
		<div class="col-xs-6 col-md-4 text-center product-item">
		  <a href="<?=URL.'product/'.$item->id?>">
			<div class="img-item" style="background:url('<?=$this->modun("image")->getImg($item->image,"product",1)?>')"></div>
			<h2 class='product-name'><?=$this->modun('text')->cut(htmlspecialchars_decode($item->name),20).' - '.htmlspecialchars_decode($item->brand)?></h2>
			<h5 class='category'><?=$this->modun('text')->cut(htmlspecialchars_decode($item->desc),50)?></h5>
			<h3 class='price'>$ <?=$item->price?></h3>
		  </a>
		</div>
		<?php endforeach;?>
		<?php if(count($best)==6):?>
			<h3 class="cat-btn text-center">
				<a href="#" class="goto-btn">Shop Best Sellers <i class="fa fa-long-arrow-right"></i></a>
			</h3>
		<?php endif;?>
	</div>
	<?php endif;
	if($pr_type):
	foreach ($pr_type as $t):$items=$this->modun('index')->getType($t->id,30);?>
	<?php if($items):?>
	<div class="row block <?=$t->name?>-sale-block">
		<h1 class="cat-title text-center">
			<a href="#"><?=htmlspecialchars_decode($t->name)?></a>
		</h1>
		<?php foreach($items as $item):?>
		<div class="col-xs-6 col-md-3 text-center product-item">
		  <a href="<?=URL.'product/'.$item->id?>">
			<div class="img-item" style="background:url('<?=$this->modun("image")->getImg($item->image,"product",1)?>')"></div>
			<h2 class='product-name'><?=$this->modun('text')->cut(htmlspecialchars_decode($item->name),20).' - '.htmlspecialchars_decode($item->brand)?></h2>
			<h5 class='category'><?=$this->modun('text')->cut(htmlspecialchars_decode($item->desc),50)?></h5>
			<h3 class='price'>$ <?=$item->price?></h3>
		  </a>
		</div>
		<?php endforeach;
		if(count($items)%4==0):?>
			<h3 class="cat-btn text-center">
				<a href="javascript:;" class="more-btn">Load more <i class="fa fa-long-arrow-down"></i></a>
			</h3>
		<?php endif;?>
	</div>
	<?php endif;?>
	<?php endforeach;else:?>
		<div class="row block false-sale-block">
			<h1 class="cat-title text-center">
				<a href="#">Category not availbility!</a>
			</h1>
		</div>
	<?php endif;?>
</section>
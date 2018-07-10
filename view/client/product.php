<section class="main-content">
	<nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item active"><a href="<?=URL.'brandChange/'.$item->brand?>"><?=htmlspecialchars_decode($item->brand_name)?></a></li>
	    <li class="breadcrumb-item active"><a href="<?=URL.'category/'.$item->cate?>"><?=htmlspecialchars_decode($item->cate_name)?></a></li>
	    <li class="breadcrumb-item active" aria-current="page"><?=htmlspecialchars_decode($item->name)?></li>
	  </ol>
	</nav>
	<div class="row block item-block row-eq-height" style="margin-top:0;">
		<div class="col-md-8 text-center">
			<div class="col-md-3 text-center hidden-sx hidden-sm">
				<?php if($images):foreach($images as $got):?>
				  	<div class="image-list click-view" data-img="<?=$this->modun("image")->getImg($got->image,"product")?>" style="background:url('<?=$this->modun("image")->getImg($got->image,"product",1)?>')">		  		
				  	</div>
			  	<?php endforeach;else:?>
			  		<div class="image-list" style="background:url('<?=$this->modun("image")->getImg('no_photo.svg')?>')">		  		
			  		</div>
			  	<?php endif;?>
			  	<div class="fb-share-button" data-href="<?= URL.'product/'.$item->id;?>" data-layout="button_count" data-size="small" data-mobile-iframe="true"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=<?= urlencode(URL.'product/'.$item->id);?>&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Share</a></div>
		  	</div>
		  	<?php if($images):?>
			  	<div class="col-md-9 image-show" style="background:url('<?=$this->modun("image")->getImg($images[0]->image,"product")?>');padding-top:80%;">		  		
			  	</div>
		  	<?php else:?>
			  	<div class="col-md-9 image-show" style="background:url('<?=$this->modun("image")->getImg('no_photo.svg')?>')">		  		
		  		</div>
		  	<?php endif;?>
		</div>
		<div class="col-md-4" style="position:relative;">
			<div class='item-detail fix-top'>
		  		<h1 class="item-title text-center"><?=htmlspecialchars_decode($item->name)?><small class='text-center'><?=htmlspecialchars_decode($item->desc)?></small></h1>
				<h3 class="item-price text-danger text-center">$ <?=$item->price?></h3>
				<h4 class="item-info">Brand: <?=htmlspecialchars_decode($item->brand_name)?></h4>
				<h4 class="item-info">Category: <?=htmlspecialchars_decode($item->cate_name)?></h4>
				<h4 class="item-info">Type: <?=htmlspecialchars_decode($item->type_name)?></h4>
				<?php if($item->status=='a'||$item->status=='b'):?>
					<h3 class="cat-btn primary text-center">
						<?php if($added):?>
							<a href="<?= (isset($_SESSION['logid']))?URL.'myCart':URL.'login';?>">Check Cart <i class="fa fa-shopping-cart"></i></a>
						<?php else:?>
							<a href="<?= (isset($_SESSION['logid']))?'javascript:;':URL.'login';?>" class="cart-btn" <?= (isset($_SESSION['logid']))?'data-id="'.$item->id.'"':null;?>>Add to cart <i class="fa fa-shopping-cart"></i></a>
						<?php endif;?>
					</h3>
				<?php elseif($item->status=='o'):?>
					<h3 class="cat-btn secondary text-center">
						<?php if($interest):?>
							<a href="<?= (isset($_SESSION['logid']))?'javascript:;':URL.'login';?>">Thank for Like <i class="fa fa-thumbs-o-up"></i></a>
						<?php else:?>
							<a href="<?= (isset($_SESSION['logid']))?'javascript:;':URL.'login';?>" class="like-btn" <?= (isset($_SESSION['logid']))?'data-id="'.$item->id.'"':null;?>>Express interest <i class="fa fa-thumbs-o-up"></i></a>
						<?php endif;?>
					</h3>
				<?php endif;?>
				<hr>
				<h1 class="item-title text-center hidden-sx hidden-sm">Reviews</h1>
				<h1 class="text-center text-warning rating hidden-sx hidden-sm">
					<!-- <i class="fa fa-star"></i><i class="fa fa-star-half-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i> -->
					<?php for($i=1;$i<=5;$i++):?>
						<i class="fa fa-star-o" data-rate="<?=$i?>"></i>
					<?php endfor; ?>: 80 reviews
				</h1>
			</div>
		</div>
	</div>
	<div class="row block bottom-block">
		<h1 class="cat-title text-center">
			<a href="#">You might also enjoy these…</a>
		</h1>
		<?php foreach($related as $item):?>
		<div class="col-md-3 text-center product-item">
		  <a href="<?=URL.'product/'.$item->id?>">
			<div class="img-item" style="background:url('<?=$this->modun("image")->getImg($item->image,"product",1)?>')">
				<div class="badge badge-new"><span>Related</span></div>
			</div>
			<h2 class='product-name'><?=$this->modun('text')->cut(htmlspecialchars_decode($item->name),20).' - '.htmlspecialchars_decode($item->brand)?></h2>
			<h5 class='category'><?=$this->modun('text')->cut(htmlspecialchars_decode($item->desc),50)?></h5>
			<h3 class='price'>$ <?=$item->price?></h3>
		  </a>
		</div>
		<?php endforeach;?>
	</div>
	<div class="row block service-block">
		<div class="col-md-6">
			<div class="item-bottom <?=(!$manager)?'text-center':null;?>">
				<h2 class="service-title" <?=($manager)?'style="text-align:left;"':null;?>><?php if($manager):?> <div class="edit-svtitle"><input type="text" class="edit-form" value="<?=$this->modun('text')->getSvTitle()?>" style="border:0;width:90%;"><i class="fa fa-edit"  data-id="3" style="position:absolute;top:10px;right:-20px;"></i></div><?php else: echo $this->modun('text')->getSvTitle(); endif;?></h2>
				<span class="service-content" style="position:relative;"><?php if($manager):?> <textarea class="edit-form" rows="4" style="border:0;width:100%;resize: vertical;"><?=$this->modun('text')->getSvContent()?></textarea><i class="fa fa-edit" data-id="4" style="position:absolute;top:10px;right:-20px;"></i> <?php else: echo $this->modun('text')->getSvContent(); endif;?></span>
			</div>
		</div>
		<div class="col-md-6">
			<div class="item-bottom text-center">
				<h2 class="service-title" <?=($manager)?'style="text-align:left;"':null;?>><?php if($manager):?> <div class="edit-svtitle"><input type="text" class="edit-form" value="<?=$this->modun('text')->getGbTitle()?>" style="border:0;width:90%;"><i class="fa fa-edit"  data-id="5" style="position:absolute;top:10px;right:-20px;"></i></div><?php else: echo $this->modun('text')->getGbTitle(); endif;?></h2>
				<span class="service-content" style="position:relative;"><?php if($manager):?> <textarea class="edit-form" rows="6" style="border:0;width:100%;resize: vertical;"><?=$this->modun('text')->getGbContent()?></textarea><i class="fa fa-edit" data-id="6" style="position:absolute;top:10px;right:-20px;"></i> <?php else: echo $this->modun('text')->getGbContent(); endif;?></span>
			</div>
		</div>
	</div>
</section>
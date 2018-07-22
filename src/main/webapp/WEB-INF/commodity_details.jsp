<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css" />
		<link rel="stylesheet" href="css/style.css" />
		<title>商品详情</title>
	</head>
	<body>
		<nav class="navbar navbar-default nav-mar-bot navbar-fixed-top" role="navigation">
		    <div class="container">
		    <div class="navbar-header">
		        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		        </button>
		        <a class="navbar-brand" href="#"><img src="img/logo.png" class="logo"></a>
		    </div>
		    <div class="collapse navbar-collapse" id="example-navbar-collapse">
		        <ul class="nav navbar-nav">
		            <li><a href="index.html">首页</a></li>
		            <li><a href="list.html">所有商品</a></li>
		        </ul>
		        <ul class="nav navbar-nav navbar-right">
		        	<li><a href="search.html">搜索</a></li>
		        	<li><a href="register.html">注册</a></li>
		        	<li><a href="sign_in.html">登录</a></li>
		        	<li><a href="shopping_cart.html"><span class="glyphicon glyphicon-shopping-cart glyphicon-shopping-cart-size"></span><span class="badge badge-position">7</span></a></li>
		        </ul>
		    </div>
		</nav>
		<div class="container other-page-magtop">
			<div class="page-header">
				<ul class="breadcrumb">
					<li>
						<a href="index.html">主页</a>
					</li>
					<li>
						<a>所有商品</a>
					</li>
					<li>
						<a class="active">商品名</a>
					</li>
				</ul>
			</div>
			<div class="carousel slide hidden-sm hidden-md hidden-lg" id="commodity_details_slide">
				
				<div class="carousel-inner">
					<div class="item active">
						<img src="img/new1.png"/>
					</div>
					<div class="item">
						<img src="img/new1.png"/>
					</div>
					<div class="item">
						<img src="img/new1.png"/>
					</div>
					<div class="item">
						<img src="img/new1.png"/>
					</div>
				</div>
				<a class="right carousel-indicators" href="#commodity_details_slide" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>	
			<div class="row">
				<div class="col-sm-6 hidden-xs">
					<div>
						<img width="100%" src="img/new1.png"/>
					</div>
					<div class="row">
						<div class="col-xs-3">
							<img class="img-thumbnail" src="img/new1.png"/>
						</div>
						<div class="col-xs-3">
							<img class="img-thumbnail" src="img/new1.png"/>
						</div>
						<div class="col-xs-3">
							<img class="img-thumbnail" src="img/new1.png"/>
						</div>
						<div class="col-xs-3">
							<img class="img-thumbnail" src="img/new1.png"/>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6">
					<form class="form-horizontal" role="form">
						<div class="page-header">
							<h3>便携简约清洁扫帚</h3>
							<p>精选材质，设计大师设计，做工精细，居家必备品</p>
							<span class="commodity-pricee lead">$580.00 </span> &nbsp;已售出<span>12</span>件
						</div>
						<div>
							<p><b>选择数量</b></p> 
							<div class="row">
								<div class="col-md-4 col-sm-5 col-xs-5">
									<div class="input-group input-group-sm">
									    <span class="input-group-btn">
									    	<button class="btn btn-default" type="button">-</button>
									    </span>
									    <input type="text" class="form-control text-center" value="1">
									    <span class="input-group-btn">
									       <button class="btn btn-default" type="button">+</button>
									    </span>
									</div>
								</div>
								<div class="col-xs-7 col-sm-6">
									<span>件（库存2145件）</span>
								</div>
							</div>
							<div class="details-btn">
								<button class="btn btn-warning" type="submit">加入购物车</button>
								<button class="btn btn-warning" type="submit">立即购买</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<hr />
			<div class="commodity-details">
				<img width="100%" src="img/index_slide_1.png"/>
				
				<p>青叶良品原创生活类电商品牌，秉承一贯的严谨态度，我们深入世界各地，从源头全程严格把控商品生产环节，力求帮助消费者甄选到最优质的商品，全线采用天然原材料，控制甲醛低量无害，采用进口工艺，国际生产线不断优化，食材保证核心原产地新鲜直供，让你享受品质生活</p>
				<img width="100%" src="img/index_slide_2.png"/>
				<p>青叶良品原创生活类电商品牌，秉承一贯的严谨态度，我们深入世界各地，从源头全程严格把控商品生产环节，力求帮助消费者甄选到最优质的商品，全线采用天然原材料，控制甲醛低量无害，采用进口工艺，国际生产线不断优化，食材保证核心原产地新鲜直供，让你享受品质生活</p>
			</div>
			
		</div>
		<div class="container-fluid index-bottom panel-footer">
			<div class="container">
				<div class="col-md-3 col-sm-12 text-center">
					<h4>青竹简介</h4>
					<p>青叶良品原创生活类电商品牌，秉承一贯的严谨态度，我们深入世界各地，从源头全程严格把控商品生产环节，力求帮助消费者甄选到最优质的商品，全线采用天然原材料，控制甲醛低量无害，采用进口工艺，国际生产线不断优化，食材保证核心原产地新鲜直供，让你享受品质生活</p>
				</div>
				<div class="col-md-1">
				</div>
				<div class="col-md-4 col-sm-12 text-center">
					<div class="row">
						<div class="col-xs-4 col-sm-4">
							<h4>关于我们</h4>
						</div>
						<div class="col-xs-4 col-sm-4">
							<h4>支付方式</h4>
						</div>
						<div class="col-xs-4 col-sm-4">
							<h4>相关服务</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4 col-sm-4">
							<p><a href="#" target="_blank">我的品牌</a></p>
						</div>
						<div class="col-xs-4 col-sm-4">
							<p><a href="#" target="_blank">微信支付</a></p>
						</div>
						<div class="col-xs-4 col-sm-4">
							<p><a href="#" target="_blank">退货政策</a></p>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4 col-sm-4">
							<p><a href="#" target="_blank">公司动态</a></p>
						</div>
						<div class="col-xs-4 col-sm-4">
							<p><a href="#" target="_blank">支付宝</a></p>
						</div>
						<div class="col-xs-4 col-sm-4">
							<p><a href="#" target="_blank">购物流程</a></p>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4 col-sm-4">
							<p><a href="#" target="_blank">经历发展</a></p>
						</div>
						<div class="col-xs-4 col-sm-4">
							<p><a href="#" target="_blank">百度钱包</a></p>
						</div>
						<div class="col-xs-4 col-sm-4">
							<p><a href="#" target="_blank">客服服务</a></p>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4 col-sm-4">
							<p><a href="#" target="_blank">商品推广</a></p>
						</div>
						<div class="col-xs-4 col-sm-4">
							<p><a href="#" target="_blank">货到付款</a></p>
						</div>
						<div class="col-xs-4 col-sm-4">
							<p><a href="#" target="_blank">商务合作</a></p>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-12" align="center">
					<img src="img/footerImgShow_2.png"/>
					<h4 class="text-center">微信公众号</h4>
				</div>
			</div>
		</div>
		<div class="container-fluid text-center panel-footer">
				<p>Copyright1999-2016 北京中公教育科技股份有限公司 .All Rights Reserved 京ICP证161188号</p>
		</div>
		<script type="text/javascript" src="bootstrap/js/jquery-3.2.1.min.js" ></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.js" ></script>
	</body>
</html>

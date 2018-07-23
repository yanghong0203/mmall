<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap-theme.css" />
		<link rel="stylesheet" href="../../css/style.css" />
		<title>羚羊数码</title>
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
					<a class="navbar-brand" href="/index"><img src="img/logo.png" class="logo"></a>
				</div>
				<div class="collapse navbar-collapse" id="example-navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="/index">首页</a></li>
						<li><a href="list.html">所有商品</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="search.html">搜索</a></li>
						<li><a href="register.html">注册</a></li>
						<li><a href="sign_in.html">登录</a></li>
						<li><a href="shopping_cart.html"><span class="glyphicon glyphicon-shopping-cart glyphicon-shopping-cart-size"></span><span class="badge badge-position">7</span></a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="carousel slide container" id="indexCarousel">
			<ol class="carousel-indicators">
				<c:forEach items="${productList}" varStatus="status">
					<c:if test="${status.first}">
						<li class="active" data-slide-to="${status.index}" data-target="#indexCarousel"></li>
					</c:if>
					<li data-slide-to="${status.index}" data-target="#indexCarousel"></li>
				</c:forEach>
			</ol>
			<div class="carousel-inner">
				<c:forEach items="${productList}" var="product" varStatus="status">
					<c:if test="${status.first}">
						<div class="item active">
							<a href="#" target="_blank"><img alt="" src="${product.imageHost}${product.mainImage}" /></a>
						</div>
					</c:if>
					<div class="item">
						<a href="#" target="_blank"><img alt="" src="${product.imageHost}${product.mainImage}" /></a>
					</div>
				</c:forEach>

				<%--<div class="item">
					<a href="#" target="_blank"><img alt="" src="img/index_slide_2.png" /></a>
					<div class="carousel-caption">
					</div>
				</div>
				<div class="item">
					<a href="#" target="_blank"><img alt="" src="img/index_slide_3.png" /></a>
				</div>--%>
			</div>
			<a class="left carousel-control" href="#indexCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
			<a class="right carousel-control" href="#indexCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
		</div>		
		<div class="container">
			<h2 class="index-title-center">新品推荐-精心挑选</h2>
			<p class="index-title-center">居家必备实用小单品</p>
			<hr />
			<div class="row new-recommend" align="center">
				<c:forEach items="${productList}" var="product">
					<div class="col-xs-6 col-sm-6 col-md-3 new-recommend-div">
						<div class="thumbnail">
							<a href="commodity_details.html" target="_blank">
								<img class="img-responsive" src="${product.imageHost}${product.subImage[0]}"/>
								<h5>${product.name}</h5>
								<p class="commodity-price">${product.price}</p>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
			<h2 class="index-title-center">专题活动-限时促销</h2>
			<p class="index-title-center">严选材质，用心设计，精致居家生活</p>
			<hr />
			<div class="row">
				<div class="col-sm-7">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img width="100%" src="img/zt1.jpg"/>
						</a>
					</div>
				</div>
				<div class="col-sm-5">
					<div class="thumbnail">
						<a href="#" target="_blank"><img src="img/zt2.jpg"/></a>
					</div>
				</div>
				<div class="col-sm-5">
					<div class="thumbnail">
						<a href="#" target="_blank"><img src="img/zt3.jpg"/></a>
					</div>
				</div>
			</div>
			<h2 class="index-title-center">青竹良品-你的居家首选</h2>
			<p class="index-title-center">天然之源，诚挚之礼，严格质检</p>
			<hr />
			<div class="row text-center qzlp">
				<div class="col-xs-6 col-md-2 col-sm-4 hidden-xs">
					<a href="#" target="_blank">
					<img class="img-responsive" src="img/ha1.jpg"/>
					
				</div>
				<div class="col-xs-6 col-md-2 col-sm-4 qzlp-padding">
					<a class="" href="#" target="_blank">
						<img class="img-responsive" src="img/ha3.png"/>
						<h5>简约时尚水泥花瓶</h5>
						<p class="commodity-price">450.00</p>
					</a>
				</div>
				<div class="col-xs-6 col-md-2 col-sm-4 qzlp-padding">
					<a class="" href="#" target="_blank">
						<img class="img-responsive" src="img/ha3.png"/>
						<h5>简约时尚水泥花瓶</h5>
						<p class="commodity-price">450.00</p>
					</a>
				</div>
				<div class="col-xs-6 col-md-2 col-sm-4">
					<a href="#" target="_blank">
						<img class="img-responsive" src="img/ha3.png"/>
						<h5>简约时尚水泥花瓶</h5>
						<p class="commodity-price">450.00</p>
					</a>
				</div>
				<div class="col-xs-6 col-md-2 col-sm-4">
					<a href="#" target="_blank">
						<img class="img-responsive" src="img/ha3.png"/>
						<h5>简约时尚水泥花瓶</h5>
						<p class="commodity-price">450.00</p>
					</a>
				</div>
				<div class="col-xs-6 col-md-2 col-sm-4">
					<a href="#" target="_blank">
						<img class="img-responsive" src="img/ha3.png"/>
						<h5>简约时尚水泥花瓶</h5>
						<p class="commodity-price">450.00</p>
					</a>
				</div>
			
			
				<div class="col-xs-6 col-md-2 col-sm-4 hidden-xs">
					<a href="#" target="_blank">
						<img class="img-responsive" src="img/ha1.jpg"/>
					</a>
				</div>
				<div class="col-xs-6 col-md-2 col-sm-4 qzlp-padding">
					<a class="" href="#" target="_blank">
						<img class="img-responsive" src="img/ha3.png"/>
						<h5>简约时尚水泥花瓶</h5>
						<p class="commodity-price">450.00</p>
					</a>
				</div>
				<div class="col-xs-6 col-md-2 col-sm-4 qzlp-padding">
					<a class="" href="#" target="_blank">
						<img class="img-responsive" src="img/ha3.png"/>
						<h5>简约时尚水泥花瓶</h5>
						<p class="commodity-price">450.00</p>
					</a>
				</div>
				<div class="col-xs-6 col-md-2 col-sm-4">
					<a href="#" target="_blank">
						<img class="img-responsive" src="img/ha3.png"/>
						<h5>简约时尚水泥花瓶</h5>
						<p class="commodity-price">450.00</p>
					</a>
				</div>
				<div class="col-xs-6 col-md-2 col-sm-4">
					<a href="#" target="_blank">
						<img class="img-responsive" src="img/ha3.png"/>
						<h5>简约时尚水泥花瓶</h5>
						<p class="commodity-price">450.00</p>
					</a>
				</div>
				<div class="col-xs-6 col-md-2 col-sm-4 ">
					<a href="#" target="_blank">
						<img class="img-responsive" src="img/ha3.png"/>
						<h5>简约时尚水泥花瓶</h5>
						<p class="commodity-price">450.00</p>
					</a>
				</div>
			</div>
			<h2 class="index-title-center">全球打牌优选-买手用心挑选</h2>
			<p class="index-title-center">全球好货 原装正品 海外直邮 自有报税仓</p>
			<hr />
			<div class="row" align="center">
				<div class="col-xs-6 col-md-2 col-sm-4">
					<a href="#" target="_blank">
						<img class="img-responsive" src="img/pb.png"/>
					</a>
				</div>
				<div class="col-xs-6 col-md-2 col-sm-4">
					<a href="#" target="_blank">
						<img class="img-responsive" src="img/pb.png"/>
					</a>
				</div>
				<div class="col-xs-6 col-md-2 col-sm-4">
					<a href="#" target="_blank">
						<img class="img-responsive" src="img/pb.png"/>
					</a>
				</div>
				<div class="col-xs-6 col-md-2 col-sm-4">
					<a href="#" target="_blank">
						<img class="img-responsive" src="img/pb.png"/>
					</a>
				</div>
				<div class="col-xs-6 col-md-2 col-sm-4">
					<a href="#" target="_blank">
						<img class="img-responsive" src="img/pb.png"/>
					</a>
				</div>
				<div class="col-xs-6 col-md-2 col-sm-4">
					<a href="#" target="_blank">
						<img class="img-responsive" src="img/pb.png"/>
					</a>
				</div>
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

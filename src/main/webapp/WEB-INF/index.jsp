<%@ page import="com.mmall.common.Const" %>
<%@ page import="com.mmall.pojo.User" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% User user = (User) session.getAttribute(Const.CURRENT_USER);%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap-theme.css" />
		<link rel="stylesheet" href="../../css/style.css" />
        <link rel="icon" href="http://img.youngh.cn/title.ico" type="image/x-icon"/>
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
					<a class="navbar-brand" href="/index"><img src="http://img.youngh.cn/logo.png" class="logo"></a>
				</div>
				<div class="collapse navbar-collapse" id="example-navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="/index">首页</a></li>
						<li><a href="/list">所有商品</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/search">搜索</a></li>
                        <%
                            if (user == null)
                            {%>
                                <li><a href="/register">注册</a></li>
                                <li><a href="/login">登录</a></li>
                            <%}
                            else
                            {%>	<li><a href="/user_index"><%=user.getUsername()%></a></li>
                                <li><a href="/logout">注销</a>
                            <%}
					    %>
						<li><a href="/shopping_cart"><span class="glyphicon glyphicon-shopping-cart glyphicon-shopping-cart-size"></span></a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="carousel slide container" id="indexCarousel">
			<ol class="carousel-indicators">
				<c:set var="lunbo" value="1" />
				<c:forEach items="${productList}" var="product">
					<c:if test="${product.indexStatus == 1}">
						<c:choose>
							<c:when test="${lunbo == 1}">
								<c:set var="lunbo" value="${lunbo+1}" />
								<li class="active" data-slide-to="${lunbo}" data-target="#indexCarousel"></li>
							</c:when>
							<c:otherwise>
								<li data-slide-to="${lunbo}" data-target="#indexCarousel"></li>
								<c:set var="lunbo" value="${lunbo+1}" />
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
			</ol>
			<div class="carousel-inner">
				<c:set var="lunboimg" value="1" />
				<c:forEach items="${productList}" var="product">
					<c:if test="${product.indexStatus == 1}">
						<c:choose>
							<c:when test="${lunboimg == 1}">
								<c:set var="lunboimg" value="0" />
								<div class="item active">
									<a href="/product_detail?productId=${product.id}" target="_blank"><img alt="" src="${product.imageHost}${product.mainImage}" /></a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="item">
									<a href="/product_detail?productId=${product.id}" target="_blank"><img alt="" src="${product.imageHost}${product.mainImage}" /></a>
								</div>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
			</div>
			<a class="left carousel-control" href="#indexCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
			<a class="right carousel-control" href="#indexCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
		</div>
		<div class="container">
			<h2 class="index-title-center">精心挑选-新品推荐</h2>
			<%--<p class="index-title-center">居家必备实用小单品</p>--%>
			<hr />
			<div class="row new-recommend" align="center">
				<c:forEach items="${productList}" var="product">
					<c:if test="${product.indexStatus == 2}">
						<div class="col-xs-6 col-sm-6 col-md-3 new-recommend-div">
							<div class="thumbnail">
								<a href="/product_detail?productId=${product.id}" target="_blank">
									<img class="img-responsive" src="${product.imageHost}${product.subImage[0]}"/>
									<h5>${product.name}</h5>
									<p class="commodity-price">${product.price}</p>
								</a>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<h2 class="index-title-center">专题活动-限时促销</h2>
			<%--<p class="index-title-center">严选材质，用心设计，精致居家生活</p>--%>
			<hr />
			<div class="row promotion">
				<div class="col-xs-6 col-sm-6 col-md-3">
					<c:forEach items="${productList}" var="product">
						<c:if test="${product.name == 'OPPO R15星云特别版'}">
							<a href="/product_detail?productId=${product.id}"><img class="img-responsive" src="${product.imageHost}${product.mainImage}"/></a>
						</c:if>
					</c:forEach>
					<c:forEach items="${productList}" var="product">
						<c:if test="${product.name == 'Meizu/魅族 魅蓝 E3'}">
							<a href="/product_detail?productId=${product.id}"><img class="img-responsive" src="${product.imageHost}${product.mainImage}"/></a>
						</c:if>
					</c:forEach>
				</div>
				<div class="col-md-9">
					<c:forEach items="${productList}" var="product">
						<c:if test="${product.indexStatus == 3}">
							<c:if test="${product.name != 'Meizu/魅族 魅蓝 E3' and product.name != 'OPPO R15星云特别版'}">
								<div class="col-md-4 col-xs-6 col-sm-6">
									<a href="/product_detail?productId=${product.id}"><img class="img-responsive" src="${product.imageHost}${product.mainImage}"/></a>
								</div>
							</c:if>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<h2 class="index-title-center">热门商品</h2>
			<%--<p class="index-title-center">天然之源，诚挚之礼，严格质检</p>--%>
			<hr />
			<div class="row promotion">
				<c:forEach items="${productList}" var="product">
					<c:if test="${product.indexStatus == 4 and product.name == '360 N6Pro'}">
						<div class="col-sm-12 col-md-3">
							<a href="/product_detail?productId=${product.id}" ><img class="img-responsive" src="${product.imageHost}${product.mainImage}"/></a>
						</div>
					</c:if>
				</c:forEach>
				<c:forEach items="${productList}" var="product">
					<c:if test="${product.indexStatus == 4 and product.name == 'Meizu/魅族 PRO 7'}">
						<div class="col-sm-12 col-md-9">
							<a href="/product_detail?productId=${product.id}" ><img class="img-responsive" src="${product.imageHost}${product.mainImage}"/></a>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<div class="row hot-product-list">
				<c:forEach items="${productList}" var="product">
					<c:if test="${product.indexStatus == 4}">
						<c:if test="${product.name != '360 N6Pro' and product.name != 'Meizu/魅族 PRO 7'}">
							<div class="col-xs-6 col-sm-3 col-md-2 thumbnail">
								<a href="/product_detail?productId=${product.id}" ><img src="${product.imageHost}${product.mainImage}" /></a>
								<h5>${product.name}</h5>
								<p class="commodity-price">${product.price}</p>
							</div>
						</c:if>
					</c:if>
				</c:forEach>
			</div>
			<%--<h2 class="index-title-center">全球打牌优选-买手用心挑选</h2>
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
			</div>--%>
		</div>
		<div class="container-fluid index-bottom panel-footer">
			<div class="container">
				<div class="col-md-3 col-sm-12 text-center">
					<h4>羚羊数码</h4>
					<p>羚羊数码原创生活类电商品牌</p>
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
					<img width="150px" height="150px" src="http://img.youngh.cn/wximg.png"/>
					<h4 class="text-center">微信公众号</h4>
				</div>
			</div>
		</div>
		<div class="container-fluid text-center panel-footer">
			<p>Copyright2017-2018 重庆羚羊科技股份有限公司 .All Rights Reserved</p>
		</div>
		<script type="text/javascript" src="bootstrap/js/jquery-3.2.1.min.js" ></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.js" ></script>
	</body>
</html>

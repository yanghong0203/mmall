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
		<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css" />
		<link rel="stylesheet" href="css/style.css" />
		<title>所有商品</title>
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
					<%
						if (user == null)
						{%>	<li><a href="/register">注册</a></li>
					<li><a href="/login">登录</a></li>
					<%}
					else
					{%>	<li><a href="/user_index"><%=user.getUsername()%></a></li>
					<li><a href="/logout">注销</a>
							<%}
					%>
		        	<li><a href="shopping_cart.html"><span class="glyphicon glyphicon-shopping-cart glyphicon-shopping-cart-size"></span><span class="badge badge-position">7</span></a></li>
		        </ul>
		    </div>
			</div>
		</nav>
		<div class="container other-page-magtop">
			<div class="page-header">
				<ul class="breadcrumb">
					<li>
						 <a href="index.html">主页</a>
					</li>
					<li>
						 <a class="active">搜索</a>
					</li>
				</ul>
				<div align="center">
					<div class="input-group col-md-5 col-xs-8 col-lg-3 col-sm-6">
						<input type="text" class="form-control">
	  					<span class="input-group-btn">
					    	<button class="btn btn-default" type="button">搜索</button>
					    </span>
					</div>
				</div>
			</div>
			<p class="text-right">共24个商品</p>
			<div class="row commodity-list">
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank">
							<img src="img/new1.png"/>
							<h5>便携简约清洁扫帚</h5>
							<p class="commodity-price">$580.00</p>
						</a>
					</div>
				</div>
				
			</div>
			<nav aria-label="Page navigation" class="pull-right">
			  <ul class="pagination">
			    <li>
			      <a href="#" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <li><a href="#">1</a></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
			    <li>
			      <a href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
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

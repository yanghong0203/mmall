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
		<link rel="icon" href="http://img.youngh.cn/title.ico" type="image/x-icon"/>
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
		<div class="container other-page-magtop">
			<div class="page-header">
				<ul class="breadcrumb">
					<li>
						<a href="/index">主页</a>
					</li>
					<li>
						<a href="/list">所有商品</a>
					</li>
					<li>
						<a class="active">商品名</a>
					</li>
				</ul>
			</div>
			<div class="carousel slide hidden-sm hidden-md hidden-lg" id="commodity_details_slide">
				<div class="carousel-inner">
					<div class="item active" align="center">
						<img src="${product.imageHost}${product.subImage[0]}"/>
					</div>
					<div class="item" align="center">
						<img src="${product.imageHost}${product.subImage[1]}"/>
					</div>
					<div class="item" align="center">
						<img src="${product.imageHost}${product.subImage[2]}"/>
					</div>
					<div class="item" align="center">
						<img src="${product.imageHost}${product.subImage[3]}"/>
					</div>
				</div>
				<a class="left carousel-control" href="#commodity_details_slide" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
				<a class="right carousel-control" href="#commodity_details_slide" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>	
			<div class="row">
				<div class="col-sm-6 hidden-xs">
					<div align="center">
						<img class="img-responsive subImageMain" src="${product.imageHost}${product.subImage[0]}"/>
					</div>
					<div class="row subImages">
						<c:forEach items="${product.subImage}" var="img">
							<div class="col-xs-3">
								<a href="javascript:void(0);"><img class="img-thumbnail" src="${product.imageHost}${img}"/></a>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6">
					<form class="form-horizontal" id="productInfo" role="form">
						<div>
							<input type="hidden" name="productId" value="${product.id}">
							<h3>${product.name}</h3>
							<p class="p-subtitle">${product.subtitle}</p>
						</div>
						<div class="p-price-div info-item">
							<span class="p-lab">价格：</span>
							<span class="p-price">￥${product.price}</span>
						</div>
						<div class="info-item">
							<span class="p-lab">数量：</span>
							<div class="p-num">
								<div class="input-group input-group-sm">
								    <span class="input-group-btn">
								    	<button class="btn btn-default" type="button" id="pBtnReduce">-</button>
								    </span>
									<input type="text" class="form-control text-center" name="count" id="pNumber" readonly="readonly" value="1">
									<span class="input-group-btn">
								       <button class="btn btn-default" type="button" id="pBtnAdd">+</button>
								    </span>
								</div>
							</div>
						</div>
						<div  class="info-item">
							<span class="p-lab">库存：</span>
							<span class="p-stock">${product.stock}</span>
						</div>
						<div  class="info-item p-btn">
							<button class="btn btn-warning" onclick="addCart()" type="button">加入购物车</button>
							<button class="btn btn-danger" type="submit">立即购买</button>
						</div>
					</form>
				</div>
			</div>
			<hr />
			<div class="p-detail container" align="center">
				${product.detail}
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

		<script type="text/javascript">
			$(function () {
			    $(".p-detail").addClass("img-responsive");
				$("#pBtnReduce").click(function () {
					var num = parseInt($("#pNumber").val());
					if(num > 1){
						$("#pNumber").val(num-1);
					}
				});
				$("#pBtnAdd").click(function () {
					var num = parseInt($("#pNumber").val());
					if(num <=${product.stock}){
						$("#pNumber").val(num+1);
					}
				});
                $(".subImages img").mousemove(function(){
                    var imgHost = $(this)[0].src;
                    $(".subImageMain").attr("src",imgHost);
                })
			})
			function addCart() {
                $.ajax({
                    type:"POST",
                    url:"/cart/add.do",
                    data: $("#productInfo").serialize(),
                    success:function (result) {
                        if (result.status == 0){
                            alert("添加成功")
                        }else {
                            alert("请登录后添加");
                            window.location.href="/login";
                        }
                    },
                    error:function (result) {
                        console.log(result);
                    }
                });
            }
		</script>
	</body>
</html>

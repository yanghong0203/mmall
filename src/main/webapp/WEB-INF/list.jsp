<%@ page import="com.mmall.common.Const" %>
<%@ page import="com.mmall.pojo.User" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
						{%>	<li><a href="/register">注册</a></li>
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
						 <a class="active">所有商品</a>
					</li>
				</ul>
			</div>
			<table class="table table-bordered">
				<tr>
					<th width="60px" class="text-center">分类</th>
					<td>
						<c:choose>
							<c:when test="${fn:length(categoryList) <=1 }">
								<span style="border-style:dotted;border-width:2px;border-color:red; color: #f54f4f;">${categoryList[0].name}<span class="badge" style="background-color:rgba(0,0,0,0);padding-bottom: 6px;"><a style="text-decoration:none;out-line: none;color:#f54f4f;" href="/list"><span class="glyphicon glyphicon-remove"></span></a></span></span>
							</c:when>
							<c:otherwise>
								<c:forEach items="${categoryList}" var="catrgory">
									<a href="/list?categoryId=${catrgory.id}">${catrgory.name}</a> &nbsp;&nbsp;
								</c:forEach>
							</c:otherwise>
						</c:choose>

					</td>
				</tr>
			</table>
			<div class="">
				<b>排序：</b>
					<button class="btn btn-default" id="OrderByPrice"><span class="glyphicon glyphicon-yen"></span>价格</button>
					<button class="btn btn-default" id="OrderByCreateTime"><span class="glyphicon glyphicon-time"></span> 上架时间</button>
				<span class="pull-right">共${productPageInfo.size}个商品</span>
			</div>
			<div class="row commodity-list">
				<c:forEach items="${productPageInfo.list}" var="product">
					<div class="col-lg-2 col-md-3 col-sm-4 col-xs-6">
						<div class="thumbnail">
							<a href="/product_detail?productId=${product.id}" target="_blank">
								<img src="${product.imageHost}${product.subImage[0]}"/>
								<h5>${product.name}</h5>
								<p class="commodity-price">￥${product.price}</p>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
			<nav aria-label="Page navigation" class="pull-right">
				<ul class="pagination" id="jqPaginator">

				</ul>
			</nav>
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
		<script type="text/javascript" src="js/jqPaginator.js"></script>
		<script type="text/javascript">
            $(function () {
                $('#jqPaginator').jqPaginator({
                    totalPages: ${productPageInfo.pages},
                    visiblePages: 5,
                    currentPage: ${productPageInfo.pageNum},
                    first: '<li class="first"><a href="javascript:void(0);">首页</a></li>',
                    prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
                    next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
                    last: '<li class="last"><a href="javascript:void(0);">尾页</a></li>',
                    page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
                    onPageChange: function (num) {
                        if(num !=${productPageInfo.pageNum} ){
                            var categoryIdValue = getUrlParam("categoryId");
                            if (categoryIdValue!=null){
                                window.location.href="/list?pageNum="+num+"&categoryId="+categoryIdValue;
                            }else {
                                window.location.href="/list?pageNum="+num;
                            }
                        }
                    }
                });
            })
            function getUrlParam(name)
            {
                var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
                var r = window.location.search.substr(1).match(reg);  //匹配目标参数
                if (r!=null) return unescape(r[2]); return null; //返回参数值
            }
		</script>
	</body>
</html>

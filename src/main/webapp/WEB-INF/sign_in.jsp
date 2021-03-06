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
		<title>用户登录</title>
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
		        	<li><a href="search">搜索</a></li>
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
						 <a class="active">用户登录</a>
					</li>
				</ul>
				<div class="col-sm-offset-3 col-sm-6 col-md-offset-4 col-md-4">
					<div class="page-header">
						<h3 class="text-left">用户登录</h3>
					</div>
  					<form class="form-horizontal" role="form" id="user_login">
						<div class="form-group">
							<label for="userName" class="col-sm-4 col-md-3 control-label">用户名</label>
							<div class="col-sm-8 col-md-9">
								<input type="text" name="username" class="form-control" id="userName" placeholder="请输入用户名">
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-4 col-md-3 control-label">密码</label>
							<div class="col-sm-8 col-md-9">
								<input type="password" name="password" class="form-control" id="password" placeholder="请输入密码">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-8 col-md-offset-3 col-sm-9">
								<div class="checkbox">
									<label><input type="checkbox">请记住我</label>
								</div>
							</div>
						</div>
						<div class="form-group" align="center">
							<button type="button" class="btn btn-sm btn-success" id="dl">登录</button>
							<button type="reset" class="btn btn-sm btn-default">重置</button>
							<a href="/register" class="btn btn-sm btn-danger">还没有帐号，去注册</a>
						</div>
					</form>
				</div>
			</div>
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
		<script type="text/javascript" src="../../bootstrap/js/jquery-3.2.1.min.js" ></script>
		<script type="text/javascript" src="../../bootstrap/js/bootstrap.js" ></script>
		<script type="text/javascript" src="../../js/jquery.form.js"></script>

		<script type="text/javascript">
            $(function(){
                $("#dl").click(function(){
                    $.ajax({
                        type:"POST",
                        url:"/user/login.do",
                        data: $("#user_login").serialize(),
                        success:function (result) {
                            if (result.status == 0){
                                self.location=document.referrer;
                                window.location.href="/index";
                            }else {
                                alert(result.msg);
                            }
                        },
                        error:function (result) {
                            console.log(result);
                        }

                    });
                })
            })
		</script>
	</body>
</html>

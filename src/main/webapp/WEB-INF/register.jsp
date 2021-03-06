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
		<link rel="icon" href="http://img.youngh.cn/title.ico" type="image/x-icon"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css" />
		<link rel="stylesheet" href="css/style.css" />
		<title>用户注册</title>
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
						 <a class="active">注册</a>
					</li>
				</ul>
				<div class="col-sm-offset-3 col-sm-6 col-lg-offset-4 col-lg-4">
						<div class="page-header">
							<h3 class="text-left">用户注册</h3>
						</div>
					<form class="form-horizontal" role="form" id="register">
						<div class="form-group">
							<label class="col-sm-4 col-md-3 control-label">用户名</label>
							<div class="col-sm-8 col-md-9">
								<input type="text" name="username" class="form-control" placeholder="请输入用户名">
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-4 col-md-3 control-label">密码</label>
							<div class="col-sm-8 col-md-9">
								<input type="password" name="password" class="form-control" id="password" placeholder="请输入密码">
							</div>
						</div>
						<div class="form-group">
							<label for="confirm_password" class="col-sm-4 col-md-3 control-label">确认密码</label>
							<div class="col-sm-8 col-md-9">
								<input type="password" class="form-control" id="confirm_password" placeholder="请输入确认密码">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-3 control-label">E-mail</label>
							<div class="col-sm-8 col-md-9">
								<input type="email" name="email" class="form-control" placeholder="请输入邮箱">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-3 control-label">手机号</label>
							<div class="col-sm-8 col-md-9">
								<input type="text" name="phone" class="form-control" placeholder="手机号">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-3 control-label">密保问题</label>
							<div class="col-sm-8 col-md-9">
								<select class="form-control" name="question">
									<option value="我母亲的姓名">我母亲的姓名</option>
									<option value="我的小学班主任">我的小学班主任</option>
									<option value="配偶生日">配偶生日</option>
									<option value="大学第一次挂的科">大学第一次挂的科</option>
									<option value="中学名字">中学名字</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 col-md-3 control-label">答案</label>
							<div class="col-sm-8 col-md-9">
								<input type="text" name="answer" class="form-control" placeholder="答案">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-8 col-md-offset-3 col-sm-9">
								<div class="checkbox">
									<label><input type="checkbox">阅读并接受<a href="#" class="a-bule">《用户协议》</a></label>
								</div>
							</div>
						</div>
						<div class="form-group" align="center">
							<button type="button" class="btn btn-sm btn-success" id="zc">注册</button>
							<button type="reset" class="btn btn-sm btn-default">重置</button>
							<a href="/login" class="btn btn-sm btn-danger">已有有帐号，去登录</a>
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
		<script type="text/javascript" src="bootstrap/js/jquery-3.2.1.min.js" ></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.js" ></script>
		<script type="text/javascript">
            $(function(){
                $("#zc").click(function(){
                    $.ajax({
                        type:"POST",
                        url:"/user/register.do",
                        data: $("#register").serialize(),
                        success:function (result) {
                            if (result.status == 0){
                                alert(result.msg);
                                window.location.href='/login';
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

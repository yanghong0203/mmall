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
						 <a class="active">注册</a>
					</li>
				</ul>
				<div class="col-sm-offset-3 col-sm-6 col-lg-offset-4 col-lg-4">
						<div class="page-header">
							<h3 class="text-left">用户注册</h3>
						</div>
	  					<form class="form-horizontal" role="form">
							<div class="form-group">
								<label for="userName" class="col-sm-4 col-md-3 control-label">用户名</label>
								<div class="col-sm-8 col-md-9">
									<input type="text" name="userName" class="form-control" id="userName" placeholder="请输入用户名">
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
									<input type="password" name="confirm_password" class="form-control" id="confirm_password" placeholder="请输入确认密码">
								</div>
							</div>
							<div class="form-group">
								<label for="email" class="col-sm-4 col-md-3 control-label">E-mail</label>
								<div class="col-sm-8 col-md-9">
									<input type="email" name="email" class="form-control" id="email" placeholder="请输入邮箱">
								</div>
							</div>
							<div class="form-group">
								<label for="phone" class="col-sm-4 col-md-3 control-label">手机号</label>
								<div class="col-sm-8 col-md-9">
									<input type="text" name="phone" class="form-control" id="phone" placeholder="手机号">
								</div>
							</div>
							<!--<div class="form-group">
								<label for="region" class="col-sm-4 col-md-3 control-label">地区</label>
								<div class="col-sm-8 col-md-9">
									<select class="form-control" name="region" id="region">
										<option class="active">请选择省市</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
							</div>-->
							<div class="form-group">
								<label for="firstname" class="col-sm-4 col-md-3 control-label">性别</label>
								<div class="col-sm-8 col-md-9">
									<label class="radio radio-inline"><input type="radio" name="gender" id="" value="男">男</label>
									<label class="radio radio-inline"><input type="radio" name="gender" id="" value="女">女</label>
								</div>
							</div>
							<!--<div class="form-group">
								<label for="firstname" class="col-sm-4 col-md-3 control-label">爱好</label>
								<div class="col-sm-8 col-md-9">
									<label class="checkbox checkbox-inline"><input type="checkbox" name="music" id="music" value="音乐">音乐</label>
									<label class="checkbox checkbox-inline"><input type="checkbox" name="tourism" id="tourism" value="旅游">旅游</label>
									<label class="checkbox checkbox-inline"><input type="checkbox" name="tountaineering" id="tountaineering" value="登山">登山</label>
								</div>
							</div>-->
							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-8 col-md-offset-3 col-sm-9">
									<div class="checkbox">
										<label><input type="checkbox">阅读并接受<a href="#" class="a-bule">《用户协议》</a></label>
									</div>
								</div>
							</div>
							<div class="form-group" align="center">
								<button type="button" class="btn btn-sm btn-success">注册</button>
								<button type="reset" class="btn btn-sm btn-default">重置</button>
								<a href="sign_in.jsp" class="btn btn-sm btn-danger">已有有帐号，去登录</a>
							</div>
						</form>
					
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

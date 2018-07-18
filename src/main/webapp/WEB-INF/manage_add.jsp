<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" href="../../css/style.css" />
		<script type="text/javascript" src="../../bootstrap/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="../../bootstrap/js/bootstrap.min.js"></script>
	</head>

	<body>
		<div class="container-fluid manage-head">
			<div class="row">
				<div class="col-sm-6">
					<a href="/manage/view/index"><span>羚羊数码</span>后台管理系统</a>
				</div>
				<div class="col-sm-6">
					<a href="/manage/view/login_out"><button class="btn btn-danger  pull-right">退出</button></a>
				</div>
			</div>
		</div>
		<div class="container-fluid manage-body">
			<div class="row">
				<div class="manage-body-left">
					<ul class="list-group">
						<li class="list-group-item">
							<h3>商品</h3>
							<ul class="list-group manage-body-left-ul">
								<a href="/manage/view/index" class="list-group-item">商品管理</a>
								<a href="/manage/view/category" class="list-group-item">品类管理</a>
							</ul>
						</li>
						<li class="list-group-item">
							<h3>订单</h3>
							<ul class="list-group manage-body-left-ul">
								<a href="#" class="list-group-item">待付款</a>
								<a href="#" class="list-group-item">待发货</a>
								<a href="#" class="list-group-item">待收货</a>
								<a href="#" class="list-group-item">交易完成</a>
							</ul>
						</li>
					</ul>
				</div>
				<div class="manage-body-right">
					<div class="row">
						<div class="col-sm-6">
							<h3><span class="glyphicon glyphicon-home">&nbsp;</span>添加商品</h3>
						</div>
					</div>
					<ol class="breadcrumb">
						<li>
							<span>商品</span>
						</li>
						<li>
							<a href="/manage/view/index">商品管理</a>
						</li>
						<li class="active">添加商品</li>
					</ol>
					<div class="col-md-6 col-md-offset-3">
						<form class="form-horizontal" id="product" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label  class="col-sm-2 control-label">商品名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="name">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品描述</label>
								<div class="col-sm-8">
									<input type="password" class="form-control" name="subtitle">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">所属分类</label>
								<div class="col-sm-8">
									<select class="form-control" name="categoryId">
										<c:forEach items="${data}" var="category">
											<c:if test="${category.status == true}">
												<option value="${category.id}">${category.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品价格</label>
								<div class="col-sm-8">
									<div class="input-group">
										<input type="text" class="form-control" name="price">
										<span class="input-group-addon">元</span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品库存</label>
								<div class="col-sm-8">
									<div class="input-group">
										<input type="text" class="form-control" name="stock">
										<span class="input-group-addon">件</span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品主图</label>
								<div class="col-sm-8">
									<input type="file" name="imgs">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品附图</label>
								<div class="col-sm-8">
									<input type="file" name="imgs">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品附图</label>
								<div class="col-sm-8">
									<input type="file" name="imgs">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品附图</label>
								<div class="col-sm-8">
									<input type="file" name="imgs">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label"></label>
								<div class="col-sm-8">
									<button class="btn bg-primary" type="button" onclick="addproduct()">提交</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>

</html>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="icon" href="http://img.youngh.cn/title.ico" type="image/x-icon"/>
		<title>更新商品</title>
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" href="../../css/style.css" />
		<script type="text/javascript" src="../../bootstrap/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="../../js/jquery.form.js"></script>
		<script type="text/javascript" src="../../bootstrap/js/bootstrap.min.js"></script>
	</head>

	<body>
		<div class="container-fluid manage-head">
			<div class="row">
				<div class="col-sm-6">
					<a href="/manage/view/index"><span>羚羊数码</span>后台管理系统</a>
				</div>
				<div class="col-sm-6">
					<button class="btn btn-danger  pull-right">退出</button>
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
							<h3><span class="glyphicon glyphicon-home">&nbsp;</span>更新商品</h3>
						</div>
					</div>
					<ol class="breadcrumb">
						<li>
							<span>商品</span>
						</li>
						<li>
							<a href="/manage/view/index">商品管理</a>
						</li>
						<li class="active">
							更新商品
						</li>
					</ol>
					<div class="col-md-6 col-md-offset-3">
						<form class="form-horizontal" action="/manage/product/save.do" id="updateProduct" method="post" enctype="multipart/form-data">
							<input type="hidden" name="id" value="${productVo.id}">
							<div class="form-group">
								<label  class="col-sm-2 control-label">商品名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="name" value="${productVo.name}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品描述</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="subtitle" value="${productVo.subtitle}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">所属分类</label>
								<div class="col-sm-8">
									<select class="form-control" name="categoryId">
										<c:forEach items="${categoryList}" var="category">
											<c:choose>
												<c:when test="${category.status == true and category.id == productVo.categoryId}">
													<option value="${category.id}" selected="selected"> ${category.name} </option>
												</c:when>
												<c:otherwise>
													<c:if test="${category.status == true}">
														<option value="${category.id}"> ${category.name}</option>
													</c:if>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">主页分类</label>
								<div class="col-sm-4">
									<select class="form-control" name="indexStatus">
										<option value="0">普通商品</option>
										<option value="1">轮播商品</option>
										<option value="2">新品推荐</option>
										<option value="3">限时商品</option>
										<option value="4">热门商品</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品价格</label>
								<div class="col-sm-8">
									<div class="input-group">
										<input type="text" class="form-control" name="price" value="${productVo.price}">
										<span class="input-group-addon">元</span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品库存</label>
								<div class="col-sm-8">
									<div class="input-group">
										<input type="text" class="form-control" name="stock" value="${productVo.stock}">
										<span class="input-group-addon">件</span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品主页图片</label>
								<div class="col-sm-8">
									<input type="file" name="imgs">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品详情图片</label>
								<div class="col-sm-8">
									<input type="file" name="imgs">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品详情图片</label>
								<div class="col-sm-8">
									<input type="file" name="imgs">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品详情图片</label>
								<div class="col-sm-8">
									<input type="file" name="imgs">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品详情图片</label>
								<div class="col-sm-8">
									<input type="file" name="imgs">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label"></label>
								<div class="col-sm-8">
									<button class="btn bg-primary" type="button" onclick="return sub()">提交</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
            function sub(){
                // jquery 表单提交
                $("#updateProduct").ajaxSubmit(function(result) {
                    if (result.status == 0) {
                        alert(result.data);
                        window.location.href='/manage/view/index'
                    }else {
                        alert("更新失败");
					}
                });
                return false;
            }
		</script>
	</body>

</html>
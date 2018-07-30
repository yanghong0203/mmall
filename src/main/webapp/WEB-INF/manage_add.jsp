<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="icon" href="http://img.youngh.cn/title.ico" type="image/x-icon"/>
		<title>添加商品</title>
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" href="../../css/style.css" />
		<link rel="stylesheet" type="text/css" href="../../simditor-2.3.5/styles/simditor.css" />
		<script type="text/javascript" src="../../bootstrap/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="../../js/jquery.form.js"></script>
		<script type="text/javascript" src="../../bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="../../simditor-2.3.5/scripts/module.min.js"></script>
		<script type="text/javascript" src="../../simditor-2.3.5/scripts/hotkeys.min.js"></script>
		<script type="text/javascript" src="../../simditor-2.3.5/scripts/uploader.js"></script>
		<script type="text/javascript" src="../../simditor-2.3.5/scripts/simditor.js"></script>
	</head>

	<body>
		<div class="container-fluid manage-head">
			<div class="row">
				<div class="col-sm-6">
					<a href="/manage/index"><span>羚羊数码</span>后台管理系统</a>
				</div>
				<div class="col-sm-6">
					<a href="/manage/login_out"><button class="btn btn-danger  pull-right">退出</button></a>
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
								<a href="/manage/index" class="list-group-item">商品管理</a>
								<a href="/manage/category" class="list-group-item">品类管理</a>
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
					<div class="row manage-body-right-title">
						<div class="col-sm-6">
							<h3><span class="glyphicon glyphicon-home">&nbsp;</span>添加商品</h3>
						</div>
					</div>
					<ol class="breadcrumb">
						<li>
							<span>商品</span>
						</li>
						<li>
							<a href="/manage/index">商品管理</a>
						</li>
						<li class="active">添加商品</li>
					</ol>
					<div class="col-md-10 col-md-offset-1">
						<form class="form-horizontal" action="/manage/product/save.do" id="product" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label  class="col-sm-2 control-label">商品名称</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="name">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品描述</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="subtitle">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">所属分类</label>
								<div class="col-sm-4">
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
								<label class="col-sm-2 control-label">所属分类</label>
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
								<div class="col-sm-4">
									<div class="input-group">
										<input type="text" class="form-control" name="price">
										<span class="input-group-addon">元</span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品库存</label>
								<div class="col-sm-4">
									<div class="input-group">
										<input type="text" class="form-control" name="stock">
										<span class="input-group-addon">件</span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品主页图片</label>
								<div class="col-sm-4">
									<input type="file" name="mainImg">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品详情图片</label>
								<div class="col-sm-4">
									<input type="file" name="img1">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品详情图片</label>
								<div class="col-sm-4">
									<input type="file" name="img2">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品详情图片</label>
								<div class="col-sm-4">
									<input type="file" name="img3">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品详情图片</label>
								<div class="col-sm-4">
									<input type="file" name="img4">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">商品详情</label>
								<div class="col-sm-10">
									<textarea id="editor" autofocus name="detail"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label"></label>
								<div class="col-sm-10">
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
                $("#product").ajaxSubmit(function(result) {
                    if (result.status == 0) {
                        $("#product")[0].reset();
                    }
                    alert(result.data);
                });
                return false;
            }
            $(function() {
                toolbar = ['title', 'bold', 'italic', 'underline', 'strikethrough',
                    'color', '|', 'ol', 'ul', 'blockquote', 'code', 'table', '|',
                    'link', 'image', 'hr', '|', 'indent', 'outdent'
                ];
                var editor = new Simditor({
                    textarea: $('#editor'),
                    placeholder: '这里输入内容...',
                    toolbar: toolbar, //工具栏
                    upload: {
                        url: '/manage/product/richtext_img_upload.do', //文件上传的接口地址
                        fileKey: 'upload_file'
                    },success:(function(_this) {
                    return function(result) {
                        var newresult = JSON.parse("{'file_path':"+result.file_path+"}");
                        _this.trigger('uploadprogress', [file, file.size, file.size]);
                        _this.trigger('uploadsuccess', [file, newresult]);
                        return $(document).trigger('uploadsuccess', [file, newresult, _this]);
                    };
                })(this)
                });
            })
		</script>
	</body>

</html>
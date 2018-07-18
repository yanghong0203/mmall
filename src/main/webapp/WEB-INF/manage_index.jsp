<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
							<h3><span class="glyphicon glyphicon-home">&nbsp;</span>商品管理</h3>
						</div>
						<div class="col-sm-6">
							<h3><a href="/manage/view/add"><button class="btn btn-info pull-right">添加商品</button></a></h3>
						</div>
					</div>
					<ol class="breadcrumb">
						<li>
							<span>商品</span>
						</li>
						<li class="active">
							商品管理
						</li>
					</ol>
					<table class="table table-hover">
						<thead>
							<tr >
								<th class="col-md-1">商品ID</th>
								<th class="col-md-5">商品名</th>
								<th class="col-md-1">类别</th>
								<th class="col-md-1">价格</th>
								<th class="col-md-1">库存</th>
								<th class="col-md-1">状态</th>
								<th class="col-md-2">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${data.list}" var="product">
								<tr>
									<td>${product.id}</td>
									<td>${product.name}</td>
									<td>${product.categoryId}</td>
									<td>${product.price}</td>
									<td>${product.stock}</td>
									<td><c:if test="${product.status == 1}">
											上架
										</c:if>
										<c:if test="${product.status == 0}">
											下架
										</c:if>
									</td>
									<td>
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-primary" id="${product.id}" onclick="modify('${product.id}')">修改</button>
											<button type="button" class="btn btn-info" onclick="window.location.href='manage_update.jsp?productId=${product.id}'">修改详情</button>
											<button type="button" class="btn btn-danger" onclick="deleteProduct('${product.id}')">刪除</button>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			function modify(id) {
				var bt = $("#"+id);
				var thisTr = bt.parent().parent().parent();
				for(var i = 1; i<= thisTr.children().length-3;i++){
					var tdValue = thisTr.children("td").eq(i).html();
					thisTr.children("td").eq(i).html("<input type='text' class='form-control' value='"+tdValue+"'>");
				}
				thisTr.children("td").eq(thisTr.children().length-2).html(" <select class='form-control'><option>上架</option><option>下架</option></select>");
				bt.html("保存");
				bt.attr("onclick","save('"+id+"')");
			}
			function save(id){
				var bt = $("#"+id);
				var thisTr = bt.parents("tr");
				console.log(thisTr.children().length);
				for(var i = 1; i <= thisTr.children().length-3; i++) {
					var tdValue = thisTr.children("td").eq(i).find("input").val();
					thisTr.children("td").eq(i).html(tdValue);
				}
				var tdValue = thisTr.children("td").eq(thisTr.children().length-2).find("select option:selected").text();
				thisTr.children("td").eq(i).html(tdValue);
				bt.html("修改");
				bt.attr("onclick", "modify('"+id+"')");
			}
			function deleteProduct(id) {

            }
		</script>
	</body>

</html>
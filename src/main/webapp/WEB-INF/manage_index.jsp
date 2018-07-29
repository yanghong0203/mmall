<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="icon" href="http://img.youngh.cn/title.ico" type="image/x-icon"/>
		<title>商品管理</title>
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
					<div class="row manage-body-right-title">
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
								<th class="col-md-4">商品名</th>
								<th class="col-md-1">类别</th>
								<th class="col-md-1">价格</th>
								<th class="col-md-1">库存</th>
								<th class="col-md-1">主页状态</th>
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
									<td><c:if test="${product.indexStatus == 0}">
											普通商品
										</c:if>
										<c:if test="${product.indexStatus == 1}">
											轮播商品
										</c:if>
										<c:if test="${product.indexStatus == 2}">
											新品推荐
										</c:if>
										<c:if test="${product.indexStatus == 3}">
											限时促销
										</c:if>
										<c:if test="${product.indexStatus == 4}">
											热门商品
										</c:if>
									</td>
									<td><c:if test="${product.status == 1}">
											上架
										</c:if>
										<c:if test="${product.status == 2}">
											下架
										</c:if>
									</td>
									<td>
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-primary" id="btn${product.id}" onclick="modify('${product.id}')">修改</button>
											<button type="button" class="btn btn-info"><a href="/manage/view/update?productId=${product.id}">修改详情</a></button>
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
			/*function product() {
				var name;
				var categoryId;
				var price;
				var stock;
				var status;
            }*/
            var old = new Array(6);
			function modify(id) {
				var bt = $("#btn"+id);
				var thisTr = bt.parent().parent().parent();
				var product = new Array("name","categoryId","price","stock");
				for(var i = 1; i<= thisTr.children().length-4;i++){
					var tdValue = thisTr.children("td").eq(i).html();
					old[i-1] = tdValue;
					thisTr.children("td").eq(i).html("<input type='text' name='"+product[i-1]+"' id='"+product[i-1]+id+"' class='form-control' value='"+tdValue+"'>");
				}
				old[4] = thisTr.children("td").eq(i).html();
				thisTr.children("td").eq(i).html(" <select class='form-control' id='indexStatus\"+id+\"' name='indexStatus'><option value='0'>普通商品</option><option value='1'>轮播商品</option><option value='2'>新品推荐</option><option value='3'>限时促销</option><option value='4'>热门商品</option></select>");
                old[5] = thisTr.children("td").eq(++i).html();
                thisTr.children("td").eq(i).html(" <select class='form-control' id='status"+id+"' name='status'><option value='1'>上架</option><option value='2'>下架</option></select>");
				bt.html("保存");
				bt.attr("onclick","save('"+id+"')");
			}
			function save(id){
			    var data = "id="+id+"&name="+$("#name"+id).val()+"&categoryId="+$("#categoryId"+id).val()+"&price="+$("#price"+id).val()+"&stock="+$("#stock"+id).val()+"&indexStatus="+$("#indexStatus"+id+" option:selected").val()+"&status="+$("#status"+id+" option:selected").val();
                $.ajax({
                    type:"post",
                    url:"/manage/product/update.do",
                    data: data,
                    success:function (result) {
                        if (result.status == 0){
                            alert(result.data);
                            change(id);
                        }else {
                            alert(result.data);
                            noChange(id);
                        }
                    },
                    error:function (result) {
                        console.log(result);
                    }

                });
                return false;
			}
			function deleteProduct(id) {
			    var data = "productId="+id+"&status=3"
                $.ajax({
                    type:"post",
                    url:"/manage/product/set_sale_status.do",
                    data:data ,
                    success:function (result) {
                        if (result.status == 0){
                            alert("删除产品成功");
                            var bt = $("#btn"+id);
                            var thisTr = bt.parent().parent().parent();
                            thisTr.remove();
                        }else {
                            alert("删除产品失败");
                        }
                    },
                    error:function (result) {
                        console.log(result);
                    }

                });
                return false;
            }
			function change(id) {
                var bt = $("#btn"+id);
                var thisTr = bt.parents("tr");
                for(var i = 1; i <= thisTr.children().length-4; i++) {
                    var tdValue = thisTr.children("td").eq(i).find("input").val();
                    thisTr.children("td").eq(i).html(tdValue);
                }
                var tdValue = thisTr.children("td").eq(i).find("select option:selected").text();
                thisTr.children("td").eq(i).html(tdValue);
                var tdValue = thisTr.children("td").eq(++i).find("select option:selected").text();
                thisTr.children("td").eq(i).html(tdValue);
                bt.html("修改");
                bt.attr("onclick", "modify('"+id+"')");
            }
            function noChange(id) {
                var bt = $("#btn"+id);
                var thisTr = bt.parents("tr");
                console.log(thisTr.children().length);
                for(var i = 0; i < old.length; i++) {
                    thisTr.children("td").eq(i+1).html(old[i]);
                }
                bt.html("修改");
                bt.attr("onclick", "modify('"+id+"')");
            }

		</script>
	</body>

</html>
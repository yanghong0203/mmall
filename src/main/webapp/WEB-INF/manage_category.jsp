<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="icon" href="http://img.youngh.cn/title.ico" type="image/x-icon"/>
		<title>品类管理</title>
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" href="../../css/style.css" />
		<script type="text/javascript" src="../../bootstrap/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="../../bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="container-fluid manage-head">
			<div class="row">
				<div class="col-sm-6">
					<a href="/manage/index"><span>羚羊数码</span>后台管理系统</a>
				</div>
				<div class="col-sm-6">
					<a href="/manage/login_out"> <button class="btn btn-danger  pull-right">退出</button></a>
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
							<h3><span class="glyphicon glyphicon-home">&nbsp;</span>品类管理</h3>
						</div>
						<div class="col-sm-6">
							<h3><button class="btn btn-info pull-right" data-toggle="modal" data-target="#addCategory">添加品类</button></h3>
						</div>
						<div class="modal fade" id="addCategory" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						    <div class="modal-dialog">
						        <div class="modal-content">
						            <div class="modal-header">
						                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						                <h4 class="modal-title" id="myModalLabel">添加品类</h4>
						            </div>
						            <form method="post" id="categoryName" class="form-horizontal">
							            <div class="modal-body">
							            	<div class="form-group">
												<label class="col-sm-2 control-label">品类名</label>
												<div class="col-sm-6">
													<input type="text" class="form-control" name="categoryName">
												</div>
											</div>
							            </div>
							            <div class="modal-footer">
							                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="addcategory()">提交</button>
							            </div>
							        </form>
						        </div>
						    </div>
						</div>
					</div>
					<ol class="breadcrumb">
						<li>
							<span>商品</span>
						</li>
						<li class="active">
							品类管理
						</li>
					</ol>
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="col-md-2">ID</th>
								<th class="col-md-2">品类名</th>
								<th class="col-md-2">状态</th>
								<th class="col-md-2">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${data}" var="category">
								<tr>
									<td>${category.id}</td>
									<td>${category.name}</td>
									<td><c:if test="${category.status == true}">
											可用
										</c:if>
										<c:if test="${category.status == false}">
											不可用
										</c:if>
									</td>
									<td>
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-primary" id="btn${category.id}" onclick="modify('${category.id}')">修改</button>
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
            var oldname;
            var oldstatus;
			function modify(id) {
				var bt = $("#btn"+id);
				var thisTr = bt.parent().parent().parent();
				var tdValue = thisTr.children("td").eq(1).html();
				oldname = tdValue;
				oldstatus = thisTr.children("td").eq(2).html();
				thisTr.children("td").eq(1).html("<input type='text' id='name"+id+"' class='form-control' value='"+tdValue+"'>");
				thisTr.children("td").eq(2).html("<select class='form-control' id='status"+id+"'><option value='1'>可用</option><option value='0'>不可用</option></select>");
				bt.html("保存");
				bt.attr("onclick","save('"+id+"')");
			}
			function save(id){
                var data = "id="+id+"&name="+$("#name"+id).val()+"&status="+$("#status"+id+" option:selected").val();
                $.ajax({
                    type:"post",
                    url:"/manage/category/update.do",
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
            function change(id) {
                var bt = $("#btn"+id);
                var thisTr = bt.parents("tr");
				var tdValue = thisTr.children("td").eq(1).find("input").val();
				thisTr.children("td").eq(1).html(tdValue);
                var tdValue = thisTr.children("td").eq(2).find("select option:selected").text();
                thisTr.children("td").eq(2).html(tdValue);
                bt.html("修改");
                bt.attr("onclick", "modify('"+id+"')");
            }
            function noChange(id) {
                var bt = $("#btn"+id);
                var thisTr = bt.parents("tr");
				thisTr.children("td").eq(1).html(oldname);
                thisTr.children("td").eq(2).html(oldstatus);
                bt.html("修改");
                bt.attr("onclick", "modify('"+id+"')");
            }
			function  addcategory() {
                $.ajax({
                    type:"post",
                    url:"/manage/category/add_category.do",
                    data: $("#categoryName").serialize(),
                    success:function (result) {
                        console.log(result);
                        if (result.status == 0){
                            alert(result.data);
                            location.reload();
                        }else {
                            alert(result.data);
                        }
                    },
                    error:function () {
                        alert("添加品类失败");
                    }
                });
            }
		</script>
	</body>

</html>
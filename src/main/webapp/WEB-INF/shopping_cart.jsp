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
		<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css" />
		<link rel="stylesheet" href="css/style.css" />
		<link rel="icon" href="http://img.youngh.cn/title.ico" type="image/x-icon"/>
		<title>购物车</title>
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
		        <a class="navbar-brand" href="#"><img src="http://img.youngh.cn/logo.png" class="logo"></a>
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
						 <a class="active">购物车</a>
					</li>
				</ul>
			</div>
			<div>
				<table class="table cart-table">
					<tr>
						<td width="10%"><input type="checkbox" class="select-cart-prduct selectAll" onclick="selectAll()" id="bigSelectAll"><label for="bigSelectAll">&nbsp;全选</label> </td>
						<td width="32%">商品名称</td>
						<td width="12%" align="center">单价</td>
						<td width="12%" align="center">数量</td>
						<td width="12%" align="center">小计</td>
						<td width="12%" align="center">操作</td>
					</tr>
					<c:forEach items="${cartData.cartProductVoList}" var="cartProduct">
						<c:if test="${cartProduct.productStatus == 1}">
							<tr class="tr${cartProduct.productId}">
								<c:if test="${cartProduct.productChecked == 1}">
									<td><input type="checkbox" class="select-cart-prduct checkbox${cartProduct.productId}" onclick="productCheck(${cartProduct.productId})" checked/></td>
								</c:if>
								<c:if test="${cartProduct.productChecked == 0}">
									<td><input type="checkbox" class="select-cart-prduct checkbox${cartProduct.productId}" onclick="productCheck(${cartProduct.productId})"/></td>
								</c:if>
								<td><a href="/product_detail?productId=${cartProduct.productId}"><img width="70px" src="${cartProduct.imageHost}${cartProduct.subImage[0]}"/></a><span>${cartProduct.productName}</span></td>
								<td align="center"><span>${cartProduct.productPrice}</span></td>
								<td>
									<div class="input-group">
										<span class="input-group-btn">
											<button class="btn btn-default" type="button" onclick="reduceProductNum('${cartProduct.productId}',${cartProduct.productPrice})">-</button>
										</span>
										<input type="text" class="form-control text-center pNumber${cartProduct.productId}" readonly="readonly" value="${cartProduct.quantity}">
										<span class="input-group-btn">
										   <button class="btn btn-default" type="button" onclick="addProductNum('${cartProduct.productId}',${cartProduct.productStock},${cartProduct.productPrice})">+</button>
										</span>
									</div>
								</td>
								<td align="center"><span class="product-price${cartProduct.productId}">${cartProduct.productTotalPrice}</span></td>
								<td align="center"><a href="javascript:cartDelete('${cartProduct.productId}');" class="cart-delete">删除</a></td>
							</tr>
						</c:if>
						<c:if test="${cartProduct.productStatus == 2}">
							<tr class="tr${cartProduct.productId} cart-product-xj">
								<td><input type="checkbox" class="select-cart-prduct" disabled="disabled"/></td>
								<td><img width="70px" src="${cartProduct.imageHost}${cartProduct.subImage[0]}"/><span>${cartProduct.productName}</span></td>
								<td align="center"><span>${cartProduct.productPrice}</span></td>
								<td>
									<div class="input-group">
							    <span class="input-group-btn">
								    <button class="btn btn-default" type="button" disabled="disabled">-</button>
								</span>
										<input type="text" class="form-control text-center" readonly="readonly" value="1">
										<span class="input-group-btn">
							       <button class="btn btn-default" type="button" disabled="disabled">+</button>
							    </span>
									</div>
								</td>
								<td align="center">${cartProduct.productTotalPrice}</td>
								<td align="center"><a href="javascript:cartDelete('${cartProduct.productId}');" class="cart-delete">删除</a></td>
							</tr>
						</c:if>
					</c:forEach>
					<tr>
						<td><input type="checkbox" id="bigUnSelectAll" ><label for="bigUnSelectAll">&nbsp;反选</label></td>
						<td colspan="2"><a href="javascript:cartDeleteAll();"><span>清除下架商品</span></a></td>
						<td colspan="2"><p>已选商品<span>0</span>件合计（不含运费）：</p><span class="commodity-price lead cartTotalPrice">￥${cartData.cartTotalPrice}</span><span>已优惠：￥0</span></td>
						<td align="center"><button type="submit" class="btn btn-sm btn-danger">确认结算</button></td>
					</tr>
				</table>
				<%--<table class="table cart-table cart-table-sm hidden-md hidden-lg">
					<tr>
						<td colspan="4"><label for="smSelectAll"><input type="checkbox" onclick="selectAll()" class="select-cart-prduct selectAll" id="smSelectAll">&nbsp;全选</label></td>
					</tr>
					<c:forEach items="${cartData.cartProductVoList}" var="cartProduct">
						<c:if test="${cartProduct.productStatus == 1}">
							<tr class="tr${cartProduct.productId}">
								<c:if test="${cartProduct.productChecked == 1}">
									<td width="10%"><input type="checkbox" class="select-cart-prduct checkbox${cartProduct.productId}" onclick="productCheck(${cartProduct.productId})" checked/></td>
								</c:if>
								<c:if test="${cartProduct.productChecked == 0}">
									<td width="10%"><input type="checkbox" class="select-cart-prduct checkbox${cartProduct.productId}" onclick="productCheck(${cartProduct.productId})"/></td>
								</c:if>
								<td width="30%"><a href="/product_detail?productId=${cartProduct.productId}"><img width="70px" src="${cartProduct.imageHost}${cartProduct.subImage[0]}"/></a></td>
								<td >
									<h5>${cartProduct.productName}</h5>
									<div class="input-group input-group-sm col-xs-12 col-sm-5">
										 <span class="input-group-btn">
											<button class="btn btn-default" type="button" onclick="reduceProductNum('${cartProduct.productId}',${cartProduct.productPrice})">-</button>
										</span>
										<input type="text" class="form-control text-center pNumber${cartProduct.productId}" readonly="readonly" value="${cartProduct.quantity}">
										<span class="input-group-btn">
										   <button class="btn btn-default" type="button" onclick="addProductNum('${cartProduct.productId}',${cartProduct.productStock},${cartProduct.productPrice})">+</button>
										</span>
									</div>
									<p class="commodity-price${cartProduct.productId}">${cartProduct.productTotalPrice}</p>
								</td>
								<td align="center"><a href="javascript:cartDelete('${cartProduct.productId}');" class="cart-delete">删除</a></td>
							</tr>
						</c:if>
						<c:if test="${cartProduct.productStatus == 2}">
							<tr class="tr${cartProduct.productId} cart-product-xj">
								<td width="10%"><input type="checkbox" disabled="disabled"/></td>
								<td width="30%"><img width="70px" src="${cartProduct.imageHost}${cartProduct.subImage[0]}"/></td>
								<td >
									<h5>${cartProduct.productName}</h5>
									<div class="input-group input-group-sm col-xs-12 col-sm-5">
										 <span class="input-group-btn">
											<button class="btn btn-default" type="button" disabled="disabled">-</button>
										</span>
										<input type="text" class="form-control text-center" readonly="readonly" value="${cartProduct.quantity}">
										<span class="input-group-btn">
										   <button class="btn btn-default" type="button" disabled="disabled">+</button>
										</span>
									</div>
									<p>${cartProduct.productTotalPrice}</p>
								</td>
								<td align="center"><a href="javascript:cartDelete('${cartProduct.productId}');" class="cart-delete">删除</a></td>
							</tr>
						</c:if>
					</c:forEach>
					<tr>
						<td></td>
						<td><a href="javascript:cartDeleteAll();">清除下架商品</a></td>
						<td align="right"><p>已选商品1件合计（包邮）：</p><span class="commodity-price lead cartTotalPrice">￥${cartData.cartTotalPrice} </span><span>已优惠：$0</span></td>
						<td align="right"><button type="submit" class="btn btn-xs btn-danger">确认结算</button></td>
					</tr>
				</table>--%>
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
			function reduceProductNum(id,price){
                var num = parseInt($(".pNumber"+id).val());
                if(num > 1){
                    num = num-1;
                    $.ajax({
                        type: "POST",
                        url: "/cart/update.do",
						data:"productId="+id+"&count="+num,
                        success: function (result) {
                            if (result.status == 0) {
                                $(".pNumber"+id).val(num);
                                $(".cartTotalPrice").html("￥"+result.data.cartTotalPrice.toFixed(2));
                                $(".product-price"+id).html((price*num).toFixed(2));
                            }
                            if(result.status == 10){
                                alert("用户信息已过期，请重新登录");
                                window.location.href="/login"
                            }
                        },
                        error: function (result) {
                            console.log(result);
                        }
                    });
                }
			}
			function addProductNum(id,stock,price){
                var num = parseInt($(".pNumber"+id).val());
                if(num < stock){
                    num = num+1;
                    $.ajax({
                        type: "POST",
                        url: "/cart/update.do",
                        data:"productId="+id+"&count="+num,
                        success: function (result) {
                            if (result.status == 0) {
                                $(".pNumber"+id).val(num);
                                $(".cartTotalPrice").html("￥"+result.data.cartTotalPrice.toFixed(2));
                                $(".product-price"+id).html((price*num).toFixed(2));
                            }
                            if(result.status == 10){
                                alert("用户信息已过期，请重新登录");
                                window.location.href="/login"
                            }
                        },
                        error: function (result) {
                            console.log(result);
                        }
                    });
                }
			}
			isAllcheck = false;
            function selectAll() {
                isAllcheck = !isAllcheck;
                if (isAllcheck) {
                    $.ajax({
                        type: "POST",
                        url: "/cart/select_all.do",
                        success: function (result) {
                            if (result.status == 0) {
                                $(".cartTotalPrice").html("￥"+result.data.cartTotalPrice.toFixed(2));
                                $('.select-cart-prduct').prop("checked", true);
                            }
                            if(result.status == 10){
                                alert("用户信息已过期，请重新登录");
                                window.location.href="/login"
                            }
                        },
                        error: function (result) {
                            console.log(result);
                        }
                    });
                }else {
                    $.ajax({
                        type: "POST",
                        url: "/cart/un_select_all.do",
                        success: function (result) {
                            if (result.status == 0) {
                                $(".cartTotalPrice").html("￥"+result.data.cartTotalPrice.toFixed(2));
                                $('.select-cart-prduct').prop("checked", false);
                            }
                            if(result.status == 10){
                                alert("用户信息已过期，请重新登录");
                                window.location.href="/login"
                            }
                        },
                        error: function (result) {
                            console.log(result);
                        }
                    });
				}
            }
			// 反选
			/*$("#reverseSelect").click(function(){
				$("#checkBoxList :checkbox").each(function(){
					$(this).attr("checked", !$(this).attr("checked"));
				});
			});*/
            function cartDelete(id){
                $.ajax({
                    type:"POST",
                    url:"/cart/delete_product.do",
                    data:"productIds="+id,
                    success:function (result) {
                        if (result.status == 0){
                            $(".cartTotalPrice").html("￥"+result.data.cartTotalPrice.toFixed(2));
                            $(".tr"+id).remove();
                        }
                        if(result.status == 10){
                            alert("用户信息已过期，请重新登录");
                            window.location.href="/login"
						}
                    },
                    error:function (result) {
                        console.log(result);
                    }
                });
				return false;
            }
            function cartDeleteAll() {
				$(".cart-product-xj").remove();
            }
            function productCheck(id){
                if($(".checkbox"+id).prop('checked')){
                    $.ajax({
                        type:"POST",
                        url:"/cart/select.do",
                        data:"productId="+id,
                        success:function (result) {
                            if (result.status == 0){
                                $(".cartTotalPrice").html("￥"+result.data.cartTotalPrice.toFixed(2));
                                if (result.data.allChecked == true) {
                                    $(".selectAll").prop('checked',true);
								}else {
                                    $(".selectAll").prop('checked',false);
								}
                            }
                            if(result.status == 10){
                                alert("用户信息已过期，请重新登录");
                                window.location.href="/login"
                            }
                        },
                        error:function (result) {
                            console.log(result);
                        }
                    });
                }else{
                    $.ajax({
                        type:"POST",
                        url:"/cart/un_select.do",
                        data:"productId="+id,
                        success:function (result) {
                            if (result.status == 0){
                                $(".cartTotalPrice").html("￥"+result.data.cartTotalPrice.toFixed(2));
                                if (result.data.allChecked == true) {
                                    $(".selectAll").prop('checked',true);
                                }else {
                                    $(".selectAll").prop('checked',false);
                                }
                            }
                            if(result.status == 10){
                                alert("用户信息已过期，请重新登录");
                                window.location.href="/login"
                            }
                        },
                        error:function (result) {
                            console.log(result);
                        }
                    });
                }
            }
		</script>
	</body>
</html>

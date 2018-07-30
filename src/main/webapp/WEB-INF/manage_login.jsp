<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<link rel="icon" href="http://img.youngh.cn/title.ico" type="image/x-icon"/>
		<title>后台管理</title>
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" href="../../css/style.css" />
		<script type="text/javascript" src="../../bootstrap/js/jquery-3.2.1.min.js"></script>
	</head>

	<body id="manageLogin-bki">
	<div class="container" align="center">
		<div class="manageLogin-mian">
			<h1>登录</h1>
			<form id="login">
				<div class="input-group manageLogin-mian-input">
					<span class="input-group-addon"> <span class="glyphicon glyphicon-user"></span></span>
					<input type="text" class="form-control" name="username" placeholder="用户名">
				</div>
				<div class="input-group manageLogin-mian-input">
					<span class="input-group-addon"> <span class="glyphicon glyphicon-lock"></span></span>
					<input type="password" class="form-control" name="password" placeholder="密码">
				</div>
			</form>
			<button class="btn bg-primary" id="dl">登录</button>
		</div>
	</div>
	</body>
	<script type="text/javascript">
        $(function(){
            $("#dl").click(function(){
                $.ajax({
                    type:"post",
                    url:"/manage/user/login.do",
                    data: $("#login").serialize(),
					success:function (result) {
						if (result.status == 0){
                            window.location.href='/manage/index';
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

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>用户注册</title>
	<link rel="stylesheet" href="css/base.css" />
	<link rel="stylesheet" href="css/global.css" />
	<link rel="stylesheet" href="css/login-register.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">
	function cheImg(obj){
		var d = new Date()
		$(obj).attr("src","${pageContext.request.contextPath }/checkImgServlet?date="+d.getMilliseconds());

	}

</script>
</head>
<body>
	<div class="header wrap1000">
		<a href=""><img src="images/logo.png" alt="" /></a>
		<div style="display:inline-block;float:right;margin-right:80px;margin-top:30px;" style="margin-left:850px"> <a style="font-size:18px;color:#f40;text-decoration:none;" href="${pageContext.request.contextPath}/">游客访问 </a></div>
	</div>

	<div class="main">
		<div class="login-form fr" onclick="if(document.getElementById('userName').value=='123456'){document.getElementById('myinf').innerHTML='用户名已存在！';}else{document.getElementById('myinf').innerHTML='';}">
			<div class="form-hd">
				<h3>用户注册</h3>
			</div>
			<div class="form-bd">
				<form class="myfor" action="${pageContext.request.contextPath }/productServlet?method=register" method="post">
					<dl>
						<dt>用户名</dt>
						<dd><input id = "userName" type="text" name="username" class="text" required="required" /></dd>
					</dl>
					<dl>
						<dt>密码</dt>
						<dd><input id = "pwd"  type="password" name="password" class="text" required="required" /></dd>
					</dl>
					<dl>
						<dt>确认密码</dt>
						<dd><input id = "pwd2"  type="password" name="repassword" class="text" required="required" /></dd>
					</dl>
					<dl>
						<dt>邮箱</dt>
						<dd><input  id = "email" type="email" name="email" class="text" required="required" /></dd>
					</dl>

					<div><span id="myinf" style="color:red">${info }</span></div>
					<dl>
						<dt>&nbsp;</dt>
						<dd><input type="submit" value="立即注册" class="submit"/> 
<!-- 						<input type= "checkbox" checked="checked"/>阅读并同意<a href="/ShopCMJ/fuwuxieyi.html" class="forget">服务协议</a></dd> -->
					</dl>
				</form>

			</div>
			<div class="form-ft">

			</div>
		</div>

		<div class="login-form-left fl">
			<div class="login-form-left fl">
			<img src="images/left.jpg" alt="" />
		</div>

			<div class="if" style="position:relative;left:450px;top:0px">
				<h2>如果您是本站用户</h2>
				<p>我已经注册过账号，立即 <a href="/ShopCMJ/login.jsp" class="register">登录</a></p>
			</div>
		</div>
	</div>

<!-- 	<div class="footer clear wrap1000"> -->
<%-- 		<p> <a href="${pageContext.request.contextPath}/">首页</a> | <a href="">招聘英才</a> | <a href="">广告合作</a> | <a href="">关于ShopCZ</a> | <a href="">联系我们</a></p> --%>
<!-- 		<p>Copyright 2004-2013 itcast Inc.,All rights reserved.</p> -->
<!-- 	</div> -->


</body>
</html>

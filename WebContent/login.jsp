<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>用户登录</title>
	<link rel="stylesheet" href="css/base.css" />
	<link rel="stylesheet" href="css/global.css" />
	<link rel="stylesheet" href="css/login-register.css" />

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
  <style>
    .face_login{
      position: fixed;
      left: 383px;
    top: 90px;
      display: none;
      z-index: 1003;
      width: 820px;
      height: 400px;

    }
  </style>
</head>

<script type="text/javascript">
	function cheImg(obj){
		var d = new Date()
		$(obj).attr("src","${pageContext.request.contextPath }/checkImgServlet?date="+d.getMilliseconds());

	}
</script>
<body>

	<div class="header wrap1000">
		<a href=""><img src="images/logo.png" alt="" /></a>
		<div style="display:inline-block;float:right;margin-right:80px;margin-top:30px;" style="margin-left:850px"> <a style="font-size:18px;text-decoration:none;color:#f40" href="${pageContext.request.contextPath}/">游客访问 </a></div>
	</div>

	<div class="main">
		<div class="login-form fr">
			<div class="form-hd">
				<h3>用户登录</h3>
			</div>
			<div class="form-bd">
				<form action="${pageContext.request.contextPath }/productServlet?method=login" method="post">
					<dl>
						<dt>用户名</dt>
						<dd><input type="text" name="username" class="text" required="required" /></dd>
					</dl>
					<dl>
						<dt>密&nbsp;&nbsp;&nbsp;&nbsp;码</dt>
						<dd><input type="password" name="password" class="text"required="required" /></dd>
					</dl>
					<dl>
						<dt>验证码</dt>
						<dd style="float:left;"><input type="text" name="code" class="text" size="10" required="required" style="width:58px;">
						</dd><img style="float:left;margin-left:10px;" onclick="cheImg(this)" src="${pageContext.request.contextPath }/checkImgServlet" />
					</dl>
					<dl>
						<dt>&nbsp;</dt>
						<dd><input type="submit" value="登  录" class="submit"/>
						<img src="/ShopCMJ/image/face_logo.png" height="18" width="18"/>
<!-- 						<a style="cursor:pointer;"onclick="document.getElementById('face_login').style.display='block'" class="forget">人脸登陆</a>&nbsp;&nbsp;&nbsp; -->
						<a style="cursor:pointer;"onclick="window.location.href='/ShopCMJ/facenet_login.jsp'" class="forget">人脸登陆</a>&nbsp;&nbsp;&nbsp;
						 <a href="/ShopCMJ/register.jsp" class="forget">没有账号?注册</a>
						</dd>
					</dl>

					<div>
					  <span id="info" style="color:red">${info }</span>
					</div>
				</form>
				<dl>
					<dt>&nbsp;</dt>
				</dl>

			</div>
			<div class="form-ft">

			</div>
		</div>

		<div class="login-form-left fl">
			<img src="images/left.jpg" alt="" />
		</div>
	</div>
 <script type="text/javascript">
 $(function(){
   $("#close_facePage").click(function(){
     $(".face_login").css("display","none");
   })

 })

 </script>
  <div class="face_login" id="face_login" >
      <span id="close_facePage"style="color:red;font-size:27px;position:absolute;right:5px;top:5px;cursor:pointer;">X</span>
    <iframe src="/ShopCMJ/NewFile.jsp" width="820px" height="400px" style="border:1px #D8D8D8 solid;"></iframe>
  </div>
</body>
</html>

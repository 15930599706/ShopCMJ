<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>用户登录</title>
	<link rel="stylesheet" href="css/base.css" />
	<link rel="stylesheet" href="css/global.css" />
	<link rel="stylesheet" href="css/login-register.css" />

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
  <link rel="stylesheet" href="css/login-register.css" />
  <script src="http://libs.baidu.com/jquery/1.6.4/jquery.min.js"></script>
<script type="text/javascript" src="/ShopCMJ/js/jQuery-webcam-master/jquery.webcam.js"></script>
<script type="text/javascript">
    $(function () {
        var w = 320, h = 240;
        var pos = 0, ctx = null, saveCB, image = [];

        var canvas = document.createElement("canvas");
        canvas.setAttribute('width', w);
        canvas.setAttribute('height', h);

        console.log(canvas.toDataURL);
        if (canvas.toDataURL) {

            ctx = canvas.getContext("2d");

            image = ctx.getImageData(0, 0, w, h);

            saveCB = function(data) {

                var col = data.split(";");
                var img = image;

                for(var i = 0; i < w; i++) {
                    var tmp = parseInt(col[i]);
                    img.data[pos + 0] = (tmp >> 16) & 0xff;
                    img.data[pos + 1] = (tmp >> 8) & 0xff;
                    img.data[pos + 2] = tmp & 0xff;
                    img.data[pos + 3] = 0xff;
                    pos+= 4;
                }

                if (pos >= 4 * w * h) {
                    ctx.putImageData(img, 0, 0);
                    /* $.post("servlet/CatD", {type: "data", image: canvas.toDataURL("image/png")}, function(msg){
                        console.log("===="+eval(msg));
                        pos = 0;
                        $("#img").attr("src", msg+"");
                    }); */
                    $.ajax({
                   type: "post",
                   url: "CatD",
                   data: {type: "pixel", image: canvas.toDataURL("image/png")},
                   dataType: "text",
                   success: function(data){
                        var h="mid.jsp?username="+data
                     //   alert(h)
                     if(data!=""){
                        window.location.href=h
                     }else{
                       alert("人脸验证失败")
                       var t = setTimeout(function(){window.location.reload();},1000);
                     }
                     }
               });
                }
            };

        } else {

            saveCB = function(data) {
                image.push(data);

                pos+= 4 * w;

                if (pos >= 4 * w * h) {
                    /* $.post("servlet/CatD", {type: "pixel", image: image.join('|')}, function(msg){
                        console.log("+++++"+eval(msg));
                        pos = 0;
                        $("#img").attr("src", msg+"");
                    }); */

                     $.ajax({
                   type: "post",
                   url: "/ShopCMJ/CatD.do",
                   data: {type: "pixel", image: image.join('|')},
                   dataType: "json",
                   success: function(data){
                               console.log("+++++"+eval(msg));
                              pos = 0;
                              $("#img").attr("src", msg+"");
                          }
               });
                }
            };
        }

        $("#webcam").webcam({
            width: w,
            height: h,
            mode: "callback",
            swffile: "js/jscam_canvas_only.swf",

            onSave: saveCB,

            onCapture: function () {
                webcam.save();
            },

            debug: function (type, string) {
                console.log(type + ": " + string);
            }
        });
    });

    //拍照
    function savePhoto(){
        webcam.capture();
    }
</script>
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
    body {background-color: white}
    #webcam {margin-left: 30px;margin-top: 20px;border: 1px solid #666666; width: 320px; height: 240px; float:left;}
    #photos { margin-top: 20px;border: 1px solid #666666; width: 320px; height: 240px; float:left;margin-left:50px;}
    .btn { width: 320px; height: auto; margin: 5px 0px; }
    .btn input[type=button] { width: 150px; height: 50px; line-height: 50px; margin: 3px;margin-left:270px;margin-top:50px; }

  </style>
</head>

<script type="text/javascript">
	function cheImg(obj){
		var d = new Date()
		$(obj).attr("src","${pageContext.request.contextPath }/checkImgServlet?date="+d.getMilliseconds());

	}
	$(function(){
		$("#rtBtn").click(function(){
			window.location.href="/ShopCMJ/login.jsp";
		})
	})
	
</script>
<body>

	<div class="header wrap1000">
		<a href=""><img src="images/logo.png" alt="" /></a>
		<div style="display:inline-block;float:right;margin-right:80px;margin-top:30px;" style="margin-left:850px"> <a style="font-size:18px;text-decoration:none;color:#f40" href="${pageContext.request.contextPath}/">游客访问 </a></div>
	</div>

	<div class="main">
		<div class="login-form fr">
      <div id="webcam"></div>

      <div class="btn">
      <!--     <input type="button" value="删除" id="delBtn" onclick="delPhoto();"/> -->
      <div class="form-bd" style="background: white;border:0px;">
        <input id="rtBtn" class="submit" type="button" value="返回密码登陆" id="saveBtn"  style="float:left;width:100px;height:35px;line-height:35px;margin-left: 30px;"/>
      </div>
      <div class="form-bd" style="background: white;border:0px;">
        <input class="submit" type="button" value="拍照识别登陆" id="saveBtn" onclick="savePhoto();" style="float:left;width:100px;height:35px;line-height:35px;margin-left: 30px;"/>
      </div>
      </div>

			<div class="form-ft">

			</div>
		</div>

		<div class="login-form-left fl">
			<img src="images/left.jpg" alt="" />
		</div>
	</div>

</body>
</html>

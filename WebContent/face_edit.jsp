<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>修改个人资料</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop_common.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop_header.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop_manager.css" type="text/css" />
	<link rel="stylesheet" href="css/global.css" />
	<link rel="stylesheet" href="css/login-register.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop_form.css" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/topNav.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-1.11.3.min.js" ></script>
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
                   url: "FaceIn",
                   data: {type: "pixel",username:$("#username").val(),image: canvas.toDataURL("image/png")},
                   dataType: "text",
                   success: function(data){
                	   alert("人脸录入成功！");
//                         var h="mid.jsp?username="+data
//                      //   alert(h)
//                      if(data!=""){
//                         window.location.href=h
//                      }else{
//                        alert("人脸验证失败")
//                        var t = setTimeout(function(){window.location.reload();},1000);
//                      }
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
    <script type="text/javascript">
         $(function(){
        	 var sex="${user.sex}"
        	if(sex==0){
        	
        		$("#0").attr("checked","checked")
        	}
        	   	if(sex==1){
            		
            		$("#1").attr("checked","checked")
            	}
        	   	if(sex==-1){
            	
            		$("#-1").attr("checked","checked")
            	}
         })
    
    </script>
</head>
<body>
	 <jsp:include page="/head.jsp"></jsp:include>
		<!-- Header Menu -->
		<div class="shop_hd_menu">
			<!-- 所有商品菜单 -->
                        
			<div id="shop_hd_menu_all_category" class="shop_hd_menu_all_category"><!-- 首页去掉 id="shop_hd_menu_all_category" 加上clsss shop_hd_menu_hover -->
				<div class="shop_hd_menu_all_category_title"><h2 title="所有商品分类"><a href="javascript:void(0);">所有商品分类</a></h2><i></i></div>
				<div id="shop_hd_menu_all_category_hd" class="shop_hd_menu_all_category_hd">
					<ul class="shop_hd_menu_all_category_hd_menu clearfix">
						<!-- 单个菜单项 -->
						<li id="cat_1" class="">
							<h3><a href="" title="男女服装">男女服装</a></h3>
							<div id="cat_1_menu" class="cat_menu clearfix" style="">
								<dl class="clearfix">
									<dt><a href="女装" href="">女装</a></dt>
									<dd>
										<a href="">风衣</a>
										<a href="">长袖连衣裙</a>
										<a href="">毛呢连衣裙</a>
										<a href="">半身裙</a>
										<a href="">小脚裤</a>
										<a href="">加绒打底裤</a>
										<a href="">牛仔裤</a>
										<a href="">打底衫</a>
										<a href="">情侣装</a>
										<a href="">棉衣</a>
										<a href="">毛呢大衣</a>
                                                                                <a href="">毛呢短裤</a>
									</dd>
								</dl>
                                                            
                                                                <dl class="clearfix">
									<dt><a href="男装" href="">男装</a></dt>
									<dd>
										<a href="">风衣</a>
										<a href="">长袖连衣裙</a>
										<a href="">毛呢连衣裙</a>
										<a href="">半身裙</a>
										<a href="">小脚裤</a>
										<a href="">加绒打底裤</a>
										<a href="">牛仔裤</a>
										<a href="">打底衫</a>
										<a href="">情侣装</a>
										<a href="">棉衣</a>
										<a href="">毛呢大衣</a>
                                                                                <a href="">毛呢短裤</a>
									</dd>
								</dl>
							</div>
						</li>
						<!-- 单个菜单项 End -->
                                                <li id="cat_2" class="">
                                                    <h3><a href="" title="鞋包配饰">鞋包配饰</a></h3>
                                                    <div id="cat_1_menu" class="cat_menu clearfix" style="">
                                                        <dl class="clearfix">
									<dt><a href="鞋子" href="">鞋子</a></dt>
									<dd>
										<a href="">风衣</a>
										<a href="">长袖连衣裙</a>
										<a href="">毛呢连衣裙</a>
										<a href="">半身裙</a>
										<a href="">小脚裤</a>
										<a href="">加绒打底裤</a>
										<a href="">牛仔裤</a>
										<a href="">打底衫</a>
										<a href="">情侣装</a>
										<a href="">棉衣</a>
										<a href="">毛呢大衣</a>
                                                                                <a href="">毛呢短裤</a>
									</dd>
								</dl>
                                                            
                                                                <dl class="clearfix">
									<dt><a href="包包" href="">包包</a></dt>
									<dd>
										<a href="">风衣</a>
										<a href="">长袖连衣裙</a>
										<a href="">毛呢连衣裙</a>
										<a href="">半身裙</a>
										<a href="">小脚裤</a>
										<a href="">加绒打底裤</a>
										<a href="">牛仔裤</a>
										<a href="">打底衫</a>
										<a href="">情侣装</a>
										<a href="">棉衣</a>
										<a href="">毛呢大衣</a>
                                                                                <a href="">毛呢短裤</a>
									</dd>
								</dl>
                                                    </div>
                                                </li>
                                                
                                                <li id="cat_3" class="">
                                                    <h3><a href="" title="美容美妆">美容美妆</a></h3>
                                                    <div id="cat_1_menu" class="cat_menu clearfix" style="">
                                                        <dl class="clearfix">
									<dt><a href="美容" href="">美容</a></dt>
									<dd>
										<a href="">风衣</a>
										<a href="">长袖连衣裙</a>
										<a href="">毛呢连衣裙</a>
										<a href="">半身裙</a>
										<a href="">小脚裤</a>
										<a href="">加绒打底裤</a>
										<a href="">牛仔裤</a>
										<a href="">打底衫</a>
										<a href="">情侣装</a>
										<a href="">棉衣</a>
										<a href="">毛呢大衣</a>
                                                                                <a href="">毛呢短裤</a>
									</dd>
								</dl>
                                                            
                                                                <dl class="clearfix">
									<dt><a href="美妆" href="">美妆</a></dt>
									<dd>
										<a href="">风衣</a>
										<a href="">长袖连衣裙</a>
										<a href="">毛呢连衣裙</a>
										<a href="">半身裙</a>
										<a href="">小脚裤</a>
										<a href="">加绒打底裤</a>
										<a href="">牛仔裤</a>
										<a href="">打底衫</a>
										<a href="">情侣装</a>
										<a href="">棉衣</a>
										<a href="">毛呢大衣</a>
                                                                                <a href="">毛呢短裤</a>
									</dd>
								</dl>
                                                    </div>
                                                </li>
                                                
                                                <li id="cat_4" class="">
                                                    <h3><a href="" title="美容美妆">美容美妆</a></h3>
                                                    <div id="cat_1_menu" class="cat_menu clearfix" style="">
                                                        <dl class="clearfix">
									<dt><a href="美容" href="">美容</a></dt>
									<dd>
										<a href="">风衣</a>
										<a href="">长袖连衣裙</a>
										<a href="">毛呢连衣裙</a>
										<a href="">半身裙</a>
										<a href="">小脚裤</a>
										<a href="">加绒打底裤</a>
										<a href="">牛仔裤</a>
										<a href="">打底衫</a>
										<a href="">情侣装</a>
										<a href="">棉衣</a>
										<a href="">毛呢大衣</a>
                                                                                <a href="">毛呢短裤</a>
									</dd>
								</dl>
                                                            
                                                                <dl class="clearfix">
									<dt><a href="美妆" href="">美妆</a></dt>
									<dd>
										<a href="">风衣</a>
										<a href="">长袖连衣裙</a>
										<a href="">毛呢连衣裙</a>
										<a href="">半身裙</a>
										<a href="">小脚裤</a>
										<a href="">加绒打底裤</a>
										<a href="">牛仔裤</a>
										<a href="">打底衫</a>
										<a href="">情侣装</a>
										<a href="">棉衣</a>
										<a href="">毛呢大衣</a>
                                                                                <a href="">毛呢短裤</a>
									</dd>
								</dl>
                                                    </div>
                                                </li>
                                                
                                                <li id="cat_5" class="">
                                                    <h3><a href="" title="美容美妆">美容美妆</a></h3>
                                                    <div id="cat_1_menu" class="cat_menu clearfix" style="">
                                                        <dl class="clearfix">
									<dt><a href="美容" href="">美容</a></dt>
									<dd>
										<a href="">风衣</a>
										<a href="">长袖连衣裙</a>
										<a href="">毛呢连衣裙</a>
										<a href="">半身裙</a>
										<a href="">小脚裤</a>
										<a href="">加绒打底裤</a>
										<a href="">牛仔裤</a>
										<a href="">打底衫</a>
										<a href="">情侣装</a>
										<a href="">棉衣</a>
										<a href="">毛呢大衣</a>
                                                                                <a href="">毛呢短裤</a>
									</dd>
								</dl>
                                                            
                                                                <dl class="clearfix">
									<dt><a href="美妆" href="">美妆</a></dt>
									<dd>
										<a href="">风衣</a>
										<a href="">长袖连衣裙</a>
										<a href="">毛呢连衣裙</a>
										<a href="">半身裙</a>
										<a href="">小脚裤</a>
										<a href="">加绒打底裤</a>
										<a href="">牛仔裤</a>
										<a href="">打底衫</a>
										<a href="">情侣装</a>
										<a href="">棉衣</a>
										<a href="">毛呢大衣</a>
                                                                                <a href="">毛呢短裤</a>
									</dd>
								</dl>
                                                    </div>
                                                </li>
                                                
                                                <li id="cat_6" class="">
                                                    <h3><a href="" title="美容美妆">美容美妆</a></h3>
                                                    <div id="cat_1_menu" class="cat_menu clearfix" style="">
                                                        <dl class="clearfix">
									<dt><a href="美容" href="">美容</a></dt>
									<dd>
										<a href="">风衣</a>
										<a href="">长袖连衣裙</a>
										<a href="">毛呢连衣裙</a>
										<a href="">半身裙</a>
										<a href="">小脚裤</a>
										<a href="">加绒打底裤</a>
										<a href="">牛仔裤</a>
										<a href="">打底衫</a>
										<a href="">情侣装</a>
										<a href="">棉衣</a>
										<a href="">毛呢大衣</a>
                                                                                <a href="">毛呢短裤</a>
									</dd>
								</dl>
                                                            
                                                                <dl class="clearfix">
									<dt><a href="美妆" href="">美妆</a></dt>
									<dd>
										<a href="">风衣</a>
										<a href="">长袖连衣裙</a>
										<a href="">毛呢连衣裙</a>
										<a href="">半身裙</a>
										<a href="">小脚裤</a>
										<a href="">加绒打底裤</a>
										<a href="">牛仔裤</a>
										<a href="">打底衫</a>
										<a href="">情侣装</a>
										<a href="">棉衣</a>
										<a href="">毛呢大衣</a>
                                                                                <a href="">毛呢短裤</a>
									</dd>
								</dl>
                                                    </div>
                                                </li>
                                                <li id="cat_7" class="">
                                                    <h3><a href="" title="美容美妆">美容美妆</a></h3>
                                                    <div id="cat_1_menu" class="cat_menu clearfix" style="">
                                                        <dl class="clearfix">
									<dt><a href="美容" href="">美容</a></dt>
									<dd>
										<a href="">风衣</a>
										<a href="">长袖连衣裙</a>
										<a href="">毛呢连衣裙</a>
										<a href="">半身裙</a>
										<a href="">小脚裤</a>
										<a href="">加绒打底裤</a>
										<a href="">牛仔裤</a>
										<a href="">打底衫</a>
										<a href="">情侣装</a>
										<a href="">棉衣</a>
										<a href="">毛呢大衣</a>
                                                                                <a href="">毛呢短裤</a>
									</dd>
								</dl>
                                                            
                                                                <dl class="clearfix">
									<dt><a href="美妆" href="">美妆</a></dt>
									<dd>
										<a href="">风衣</a>
										<a href="">长袖连衣裙</a>
										<a href="">毛呢连衣裙</a>
										<a href="">半身裙</a>
										<a href="">小脚裤</a>
										<a href="">加绒打底裤</a>
										<a href="">牛仔裤</a>
										<a href="">打底衫</a>
										<a href="">情侣装</a>
										<a href="">棉衣</a>
										<a href="">毛呢大衣</a>
                                                                                <a href="">毛呢短裤</a>
									</dd>
								</dl>
                                                    </div>
                                                </li>
                                                <li id="cat_8" class="">
                                                    <h3><a href="" title="美容美妆">美容美妆</a></h3>
                                                    <div id="cat_1_menu" class="cat_menu clearfix" style="">
                                                        <dl class="clearfix">
									<dt><a href="美容" href="">美容</a></dt>
									<dd>
										<a href="">风衣</a>
										<a href="">长袖连衣裙</a>
										<a href="">毛呢连衣裙</a>
										<a href="">半身裙</a>
										<a href="">小脚裤</a>
										<a href="">加绒打底裤</a>
										<a href="">牛仔裤</a>
										<a href="">打底衫</a>
										<a href="">情侣装</a>
										<a href="">棉衣</a>
										<a href="">毛呢大衣</a>
                                                                                <a href="">毛呢短裤</a>
									</dd>
								</dl>
                                                            
                                                                <dl class="clearfix">
									<dt><a href="美妆" href="">美妆</a></dt>
									<dd>
										<a href="">风衣</a>
										<a href="">长袖连衣裙</a>
										<a href="">毛呢连衣裙</a>
										<a href="">半身裙</a>
										<a href="">小脚裤</a>
										<a href="">加绒打底裤</a>
										<a href="">牛仔裤</a>
										<a href="">打底衫</a>
										<a href="">情侣装</a>
										<a href="">棉衣</a>
										<a href="">毛呢大衣</a>
                                                                                <a href="">毛呢短裤</a>
									</dd>
								</dl>
                                                    </div>
                                                </li>
                                                <li class="more"><a href="">查看更多分类</a></li>
					</ul>
				</div>
			</div>
			<!-- 所有商品菜单 END -->

			<!-- 普通导航菜单 -->
			<ul class="shop_hd_menu_nav">
				<li class="current_link"><a href=""><span>首页</span></a></li>
				<li class="link"><a href=""><span>团购</span></a></li>
				<li class="link"><a href=""><span>品牌</span></a></li>
				<li class="link"><a href=""><span>优惠卷</span></a></li>
				<li class="link"><a href=""><span>积分中心</span></a></li>
				<li class="link"><a href=""><span>运动专场</span></a></li>
				<li class="link"><a href=""><span>微商城</span></a></li>
			</ul>
			<!-- 普通导航菜单 End -->
		</div>
		<!-- Header Menu End -->

	</div>
	<div class="clear"></div>
	<!-- 面包屑 注意首页没有 -->
	<div class="shop_hd_breadcrumb">
		<strong>当前位置：</strong>
		<span>
			<a href="">首页</a>&nbsp;›&nbsp;
			<a href="">我的商城</a>&nbsp;›&nbsp;

		</span>
	</div>
	<div class="clear"></div>
	<!-- 面包屑 End -->

	<!-- Header End -->	

	<!-- 我的个人中心 -->
	<div class="shop_member_bd clearfix">
		<!-- 左边导航 -->
		<div class="shop_member_bd_left clearfix">
			
			<div class="shop_member_bd_left_pic">
				<a href="javascript:void(0);"><img src="${pageContext.request.contextPath }/images/avatar.png" /></a>
			</div>
			<div class="clear"></div>

			<dl>
				<dt>我的交易</dt>
				<dd><span><a href="">我的收藏</a></span></dd>
			</dl>

			<dl>
				<dt>我的账户</dt>
				<dd><span><a href="#">个人资料</a></span></dd>
				<dd><span><a href="${pageContext.request.contextPath }/face_edit.jsp">人脸录入</a></span></dd>
				<dd><span><a href="${pageContext.request.contextPath }/password_eidt.jsp">密码修改</a></span></dd>
			</dl>

		</div>
		<!-- 左边导航 End -->
		
		<!-- 右边购物列表 -->
		<div class="shop_member_bd_right clearfix">
			
			<div class="shop_meber_bd_good_lists clearfix">
				<div class="title"><h3>基本信息</h3></div>
				<div class="clear"></div>
				<div class="shop_home_form">
						<div class="main">
		<div class="login-form fr" style=" margin-right: 430px;">
		<input type="text" id="username" name="username" value="${user.username}" class="truename form-text" style="height:0px;border:0px;"/>
      <div id="webcam"></div>

      <div class="btn">
      <!--     <input type="button" value="删除" id="delBtn" onclick="delPhoto();"/> -->
      <div class="form-bd" style="background: white;border:0px;">
        <input class="submit" type="button" value="人脸录入" id="saveBtn" onclick="savePhoto();" style="float:left;width:100px;height:35px;line-height:35px;margin-left: 30px;"/>
      </div>
      </div>

			<div class="form-ft">

			</div>
		</div>

	</div>
				</div>
			</div>
		</div>
		<!-- 右边购物列表 End -->

	</div>
	<!-- 我的个人中心 End -->


</body>
</html>
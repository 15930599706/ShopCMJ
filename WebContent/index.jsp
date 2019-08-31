<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">


<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>带数据商城-首页</title>
	<link rel="stylesheet" href="css/base.css" type="text/css" />
	<link rel="stylesheet" href="css/shop_common.css" type="text/css" />
	<link rel="stylesheet" href="css/shop_header.css" type="text/css" />
        <link rel="stylesheet" href="css/shop_home.css" type="text/css" />
        <script type="text/javascript" src="js/jquery.js" ></script>
        <script type="text/javascript" src="js/topNav.js" ></script>
        <script type="text/javascript" src="js/focus.js" ></script>
        <script type="text/javascript" src="js/shop_home_tab.js" ></script>
        <script type="text/javascript" src="js/shop_goods_tab.js" ></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
        <script type="text/javascript" >
        $(function(){
      	  $.post(
      		"${pageContext.request.contextPath}/admincategory?method=adminCategoryList","",function(data){
      			var content="";
      			$.each( data, function(i, n){
      				  content+="<a href='${pageContext.request.contextPath}/productServlet?method=cateProductList&cid="+n.cid+"'>"+n.cname+"</a>";
      				});
      			$(".cid").html(content)

      		},"json"
      	  )
        })
        </script>
  <style type="text/css">
  
 ._pic1{
	width: 250px;
	height: 73px;
	/*border: 1px solid black;*/
}
  ._pic1 .__pic1{
	display: inline-block;
	width: 250px;
	height: 50px;
	background-size: 250px 50px;
	/*border: 1px solid black;*/
	background-image: url(pic1.png);
	cursor: pointer;
}
  ._pic1  ._list1{
	width: 60px;
	height: 23px;
	display: inline-block;
	float: left;
	text-align: center;
	line-height: 23px;
	}
  ._pic1  ._list1:hover{
	color: #f40;
}

  ._pic2{
	height: 73px;
	/*border: 1px solid red;*/
}
  ._pic2 .__pic2{
	display: inline-block;
	width: 250px;
	height: 50px;
	background-size: 250px 50px;
	/*border: 1px solid black;*/
	background-image: url(pic2.png);
	cursor: pointer;
}
  ._pic2  ._list2{
	width: 60px;
	height: 23px;
	display: inline-block;
	float: left;
	text-align: center;
	line-height: 23px;
	}
  ._pic2  ._list2:hover{
	color: #f40;
}

  ._pic3{
	height: 73px;
	/*border: 1px solid black;*/
}
  ._pic3 .__pic3{
	display: inline-block;
	width: 250px;
	height: 50px;
	background-size: 250px 50px;
	/*border: 1px solid black;*/
	background-image: url(pic3.png);
	cursor: pointer;
}
  ._pic3  ._list3{
	width: 60px;
	height: 23px;
	display: inline-block;
	float: left;
	text-align: center;
	line-height: 23px;
	}
  ._pic3  ._list3:hover{
	color: #f40;
}
  </style>
</head>
<body>
	 <jsp:include page="/head.jsp"></jsp:include>
		<!-- TopHeader Center -->
		<div class="shop_hd_header">
			<div class="shop_hd_header_logo"><h1 class="logo"><a href="/ShopCMJ"><img src="images/logo.png" alt="ShopCZ" /></a><span>ShopCZ</span></h1></div>
			<div class="shop_hd_header_search" >
                            <ul class="shop_hd_header_search_tab">
			        <li id="search" class="current">商品</li>
			    </ul>
                            <div class="clear"></div>
			    <div class="search_form"  style="position:relative">
			    	<form method="post" action="${pageContext.request.contextPath}/productServlet?method=searchProduct">
			    		<div class="search_formstyle">
			    			<input type="text" id="search_id" onkeyup="searchs($(this).val())" value="" class="search_form_text" name="search_content" />
			    			<input type="submit" class="search_form_sub" name="secrch_submit" title="搜索" value=""/>
			    		</div>
			    	</form>

			    		</div>
			    		
			      
			      
			      <script type="text/javascript">


			      function searchs(val){
			    	  $("#showDiv").html("");
			    	  $.post(
					    		"${pageContext.request.contextPath}/productServlet?method=tipProduct",{"message":val},function(data){
					    			$.each( data, function(i, n){
					    				$("#showDiv").css("display","block")
					    				$("#showDiv").append("<div  style='cursor: pointer; margin-top:5px;' onclick='fun_click(this)' onmouseover='fun_over(this)'  onmouseout='fun_out(this) '>"+n.substr(0,30)+"</div>");
					    		   });

					    		},"json"
					  );

			      }
			      function fun_over(obj){
			    	  $(obj).css("background","#199805")
			      }
			      function fun_out(obj){
			    	  $(obj).css("background","#FFFFFF")
			      }
			      function fun_click(obj){
			    	 $("#search_id").val($(obj).html());
			    	 $("#showDiv").css("display","none")
			      }
			      </script>
			    </div>
			
			
			    <iframe id="son" name="son" style="float:right;border:0px;height: 51px;margin-top: 29px;margin-right: 100px;width: 44px;"src="luyin2.jsp"> </iframe>  
			</div>
		</div>

		<div id="showDiv"   style=" mfloat:left;left:610px;top:95px;display:none; position:absolute;z-index:1000;background:#fff; width:404px;border:1px solid #ccc;">

		</div>

		<div class="clear"></div>
		<!-- TopHeader Center End -->

		<!-- Header Menu -->
		<div class="shop_hd_menu" >
			<!-- 所有商品菜单 -->

			<div class="shop_hd_menu_all_category shop_hd_menu_hover"><!-- 首页去掉 id="shop_hd_menu_all_category" 加上clsss shop_hd_menu_hover -->
				<div class="shop_hd_menu_all_category_title"><h2 title="所有商品分类"><a href="javascript:void(0);">所有商品分类</a></h2><i></i></div>
				<div id="shop_hd_menu_all_category_hd" class="shop_hd_menu_all_category_hd">
					<ul class="shop_hd_menu_all_category_hd_menu clearfix">
						<!-- 单个菜单项 -->
						<li id="cat_1" class="">
							<h3><a href="" title="男女服装">男女服装</a></h3>
							<div id="cat_1_menu" class="cat_menu clearfix" style="">
								<dl class="clearfix">
									<dt><a href="女装" href="">女装</a></dt>
									<dd class="cid">
									</dd>
								</dl>

                  <dl class="clearfix">
									<dt><a href="男装" href="">男装</a></dt>
                  <dd class="cid">
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
	<!-- Header End -->


	<!-- Body -wll-2013/03/24 -->
	<div class="shop_bd clearfix">
            <!-- 第一块区域  -->
            <div class="shop_bd_top clearfix">
                <div class="shop_bd_top_left"></div>
                <div class="shop_bd_top_center">
                    <!-- 图片切换  begin  -->
                    <div class="xifan_sub_box">
                      <div id="p-select" class="sub_nav"><div class="sub_no" id="xifan_bd1lfsj"> <ul></ul></div></div>
                      <div id="xifan_bd1lfimg">
                        <div>
                          <dl class=""></dl>
                          <dl class="">
                            <dt><a href="" title="" target="_blank"><img src="image/a1.jpg" alt=""></a></dt>
                            <dd><h2><a href="" target="_blank"></a></h2></dd>
                          </dl>
                          <dl class="">
                            <dt><a href="" title="" target="_blank"><img src="image/a2.jpg" alt=""></a></dt>
                            <dd><h2><a href="" target="_blank"></a></h2></dd>
                          </dl>
                          <dl class="">
                            <dt><a href="" title="" target="_blank"><img src="image/a3.jpg" alt=""></a></dt>
                            <dd><h2><a href="" target="_blank"></a></h2></dd>
                          </dl>
                          <dl class="">
                            <dt><a href="" title="" target="_blank"><img src="image/a4.jpg" alt=""></a></dt>
                            <dd><h2><a href="" target="_blank"></a></h2></dd>
                          </dl>
                          <dl class="">
                            <dt><a href="" title="" target="_blank"><img src="image/a5.jpg" alt=""></a></dt>
                            <dd><h2><a href="" target="_blank"></a></h2></dd>
                          </dl>
                          <dl class="">
                            <dt><a href="" title="" target="_blank"><img src="image/a6.jpg" alt=""></a></dt>
                            <dd><h2><a href="" target="_blank"></a></h2></dd>
                          </dl>
                        </div>
                      </div>
                    </div>
                    <script type="text/javascript">movec();</script>
                    <!-- 图片切换  end -->
                    <div class="clear"></div>
                    <div class="shop_bd_top_center_hot"><img src="images/web-2-28_9f2f7dcad3049df7450cecd179e142d8.gif" width="516" height="119" /></div>
                </div>

                <!-- 右侧 -->
                <div class="shop_bd_top_right clearfix">
                    <div class="shop_bd_top_right_quickLink">
                        <a href="${pageContext.request.contextPath }/login.jsp" class="login" title="会员登录"><i></i>会员登录</a>
                        <a href="${pageContext.request.contextPath }/register.jsp" class="register" title="免费注册"><i></i>免费注册</a>
                        <a href="" class="join" title="商家开店" ><i></i>帮助中心</a>
                    </div>

                    <div class="shop_bd_top_right-style1 nc-home-news">
                       <ul>
					<li class="_pic1">
						<a class="__pic1"></a>
						<ul>
							<li>
								<a class="_list1" href="#">充话费</a>
							</li>
							<li>
								<a class="_list1" href="#">旅行</a>
							</li>
							<li>
								<a class="_list1" href="#">车险</a>
							</li>
							<li>
								<a class="_list1" href="#">游戏</a>
							</li>
						</ul>
					</li>
					<li class="_pic2">
						<a class="__pic2"></a>
						<ul>
							<li>
								<a class="_list2" href="#">彩票</a>
							</li>
							<li>
								<a class="_list2" href="#">电影</a>
							</li>
							<li>
								<a class="_list2" href="#">酒店</a>
							</li>
							<li>
								<a class="_list2" href="#">理财</a>
							</li>
						</ul>

					</li>
					<li class="_pic3">
						<a class="__pic3"></a>
						<ul>
							<li>
								<a class="_list3" href="#">找服务</a>
							<li>
								<a class="_list3" href="#">演出</a>
							</li>
							<li>
								<a class="_list3" href="#">水电煤</a>
							</li>
							<li>
								<a class="_list3" href="#">火车票</a>
							</li>
						</ul>

					</li>
				</ul>
                    </div>


                </div>
                <!-- 右侧 End -->
            </div>
            <div class="clear"></div>
            <!-- 第一块区域 End -->

            <!-- 第二块区域 -->
            <div class="shop_bd_2 clearfix">
                <!-- 特别推荐 -->
                <div class="shop_bd_tuijian">
                    <ul class="tuijian_tabs">
                        <li class="hover"  onmouseover="easytabs('1', '1');" onfocus="easytabs('1', '1');" onclick="return false;" id="tuijian_content_btn_1"><a href="javascript:void(0);">特别推荐</a></li>
                        <li onmouseover="easytabs('1', '2');" onfocus="easytabs('1', '2');" onclick="return false;" id="tuijian_content_btn_2" ><a href="javascript:void(0);">热门商品</a></li>
                        <li onmouseover="easytabs('1', '3');" onfocus="easytabs('1', '3');" onclick="return false;" id="tuijian_content_btn_3"><a href="javascript:void(0);">新品上架</a></li>
                    </ul>
                    <div class="tuijian_content">
                        <div id="tuijian_content_1" class="tuijian_shangpin" style="display: block;">
                            <ul>
                                <li>
                                    <dl>
                                        <dt><a href="/ShopCMJ/productServlet?method=productInfo&cid=1&pid=06c5f7f6-f798-48cb-b872-0e78d0ee7e2a"><img src="image/5b767c07Na41ece31.jpg" width="160" height="121" /></a></dt>
                                        <dd><a href="/ShopCMJ/productServlet?method=productInfo&cid=1&pid=06c5f7f6-f798-48cb-b872-0e78d0ee7e2a">游戏手机 8GB+128GB 移动联通电信全网通4G手机 双卡双待</a></dd>
                                        <dd> 商城价：<em>3998.00</em>元</dd>
                                    </dl>
                                </li>
                                <li>
                                    <dl>
                                        <dt><a href="/ShopCMJ/productServlet?method=productInfo&cid=2&pid=538f6a77-0806-4907-9a95-52c94a8dbb02"><img src="image/5b149d62N8784ec1e.jpg" width="160" height="121" /></a></dt>
                                        <dd><a href="/ShopCMJ/productServlet?method=productInfo&cid=2&pid=538f6a77-0806-4907-9a95-52c94a8dbb02">戴尔DELL游匣G3烈焰版 15.6英寸游戏笔记本电脑</a></dd>
                                        <dd> 商城价：<em>5999.00</em>元</dd>
                                    </dl>
                                </li>

                                <li>
                                    <dl>
                                        <dt><a href="/ShopCMJ/productServlet?method=productInfo&cid=1&pid=a7658d8c-94d3-4312-b385-e5228f7e33e1"><img src="image/59df2e83Nc6f15397.jpg" width="160" height="121" /></a></dt>
                                        <dd><a href="/ShopCMJ/productServlet?method=productInfo&cid=1&pid=a7658d8c-94d3-4312-b385-e5228f7e33e1">Apple iPhone X (A1865) 64GB 移动联通电信4G手机</a></dd>
                                        <dd> 商城价：<em>7099.00</em>元</dd>
                                    </dl>
                                </li>

                                <li>
                                    <dl>
                                        <dt><a href="/ShopCMJ/productServlet?method=productInfo&cid=2&pid=af82df94-52cc-4863-85a6-98395234c68f"><img src="image/5b11632fNbcf2b880.jpg" width="160" height="121" /></a></dt>
                                        <dd><a href="/ShopCMJ/productServlet?method=productInfo&cid=2&pid=af82df94-52cc-4863-85a6-98395234c68f">联想(Lenovo)拯救者Y7000 15.6英寸游戏笔记本电脑</a></dd>
                                        <dd> 商城价：<em>7299.00</em>元</dd>
                                    </dl>
                                </li>

                            </ul>
                        </div>

                        <div id="tuijian_content_2" class="tuijian_shangpin">
                            <ul>
                                <li>
                                    <dl>
                                        <dt><a href=""><img src="images/365_7d5e08127b8d6799209674ecffbfc624.jpg_small.jpg" /></a></dt>
                                        <dd><a href="">2222222棉布艺双人沙发垫沙发巾飘窗垫素雅黄花</a></dd>
                                        <dd> 商城价：<em>256.00</em>元</dd>
                                    </dl>
                                </li>
                                <li>
                                    <dl>
                                        <dt><a href=""><img src="images/365_7d5e08127b8d6799209674ecffbfc624.jpg_small.jpg" /></a></dt>
                                        <dd><a href="">外贸田园绗缝全棉布艺双人沙发垫沙发巾飘窗垫素雅黄花</a></dd>
                                        <dd> 商城价：<em>256.00</em>元</dd>
                                    </dl>
                                </li>

                                <li>
                                    <dl>
                                        <dt><a href=""><img src="images/365_7d5e08127b8d6799209674ecffbfc624.jpg_small.jpg" /></a></dt>
                                        <dd><a href="">外贸田园绗缝全棉布艺双人沙发垫沙发巾飘窗垫素雅黄花</a></dd>
                                        <dd> 商城价：<em>256.00</em>元</dd>
                                    </dl>
                                </li>

                                <li>
                                    <dl>
                                        <dt><a href=""><img src="images/365_7d5e08127b8d6799209674ecffbfc624.jpg_small.jpg" /></a></dt>
                                        <dd><a href="">外贸田园绗缝全棉布艺双人沙发垫沙发巾飘窗垫素雅黄花</a></dd>
                                        <dd> 商城价：<em>256.00</em>元</dd>
                                    </dl>
                                </li>

                            </ul>
                        </div>
                        <div id="tuijian_content_3" class="tuijian_shangpin tuijian_content">
                            <ul>
                                <li>
                                    <dl>
                                        <dt><a href=""><img src="images/365_7d5e08127b8d6799209674ecffbfc624.jpg_small.jpg" /></a></dt>
                                        <dd><a href="">3333333全棉布艺双人沙发垫沙发巾飘窗垫素雅黄花</a></dd>
                                        <dd> 商城价：<em>256.00</em>元</dd>
                                    </dl>
                                </li>
                                <li>
                                    <dl>
                                        <dt><a href=""><img src="images/365_7d5e08127b8d6799209674ecffbfc624.jpg_small.jpg" /></a></dt>
                                        <dd><a href="">外贸田园绗缝全棉布艺双人沙发垫沙发巾飘窗垫素雅黄花</a></dd>
                                        <dd> 商城价：<em>256.00</em>元</dd>
                                    </dl>
                                </li>

                                <li>
                                    <dl>
                                        <dt><a href=""><img src="images/365_7d5e08127b8d6799209674ecffbfc624.jpg_small.jpg" /></a></dt>
                                        <dd><a href="">外贸田园绗缝全棉布艺双人沙发垫沙发巾飘窗垫素雅黄花</a></dd>
                                        <dd> 商城价：<em>256.00</em>元</dd>
                                    </dl>
                                </li>

                                <li>
                                    <dl>
                                        <dt><a href=""><img src="images/365_7d5e08127b8d6799209674ecffbfc624.jpg_small.jpg" /></a></dt>
                                        <dd><a href="">外贸田园绗缝全棉布艺双人沙发垫沙发巾飘窗垫素雅黄花</a></dd>
                                        <dd> 商城价：<em>256.00</em>元</dd>
                                    </dl>
                                </li>

                            </ul>
                        </div>

                    </div>

                </div>
                <!-- 特别推荐 End -->

                <!-- 首发 -->
                <div class="shop_bd_shoufa"><img src="images/shoufa.jpg" /></div>
                <!-- 首发 End -->

            </div>
            <div class="clear"></div>
            <!-- 第二块区域 End -->

            

            <!-- 第四块区域 男女服饰 -->
            <div class="shop_bd_home_block clearfix">

                <!-- 左边 -->
                <div class="shop_bd_home_block_left">
                    <div class="shop_bd_home_block_left_logo block_nvzhuang_logo"></div>
                    <div class="shop_hd_home_block_left_class clearfix">
                        <dl class="clearfix">
                            <dt>女装</dt>
                            <dd>
                                <a href="">棉衣</a>
                                <a href="">毛呢大衣</a>
                                <a href="">风衣</a>
                                <a href="">打底衫</a>
                                <a href="">情侣装</a>
                                <a href="">毛呢短裤</a>
                                <a href="">牛仔裤</a>
                                <a href="">加绒打...</a>
                                <a href="">小脚裤</a>
                                <a href="">半身裙</a>
                            </dd>
                        </dl>

                        <dl class="clearfix">
                            <dt>男装</dt>
                            <dd>
                                <a href="">羽绒服</a>
                                <a href="">卫衣</a>
                                <a href="">长袖T桖</a>
                                <a href="">长袖衬衫</a>
                                <a href="">风衣</a>
                                <a href="">休闲西装</a>
                                <a href="">棉衣</a>
                                <a href="">休闲长裤</a>
                                <a href="">内衣内裤</a>
                            </dd>
                        </dl>

                    </div>
                    <div class="shop_bd_home_block_left_pic">
                        <a href=""><img src="images/web-1-13_53bfbfc958cb55a435545033bd075bf3.png"/></a>
                    </div>
                </div>
                <!-- 左边 End -->

                <!-- 中间 -->
                <div class="shop_bd_home_block_center">
                    <ul class="tabs-nav">
                        <li><a href="javascript:void(0);">男女服饰</a></li>
                    </ul>
                    <div class="tabs-panel">
                        <ul>
                            <li>
                                <dl>
                                    <dt><a href="/ShopCMJ/productServlet?method=productInfo&cid=3&pid=43c22d03-5a9d-4a24-9c8f-bb56e0564acf"><img src="image/5b724197N0cd5b160.jpg" width="120" height="120" /></a></dt>
                                    <dd><a href="/ShopCMJ/productServlet?method=productInfo&cid=3&pid=43c22d03-5a9d-4a24-9c8f-bb56e0564acf">秋季新款青春女装个性假两件拼接H型连衣裙</a></dd>
                                    <dd>商城价：<em>239.00</em>元</dd>
                                </dl>
                            </li>

                            <li>
                                <dl>
                                    <dt><a href="/ShopCMJ/productServlet?method=productInfo&cid=3&pid=85a398d7-d25b-40a7-9724-7fa0a7245a5a"><img src="image/5b88fb2dN706cb139.jpg" width="120" height="120" /></a></dt>
                                    <dd><a href="/ShopCMJ/productServlet?method=productInfo&cid=3&pid=85a398d7-d25b-40a7-9724-7fa0a7245a5a">2018秋季雪纺两件套套装裙真丝韩版</a></dd>
                                    <dd>商城价：<em>128.00</em>元</dd>
                                </dl>
                            </li>

                            <li>
                                <dl>
                                    <dt><a href="/ShopCMJ/productServlet?method=productInfo&cid=3&pid=a7b083b8-a380-4851-acd5-f4b6cfc3eb68"><img src="image/5adde097Nc184f302.jpg" width="120" height="120" /></a></dt>
                                    <dd><a href="/ShopCMJ/productServlet?method=productInfo&cid=3&pid=a7b083b8-a380-4851-acd5-f4b6cfc3eb68">云妆蝶梦夏季连衣裙雪纺2018新款</a></dd>
                                    <dd>商城价：<em>158.00</em>元</dd>
                                </dl>
                            </li>

                            <li>
                                <dl>
                                    <dt><a href="/ShopCMJ/productServlet?method=productInfo&cid=3&pid=c1b8e852-5f8b-4f16-ab35-2b7ffbf3aa1d"><img src="image/5b88a4c2N21f74533.jpg" width="120" height="120" /></a></dt>
                                    <dd><a href="/ShopCMJ/productServlet?method=productInfo&cid=3&pid=c1b8e852-5f8b-4f16-ab35-2b7ffbf3aa1d">2018夏装新款净色高腰收腰显瘦中长连衣裙女</a></dd>
                                    <dd>商城价：<em>178.00</em>元</dd>
                                </dl>
                            </li>

                            <li>
                                <dl>
                                    <dt><a href="/ShopCMJ/productServlet?method=productInfo&cid=3&pid=d8e97cbc-cab5-422f-b2de-8e0fb644677a"><img src="image/58ec82fbNc23d5e3d.jpg" width="120" height="120" /></a></dt>
                                    <dd><a href="/ShopCMJ/productServlet?method=productInfo&cid=3&pid=d8e97cbc-cab5-422f-b2de-8e0fb644677a">2018夏季新款系腰扣带气质淑女高腰裙子连衣裙</a></dd>
                                    <dd>商城价：<em>500.00</em>元</dd>
                                </dl>
                            </li>

                            <li>
                                <dl>
                                    <dt><a href=""><img src="images/04fb225ea46bd1346f330400eedb7ef2.jpg_small.jpg" /></a></dt>
                                    <dd><a href="">正品都市时尚女装假两件优雅针织衫</a></dd>
                                    <dd>商城价：<em>182.00</em>元</dd>
                                </dl>
                            </li>

                        </ul>
                    </div>
                </div>
                <!-- 中间 End -->

                <!-- 右边商品排行 -->
                <div class="shop_bd_home_block_right">
                    <div class="title"><h3>商品排行</h3></div>
                    <ol class="saletop-list">
                        <li class="top clearfix">
                            <dl>
                                <dt class="goods-name">
                                    <a href="/ShopCMJ/productServlet?method=productInfo&cid=1&pid=06c5f7f6-f798-48cb-b872-0e78d0ee7e2a">零界全面屏AI双摄 游戏手机 8GB+128GB</a>
                                </dt>
                                <dd class="nokey">1</dd>
                                <dd class="goods-pic">
                                    <a href="/ShopCMJ/productServlet?method=productInfo&cid=1&pid=06c5f7f6-f798-48cb-b872-0e78d0ee7e2a"><span class="thumb size60"><img src="image/5b767c07Na41ece31.jpg" width="62" height="62" /></span></a>
                                </dd>
                                <dd class="goods-price"><em>3998.00</em></dd>
                            </dl>
                        </li>
                        <li class="top clearfix">
                            <dl>
                                <dt class="goods-name">
                                    <a href="/ShopCMJ/productServlet?method=productInfo&cid=2&pid=af82df94-52cc-4863-85a6-98395234c68f">联想(Lenovo)拯救者Y7000 15.6英寸游戏笔记本电脑</a>
                                </dt>
                                <dd class="nokey">2</dd>
                                <dd class="goods-pic">
                                    <a href="/ShopCMJ/productServlet?method=productInfo&cid=2&pid=af82df94-52cc-4863-85a6-98395234c68f"><span class="thumb size60"><img src="image/5b11632fNbcf2b880.jpg" width="62" height="62" /></span></a>
                                </dd>
                                <dd class="goods-price"><em>7299.00</em></dd>
                            </dl>
                        </li>
                        <li class="top clearfix">
                            <dl>
                                <dt class="goods-name">
                                    <a href="/ShopCMJ/productServlet?method=productInfo&cid=1&pid=a7658d8c-94d3-4312-b385-e5228f7e33e1">Apple iPhone X (A1865) 64GB 深空灰色 移动联通电信4G手机</a>
                                </dt>
                                <dd class="nokey">3</dd>
                                <dd class="goods-pic">
                                    <a href="/ShopCMJ/productServlet?method=productInfo&cid=1&pid=a7658d8c-94d3-4312-b385-e5228f7e33e1"><span class="thumb size60"><img src="image/59df2e83Nc6f15397.jpg" width="62" height="62" /></span></a>
                                </dd>
                                <dd class="goods-price"><em>7099.00</em></dd>
                            </dl>
                        </li>

                        <li class="normal">
                            <i>4</i>
                            <a href="/ShopCMJ/productServlet?method=productInfo&cid=3&pid=43c22d03-5a9d-4a24-9c8f-bb56e0564acf">秋季新款青春女装个性假两件拼接H型连衣裙</a>
                        </li>
                        <li class="normal">
                            <i>5</i>
                            <a href="/ShopCMJ/productServlet?method=productInfo&cid=3&pid=85a398d7-d25b-40a7-9724-7fa0a7245a5a">2018秋季雪纺两件套套装裙真丝韩版</a>
                        </li>
                        <li class="normal">
                            <i>6</i>
                            <a href="/ShopCMJ/productServlet?method=productInfo&cid=3&pid=a7b083b8-a380-4851-acd5-f4b6cfc3eb68">云妆蝶梦夏季连衣裙雪纺2018新款</a>
                        </li>
                        <li class="normal">
                            <i>7</i>
                            <a href="/ShopCMJ/productServlet?method=productInfo&cid=3&pid=c1b8e852-5f8b-4f16-ab35-2b7ffbf3aa1d">2018夏装新款净色高腰收腰显瘦中长连衣裙女</a>
                        </li>

                    </ol>
                    <div class="saletop-list_adv_pic"><a href=""><img src="images/web-3-38_ff9bd2d724f7138cec1b1937000f4feb.jpg" /></a></div>
                </div>
                <!-- 右边商品排行 -->

                <!-- 品牌展示 -->
                <div class="shop_bd_home_block_bottom">
                    <ul class="">
                        <li><a href=""><img src="images/354b80528d2fbeefbab33c563532517e.gif" /></a></li>
                        <li><a href=""><img src="images/1d2dfbead590510046a6522551db8139.gif" /></a></li>
                        <li><a href=""><img src="images/26247430b09daa1b441b46008bfb6e6e.gif" /></a></li>
                        <li><a href=""><img src="images/a0ac8c6d2d3dc1470d5876923182a8e2.gif" /></a></li>
                        <li><a href=""><img src="images/9c5dee77a6ecdafd9e152fed8c6a4e90.gif" /></a></li>
                        <li><a href=""><img src="images/b175883eba95e793affb1b1ebbbf85a5.gif" /></a></li>
                        <li><a href=""><img src="images/6e61a1c953e5bc8c5f1ffdac36862245.gif" /></a></li>
                        <li><a href=""><img src="images/209abd835cd2ce2208f2dc42ba10efb4.gif" /></a></li>
                    </ul>
                </div>
                <!-- 品牌展示 End -->

            </div>
            <div clas="clear"></div>
            <!-- 第四块区域 End -->

            <%-- <div class="faq">
                <dl>
                    <dt>帮助中心</dt>
                    <dd><a href=""><span>积分兑换说明</span></a></dd>
                    <dd><a href=""><span>积分明细</span></a></dd>
                    <dd><a href=""><span>查看已购买商</span></a></dd>
                    <dd><a href=""><span>我要买</span></a></dd>
                    <dd><a href=""><span>忘记密码</span></a></dd>
                </dl>

                <dl>
                    <dt>店主之家</dt>
                    <dd><a href=""><span>如何申请开店</span></a></dd>
                    <dd><a href=""><span>商城商品推荐</span></a></dd>
                    <dd><a href=""><span>如何发货</span></a></dd>
                    <dd><a href=""><span>查看已售商品</span></a></dd>
                    <dd><a href=""><span>如何管理店铺</span></a></dd>
                </dl>

                <dl>
                    <dt>支付方式</dt>
                    <dd><a href=""><span>公司转账</span></a></dd>
                    <dd><a href=""><span>邮局汇款</span></a></dd>
                    <dd><a href=""><span>分期付款</span></a></dd>
                    <dd><a href=""><span>在线支付</span></a></dd>
                    <dd><a href=""><span>如何注册支付</span></a></dd>
                </dl>

                <dl>
                    <dt>售后服务</dt>
                    <dd><a href=""><span>退款申请</span></a></dd>
                    <dd><a href=""><span>返修/退换货</span></a></dd>
                    <dd><a href=""><span>退换货流程</span></a></dd>
                    <dd><a href=""><span>退换货政策</span></a></dd>
                    <dd><a href=""><span>联系卖家</span></a></dd>
                </dl>

                <dl>
                    <dt>客服中心</dt>
                    <dd><a href=""><span>修改收货地址</span></a></dd>
                    <dd><a href=""><span>商品发布</span></a></dd>
                    <dd><a href=""><span>会员修改个人</span></a></dd>
                    <dd><a href=""><span>会员修改密码</span></a></dd>

                </dl>

                <dl>
                    <dt>关于我们</dt>
                    <dd><a href=""><span>合作及洽谈</span></a></dd>
                    <dd><a href=""><span>招聘英才</span></a></dd>
                    <dd><a href=""><span>联系我们</span></a></dd>
                    <dd><a href=""><span>关于Shop</span></a></dd>
                </dl>


            </div> --%>
            <div class="clear" style="margin-bottom:100px;"></div>
	</div>
	<!-- Body End -->

	<div class="clear" style="margin-bottom:100px;"></div>
	<%-- <div class="shop_footer">
            <div class="shop_footer_link">
                <p>
                    <a href="">首页</a>|
                    <a href="">招聘英才</a>|
                    <a href="">广告合作</a>|
                    <a href="">关于ShopCZ</a>|
                    <a href="">关于我们</a>
                </p>
            </div>
            <div class="shop_footer_copy">
                <p>Copyright 2004-2013 itcast Inc.,All rights reserved.</p>
            </div>
        </div> --%>
</body>
</html>

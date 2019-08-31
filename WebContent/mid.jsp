<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">

function getQueryVariable()
{
	variable="username"
       var query = window.location.search.substring(1);
       var vars = query.split("&");
       for (var i=0;i<vars.length;i++) {
               var pair = vars[i].split("=");
               if(pair[0] == variable){
            	   $("#fn").val(pair[1]);
            	 //  alert(pair[1]);
            	   return pair[1];}
               
       }
       return(false);
}

</script>
</head>
<body  onload="getQueryVariable()">
				<form name="form1" action="${pageContext.request.contextPath }/productServlet?method=facelogin" method="post">
					<dl>
						
						<dd><input style=" border:0.5px solid #ffffff;width:0px;height:0px" type="text" name="username" class="text" id="fn" required="required"   /></dd>
					</dl>
                    
				</form>
				<script>
				setInterval("document.all.form1.submit()",500)
				
				
				</script>
				<h1>加载中，请稍后</h1>
</body>
</html>
package com.zhanshen.web.servlet;

import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;

import com.alibaba.fastjson.JSON;
//import com.sun.java.util.jar.pack.ConstantPool.Index;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import sun.misc.BASE64Decoder;

import com.zhanshen.dao.*;
public class FaceIn extends HttpServlet {

//    public static void main(String[] args) {
//    	System.out.println("gman");
//    }
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		    String username111 = request.getParameter("username");
		    String basePath = "pic/";
		    String filePath = request.getSession().getServletContext().getRealPath("/") + basePath;
		   // String fileName = DateUtils.getDate("yyyyMMddHHmmss") + ".png";
		    String fileName = (new Date()).getTime()+".png";
		    //默认传入的参数带类型等参数：data:image/png;base64,
		    String imgStr = request.getParameter("image");
		    if (null != imgStr) {
		        imgStr = imgStr.substring(imgStr.indexOf(",") + 1);
		    }
		    Boolean flag = GenerateImage(imgStr, filePath, fileName);
		    String result = "";
		    if (flag) {
		        result = basePath + fileName;
		    }
		    
		    //response.getWriter().print(JSON.toJSON(result));
		    String res="Y:\\软件工程课设\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ShopCMJ\\upload\\"+fileName;
		    System.out.println(res);
			//String namee = request.getParameter("namee");
			//String address = request.getParameter("address");
//			List paramenter = (List) new ArrayList<Object>();
//			String sql = "select username picture from user";
//
//			QueryRunner run = new QueryRunner(C3p0Create.getDataSource());
//			System.out.println("QueryRunner获取连接池对象为：==========="+run);
			//7、执行sql语句，获取结果
			
			Connection conn = DBHelper.getConnection();
			String sql="select username,picture from user";
			String sql1="update user set picture=" +"'"+ fileName +"'"+"where username=" +"'"+ username111 +"'";
			Statement st1 = null;
 			try {

 				Statement st = conn.createStatement();
 				ResultSet rs = st.executeQuery(sql);
 				ResultBean user = new ResultBean(); 
                st1 = conn.createStatement();
 				st1.execute(sql1);
 				
 				//request.getRequestDispatcher("/index.jsp").forward(request,response);
 		//	while(rs.next()) { 	 
			//	user.setNamee(rs.getString("username")); 
			//	user.setAddress(rs.getString("picture"));
				//String string=user.getNamee();
				//System.out.println(string);
				//String pic="Y:\\软件工程课设\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ShopCMJ\\pic\\" +user.getAddress();
			//	facereg fg=new facereg();
			   // String ret =fg.match(pic, res);
			   // System.out.println(ret);
			   
			  //  if(ret.equals("error404")) {
			   // 	ret="人脸识别失败";
			  //  	continue;
			  //  }else {
			    //	ret="人脸识别成功";
			   // 	System.out.println(user.getNamee());
			    //	request.setAttribute("username", user.getNamee());
					 // req.setAttribute("info", "两次密码不一致,请重新输入");
			    	//request.getRequestDispatcher("/index.jsp").forward(request, response);
			    	 
			    	//response.sendRedirect("/mid.html");
			   // 	System.out.println("------------------");
			   // 	request.setAttribute("username", "cmj");
			    //	request.setAttribute("password", "cmj");
			    	//request.getRequestDispatcher("/ShopCMJ/productServlet?method=login").forward(request, response);
			    	//response.sendRedirect("/ShopCMJ/luyin2.jsp");
//			    	StringBuilder sb = new StringBuilder("{");
//			    	sb.append("\"username\"").append(":").append(user.getNamee());
//			    	sb.append("}");
			   // 	response.getWriter().print(user.getNamee());		
			    	
			  //  	System.out.println("------------------");
			   // 	return;
		//	    }
		//	   
 		//	}
 
			
			} catch (SQLException e) {
					
				e.printStackTrace();
	
			}
 			//获取用户图片    
	}
	/**
	 * 功能描述：base64字符串转换成图片
	 *
	 * @since 2016/5/24
	 */
	public boolean GenerateImage(String imgStr, String filePath, String fileName) {
	    try {
	        if (imgStr == null) {
	            return false;
	        }
	        BASE64Decoder decoder = new BASE64Decoder();
	        //Base64解码
	        byte[] b = decoder.decodeBuffer(imgStr);
	        //如果目录不存在，则创建
	        File file = new File(filePath);
	        if (!file.exists()) {
	            file.mkdirs();
	        }
	        //生成图片
	        OutputStream out = new FileOutputStream(filePath + fileName);
	        out.write(b);
	        out.flush();
	        out.close();
	        return true;
	    } catch (Exception e) {
	        return false;
	    }
	}
}


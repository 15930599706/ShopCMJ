package com.zhanshen.dao; 

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
public class DBHelper {
	private static final String driver = "com.mysql.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/webprj?useUnicode=true&characterEncoding=UTF-8";
	private static final String username = "root";
	private static final String password = "1";
	
	private static Connection conn=null;
	
	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() {
		if(conn==null) {
			try {
				conn = DriverManager.getConnection(url,username,password);
				System.out.println("数据库初始化成功");
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("数据库初始化失败");
			}
			return conn;
		}else {
			return conn;
		}
	}
	
}
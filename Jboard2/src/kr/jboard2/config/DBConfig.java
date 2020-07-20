package kr.jboard2.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
	
	//DB����. ������
	//public static final String HOST = "jdbc:mysql://krg.pe.kr:3306/krg";
	//public static final String USER = "krg";
	//public static final String PASS = "tmddus";
	
	//DB����. ���߿�
	public static final String HOST = "jdbc:mysql://192.168.50.82:3306/krg";
	public static final String USER = "krg";
	public static final String PASS = "1234";

	public static Connection getConnection() throws Exception {
		
		//1�ܰ�
		Class.forName("com.mysql.jdbc.Driver");
		//2�ܰ�
		Connection conn = DriverManager.getConnection(HOST,USER,PASS);
		return conn;
	}
	
	
}

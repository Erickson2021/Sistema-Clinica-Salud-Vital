package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MysqlDBConexion {
	public static Connection getConexion(){
		Connection cn=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url,user,pass;
			url="jdbc:mysql://localhost:3306/Clinica_Salud?serverTimezone=UTC";
			user="root";
			pass="mysql";
			cn=DriverManager.getConnection(url,user,pass);	
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return cn;
	}

	public static void closeConexion(Connection cn) {
		try {
			cn.close();
		} catch (Exception e) {
			System.out.println("errror" + e.getMessage());
		}
		
	}
}

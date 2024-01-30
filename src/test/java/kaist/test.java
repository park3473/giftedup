package kaist;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.SQLException;

//mysql 테스트

public class test {

public static void main(String args[]) {



		Connection conn;



		try {

			Class.forName("com.mysql.jdbc.Driver").newInstance();

			conn = DriverManager.getConnection(

					"jdbc:mysql://localhost:3306/giftedup", "root", "1234");

			System.out.println("Success!");

		} catch (SQLException ex) {

			System.out.println("SQLException:" + ex);

		} catch (Exception e) {

			System.out.println("Exception:" + e);

		}

	}

}
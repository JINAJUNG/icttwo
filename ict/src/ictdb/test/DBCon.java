package ictdb.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBCon {

	private static final String url="jdbc:oracle:thin:@localhost:1521:xe";
	private static final String id="system";
	private static final String pwd="12345678";
	private static final String driver="oracle.jdbc.driver.OracleDriver";
	
	private static Connection con;
	
	private static void open() {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pwd);
			con.setAutoCommit(false); //oracle jar(ojdbc6)에서 true로 셋팅 되어있음. 그래서 oracle은 false인데 자동으로 commit가 된다.
			//근데 왜 false해도 들어감? -> 머여튼 close하면 auto_commit이 된다 그래서 들어가는가보다.
			//false하고 userdaoImpl에서 rollbac해주면 안드감 ->저장시키기전데이터로 돌리기때매 안드가는것처럼대지요
			//false는 rollback, commit먹은다. close하면 auto_commit이 된다
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getCon() {
		if(DBCon.con==null) {
			open();
		}
		return DBCon.con;
	}
	public static void close() {
		if(DBCon.con!=null) {
			try {
				DBCon.con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		DBCon.con=null;
	}
	public static void main(String[] args) {
		DBCon.getCon();
	}
}

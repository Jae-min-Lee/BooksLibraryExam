package Library;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;

public class Library_DAO {

	private static Library_DAO instance = new Library_DAO();

	public static Library_DAO getInstance() {
		return instance;
	}

	private Library_DAO() {
	}

	public Connection getConnection() throws ClassNotFoundException, SQLException{
		Connection conn = null;
		String Driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "min";
		String pw = "ezen1234";
		
		//1. 드라이버 로딩
		Class.forName(Driver);
		conn = DriverManager.getConnection(url, id, pw);
		 
		return conn;
	}
	public void insert(Library_DTO books_info) throws ClassNotFoundException, SQLException {
		Connection conn= null;
		PreparedStatement pstmt = null;
		conn = getConnection();
		String sql = "insert into books_info(isbn,title,publisher,"+
		"price,category,description)values(?,?,?,?,?,?,?)";
		
		pstmt.setString(1, books_info.getIsbn());
		pstmt.setString(2, books_info.getTitle());
		pstmt.setString(3, books_info.getAuthor());
		pstmt.setString(4, books_info.getPublisher());
		pstmt.setInt(5, books_info.getPrice());
		pstmt.setString(6, books_info.getCategory());
		pstmt.setString(7, books_info.getDescription());
		
		pstmt.executeUpdate();//<= insert, delete, update 
		if(pstmt != null)pstmt.close();
		if(conn != null)conn.close();
	}

}
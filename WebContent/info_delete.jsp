<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String isbn = request.getParameter("isbn");
	
%>

<%
	PreparedStatement pstmt = null;
	String id = "min";
	String pwd = "ezen1234"; 
	String url = "jdbc:oracle:thin:@localhost:1521/xe";
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection(url, id, pwd);
		
		String sql = "delete from books_info where isbn = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, isbn);
		
		pstmt.executeUpdate();
		
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}catch(SQLException e){
		out.print("처리중 문제가 발생했습니다 <hr> <div style='text-align:center;'>관리자에게 문의해주세요</div>");
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서정보 데이터 베이스 저장</title>
</head>
<body>
<% response.sendRedirect("Books.jsp");%>
</body>
</html>
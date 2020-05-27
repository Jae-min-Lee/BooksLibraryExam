<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String isbn = request.getParameter("isbn");
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String category = request.getParameter("category");
	String description = request.getParameter("description");
	int price = Integer.parseInt(request.getParameter("price"));
%>

<%
	PreparedStatement pstmt = null;
	String id = "min";
	String pwd = "ezen1234"; 
	String url = "jdbc:oracle:thin:@localhost:1521/xe";
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection(url, id, pwd);
		
		String sql = "update books_info set title = ?, author = ?, publisher = ?, price=?, category= ?, description=? where isbn = ?";
		out.print(isbn + title);
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, author);
		pstmt.setString(3, publisher);
		pstmt.setInt(4, price);
		pstmt.setString(5, category);
		pstmt.setString(6, description);
		pstmt.setString(7, isbn);
		
		pstmt.executeUpdate();
		
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}catch(SQLException e){
		e.printStackTrace();
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
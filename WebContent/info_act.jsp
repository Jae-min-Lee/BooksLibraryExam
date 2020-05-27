<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String action = request.getParameter("action");

	String isbn = request.getParameter("isbn");
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	int price = Integer.parseInt(request.getParameter("price"));
	String category = request.getParameter("category");
	String description = request.getParameter("description");

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
	} catch (ClassNotFoundException e) {
		out.println(e.getMessage());
	}

	String url = "jdbc:oracle:thin:@localhost:1521/xe";
	Connection conn = DriverManager.getConnection(url, "min", "ezen1234");
	try {
		Statement stmt = conn.createStatement();
		String query = "insert into books_info(isbn,title,price,author,publisher,category,description)  values('"
				+ isbn
				+ "','"
				+ title
				+ "',"
				+ price
				+ ",'"
				+ author
				+ "','"
				+ publisher
				+ "','"
				+ category
				+ "','"
				+ description + "')";
		System.out.println(query);
		//DB에 전달하여 레코드를 삽입한다.
		stmt.executeUpdate(query);


		stmt.close();
		conn.close();
	} catch (SQLException e) {
		out.println(e.getMessage());
	}
%>
<html>
<head>
<meta charset="UTF-8">
<script language="javascript">
	alert("성공적으로 데이터가 추가 되었습니다");
	location.href = "info_list.jsp";
</script>
<head>
<body>

</body>
</html>
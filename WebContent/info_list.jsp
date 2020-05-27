<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page language="java"
	import="java.sql.*, javax.servlet.http.*,java.util.*"%>
<%!String koreanDecoding(String str) throws Exception {
		if (str == null)
			return null;
		else
			return new String(str.getBytes("8859_1"), "UTF-8");

	}%>

<%
	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");

	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
	} catch (ClassNotFoundException e) {
		out.println(e.getMessage());
	}

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "min";
	String pass = "ezen1234";

	Connection connection = DriverManager.getConnection(url, id, pass);

	Statement statement = null;
	ResultSet result = null;

	Vector<String> isbn = new Vector<String>();
	Vector<String> title = new Vector<String>();
	Vector<String> price = new Vector<String>();
	Vector<String> author = new Vector<String>();
	Vector<String> category = new Vector<String>();
	Vector<String> publisher = new Vector<String>();
	Vector<String> description = new Vector<String>();

	try {
		statement = connection.createStatement();
		String query = null;

		if (action == null) {
			query = "select * from books_info";
		} else if (action.equals("search")) {
			String item = request.getParameter("item");
			String searchString = koreanDecoding(request.getParameter("search"));

			query = "select * from books_info where " + item + " like '%" + searchString + "%'";
		}

		result = statement.executeQuery(query);

		while (result.next()) {
			isbn.add(result.getString("isbn"));
			title.add(result.getString("title"));
			price.add(Integer.toString(result.getInt("price")));
			author.add(result.getString("author"));
			category.add(result.getString("category"));
			publisher.add(result.getString("publisher"));
			description.add(result.getString("description"));
		}

		result.close();
		statement.close();
		connection.close();

	} catch (Exception e) {
		out.println(e.getMessage());
	}
	
%>

<html>
<head>
<title>도서 정보 리스트</title>
<style type='text/css'>
body {
	background-repeat: no-repeat;
	background-position: center center;
	background-attachment: fixed;
	text-align: center;
	font-family: verdana;
	font-size: 15 pt;
	font-weight: bold;
}

}
input {
	background:;
	border-width: 1;
	border-color: black;
	height: 20px;
	font-size: 9pt;
	font-family: 굴림;
	color: black;
}

td {
	font-family: verdana;
	font-size: 10pt;
	font-weight: 900;
	text-align: center;
	width: 117 px;
	height: 30 px;
}
</style>
<script>
	function bookSearch() {
		var searchString = document.form1.search.value;

		if (document.form1.search.value.length == 0) {
			alert("검색어가 입력되지 않았습니다");
			return false;
		}
		document.form1.submit();
	}
</script>
</head>
<body bgcolor="#1D8CDB" text=black background="dd.jpg">
	<br>
	<p>Book Information List Search</p>

	<table align="center" border="1" cellpadding="5" cellspacing="0"
		width="90%" bordercolor="#999999">
		<tr>
			<td bgcolor="white">ISBN</td>
			<td bgcolor="white">Title</td>
			<td bgcolor="white">Author</td>
			<td bgcolor="white">Publisher</td>
			<td bgcolor="white">Price</td>
			<td bgcolor="white">Category</td>
			<td bgcolor="white">Description</td>

		</tr>
		<%
			for (int i = 0; i < isbn.size(); i++) {
		%>
		<tr>
			<td><a href="Books.jsp?isbn=<%=isbn.get(i)%>"><%=isbn.get(i)%></a></td>
			<td><%=title.get(i)%></td>
			<td><%=author.get(i)%></td>
			<td><%=publisher.get(i)%></td>
			<td><%=price.get(i)%></td>
			<td><%=category.get(i)%></td>
			<td><%=description.get(i)%></td>


		</tr>
		<%
			}
		%>
	</table>
	<br>

	<form name="form1" action="info_list.jsp?action=search" method="post">
		<select name="item" size="1">
			<option value="isbn">ISBN</option>
			<option value="title" selected>TITLE</option>
			<option value="author">AUTHOR</option>
			<option value="publisher">PUBLISHER</option>
		</select> <input type="text" name="search" maxlength="30" size="40"> <input
			type="submit" value="search" onclick="bookSearch()"> <input
			type="submit" value="list all"
			onclick="location.href='info_list.jsp'">
	</form>
	<form action="http://localhost:8500/Books_Library/Books.jsp">
		<input type="submit" value="메인으로">
	</form>
</body>
</html>
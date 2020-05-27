<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<head>
<title>도서 정보 입력</title>

		<style type='text/css'>
		body {  background-repeat:no-repeat; 
			     background-position:center center; 
				 background-attachment:fixed; 
				 }
<!-- 
		input  {    background: ;
					border-width:1; 
					border-color:black; 
					height:20px; 
					font-size:9pt; 
					font-family:굴림;
					color:black; 
					}
				-->
				<!--
		textarea { background: ;
					border-width:1; 
					border-color:black; 
				    font-size:9pt; 
					font-family:굴림;
					color:black;	
		            border:1 solid black; 
					scrollbar-base-color:#FFE6FD ;
					scrollbar-track-color:#FFE6FD ;
					scrollbar-face-color:#FFE6FD ;
					scrollbar-highlight-color:#FFE6FD;
					scrollbar-3dlight-color:black ;
					scrollbar-darkshadow-color:#FFE6FD;
					scrollbar-shadow-color:black;
					scrollbar-arrow-color: black; }-->
		<!--td { font-family:verdana; 
		     font-size: 10pt; 
			 font-weight: 900 ;
			 }       -->	
		</style>

<head>
<script language="javascript">

	function valid_check() {
		if (document.form1.isbn.value == "") {
			alert("isbn 번호를 입력해 주세요");
			document.form1.isbn.focus();
			return false;
		}

		if (document.form1.title.value == "") {
			alert("title을 입력해 주세요");
			document.form1.title.focus();
			return false;
		}

		if (document.form1.author.value == "") {
			alert("authod를 입력해 주세요");
			document.form1.author.focus();
			return false;
		}

		if (document.form1.category.value == "") {
			alert("category 번호를 입력해 주세요");
			document.form1.category.focus();
			return false;
		}
		
		if (document.form1.publisher.value == "") {
			alert("publisher를 입력해 주세요");
			document.form1.publisher.focus();
			return false;
		}				
		document.form1.submit();//서버로 전송
	}
</script>
<body bgcolor="#1D8CDB" text=black background="dd.jpg" background-repeat="no-repeat">
	<br>
	<br>

	<form name="form1" action="info_act.jsp" method="post">
		<table align="center" border="0" width="457" cellpadding="0"
			cellspacing="0">

			<tr>
				<td width="403" height="43" colspan="2" align="left">
					<p align=center>
						<font size=5>Books Infomation</font>
					</p>
				</td>
			</tr>
			<tr>
				<td width="97" height="33">ISBN</td>
				<td width="306" height="33"><input type="text" name="isbn"
					size="40" maxlength="40"></td>
			</tr>
			<tr>
				<td width="97" height="33">Title</td>
				<td width="306" height="33"><input type="text" name="title"
					size="40" maxlength="50"></td>
			</tr>
			<tr>
				<td width="97" height="33">Author</td>
				<td width="306" height="33"><input type="text" name="author"
					size="40" maxlength="40"></td>
			</tr>
			<tr>
				<td width="97" height="33">Publisher</td>
				<td width="306" height="33"><input type="text" name="publisher"
					size="40"></td>
			</tr>
			<tr>
				<td width="97" height="33">Price</td>
				<td width="306" height="33"><input type="text" name="price"
					size="40" maxlength="6"></td>
			</tr>
			<tr>
				<td width="97" height="29">Category</td>
				<td width="306" height="29"><input type="text" name="category"
					size="40" maxlength="40"></td>
			</tr>
			<tr>
				<td width="97" height="156">Description</td>
				<td width="306" height="156"><textarea name="description"
						rows="7" cols="40"></textarea></td>
			</tr>
			<tr>
				<td width="403" height="19" colspan="2">
					<p align="center">
						<input type="submit" value="전송" onclick="valid_check()"> 
						<input type="reset" value=" reset "> 
						<input type="button"	value=" list" onclick="location.href='info_list.jsp' ">
						<input type="submit" value="수정" formaction="info_update.jsp"> 
						<input type="submit" value="삭제" formaction="info_delete.jsp">
					</p>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
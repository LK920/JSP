<%@ page  contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
	<h2>로그인 성공</h2>
	<%
	String uid = (String) session.getAttribute("uid");
	%>
	<p>
		<%=uid %> 반갑습니다.<br />
		<a href="./logout.jsp">로그아웃</a>	
	</p>
</body>
</html>
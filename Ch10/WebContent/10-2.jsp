<%@ page  contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10-2</title>
</head>
<body>
	<h3>2. session 값 확인</h3>
	<%
		String sid  = session.getId();//세션테이블의 sid 값 구하는 것
		String name = (String) session.getAttribute("name"); 
		String uid  = (String) session.getAttribute("uid"); 
	%>
	<p>
		SID  : <%= sid %><br />
		name : <%=name %><br />
		uid  : <%= uid %><br />
	</p>
</body>
</html>
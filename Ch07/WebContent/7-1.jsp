<%@ page contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="./inc/config.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7-1</title>
</head>
<body>
	<h3>1. include 지시자(디렉티브)</h3>
	
	<%@ include file="./inc/header.jsp" %> <!-- 헤더영역을 삽입 -->
	
	<main>
		<h2>메인 컨텐츠 영역</h2>
		<p>
			DB주소 : <%=HOST %><br />
			DB유저 : <%=USER %><br />
			DB비번 : <%=PASS %><br />
		</p>
	</main>
	
	<%@ include file="./inc/footer.jsp" %> <!-- 푸터영역을 삽입 -->
	
</body>
</html>
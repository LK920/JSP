<%@ page contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="elfunc" uri="/WEB-INF/tags/el-functions.tld" %>
<%
	request.setAttribute("price", 123456);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 함수호출</title>
</head>
<body>

오늘은 <b>${elfunc:formatNumber(price, '#,##0')}</b>원 입니다.

</body>
</html>
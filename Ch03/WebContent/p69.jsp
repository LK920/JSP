<%@ page contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8"%>
<%!
	public int multiple(int x, int y){
	int c = x *y;
	return c;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부를 사용한 두 정수값의 곱</title>
</head>
<body>
	10*25=<%=multiple(10, 25) %>

</body>
</html>
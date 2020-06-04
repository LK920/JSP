<%@ page contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>9-1</title>
</head>
<body>
	<h2>1.쿠키</h2>
	<%
		// 쿠키생성
		Cookie ck1 = new Cookie("name","1a1");
		Cookie ck2 = new Cookie("uid","Hong");
		Cookie ck3 = new Cookie("ph","0123504910");
		//쿠키 유효기간
		ck1.setMaxAge(60*3); 
		ck2.setMaxAge(60*3);
		ck3.setMaxAge(60*60*24*3);
		//리스폰 객체에 싫어서 클라이언트한테 보낸다.
		response.addCookie(ck1);
		response.addCookie(ck2);
		response.addCookie(ck3);
	%>
	<h4>쿠키 생성 후 클라이언트로 전송완료</h4>
	
	<a href="./9-2.jsp">서버로 쿠키 전송</a>
	
</body>
</html>
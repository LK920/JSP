<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@ page contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	HashMap<String, Object> mapData = new HashMap<>();
	mapData.put("name", "강래구");
	Date today = new Date();
	mapData.put("today", today);
	
%>
<c:set var="intArray">1, 2, 3, 4, 5</c:set>
<c:set var="map" value="<%=mapData %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forEach 태그</title>
</head>
<body>
	<h3>1부터 100까지 홀수의 합</h3>
	<c:set var="sum" value="0" />
	<c:forEach var="i" begin="1" end="100" step="2">
		<c:set var="sum" value="${sum + i }"/>
	</c:forEach>
	결과 : ${sum }<br/>
	<h3>구구단 4단</h3>
	<c:forEach var="x" begin="4" end="4">
		<c:forEach var="y" begin="1" end="9">
			<p>${x} x ${y } = ${x*y}</p>
		</c:forEach>
	</c:forEach>
	<h4>int형 배열</h4>
	<c:forEach var="i" items='${intArray }' begin = '2' end='4' varStatus="status">
		${status.index }-${status.count }-[${i }]<br />
	</c:forEach>
	
	<h3>map</h3>
	<c:forEach var='i' items="${map }">
		${i.key } = ${i.value }<br />
	
	</c:forEach>
	
</body>
</html>
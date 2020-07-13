<%@ page contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>12-1</title>
</head>
<body>
	<h3>1. JSTL(Java Standard Tag Library)</h3>
	<h4>Scriptlet 표현</h4>
	<%
		String str = "Hello";
		out.println("<p>str : "+str+"</p>");
		
		int num1 = 1;
		int num2 = 2;
		int num3 = 3;
		
		if(num1<num2){
			out.println("<p>num1이 num2보다 작다.</p>");
		}
		
		if(num1 > num2){
			out.println("<p>num1이 num2보다 크다</p>");
		}else{
			out.println("<p>num1이 num2보다 작다</p>");
		}
		
		if(num1 > num2){
			out.println("<p>num1이 num2보다 크다.</p>");
		}else if(num2 > num3){
			out.println("<p>num2이 num3보다 크다.</p>");
		}else{
			out.println("<p>num3이 가장 크다.</p>");
		}
		
		for(int i = 1 ; i <=5 ; i++){
			out.println("<p>"+i+"Hello JSTL!</p>");
		}
		String[] people = {"김유신","김춘추","장보고","강감찬","이순신"};
		for(String person : people){
			out.print(person+", ");
		}
		
	%>
	<h4>JSTL 표현 - JSTL라이브러리 추가해야 사용가능</h4>
	<c:set var = "str" value="Hello" />
	<p>str : ${str}</p>
	
	<c:set var="num1" value="1"/>
	<c:set var="num2" value="2"/>
	<c:set var="num3" value="3"/>
	
	<c:if test="${num1 lt num2 }">
		<p>num1이 num2보다 작다</p>
	</c:if>
	<p>if else는 JSTL에선 choose,when,otherwise로 사용</p>
	<c:choose>
		<c:when test="${num1 gt num2 }">
			<p>num1이 num2보다 크다</p>
		</c:when>
		<c:otherwise>
			<p>num1이 num2보다 작다</p>
		</c:otherwise>
	</c:choose>
	<p>if~ else if ~ else 는 choose,when,when,otherwise로 표현</p>
	<c:choose>
		<c:when test="${num1 gt num2 }">
			<p>num1이 num2보다 크다</p>
		</c:when>
		<c:when test="${num2 gt num3 }">
			<p>num1이 num2보다 크다</p>
		</c:when>
		<c:otherwise>
			<p>num3이 가장 크다</p>
		</c:otherwise>		
	</c:choose>
	<p>for문은 foreach으로 사용</p>
	<c:forEach var="i" begin="1" end="5">
		<p>${i}.Hello JSTL!!</p>
	</c:forEach>
	
	
	
	
	
	<c:forEach var="x" begin="2" end="3">
		<c:forEach var="y" begin="1" end="9">
			<p>${x} x ${y } = ${x*y}</p>
		</c:forEach>
	</c:forEach>


</body>
</html>
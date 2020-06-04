<%@page import="sub1.Account"%>
<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2-4</title>
</head>
<body>
	<h4>4.JSP 클래스</h4>
	<%
		Account kb = new Account("국민은행","101-10-00001","김윤신",10000); 
		kb.deposit(40000);
		kb.withdraw(7000);
	%>
	<h4>현재잔액</h4>
	<p>
		은행명: <%= kb.getBank() %></br>
		계좌번호: <%= kb.getId() %></br>
		입금주: <%= kb.getName() %></br>
		현재잔액: <%= kb.getMoney() %></br>
	</p>
	<%
		Account wb = new Account("우리은행","0010-015150-10","김춘춘",10000);
		wb.deposit(10000);
		wb.withdraw(5000);
		wb.show(out);
	%>	
</body>
</html>
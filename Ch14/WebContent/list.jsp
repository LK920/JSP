<%@page import="member.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8"%>
<%
	//DB정보
	String host = "jdbc:mysql://192.168.44.46:3306/krg";
	String user = "krg";
	String pass = "1234";
	
	//1단계 -jdbc 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver");
	
	//2단계 - 데이터베이스 접속
	Connection conn = DriverManager.getConnection(host,user,pass);
	//3단계 - SQL 실행 객체 생성
	Statement stmt = conn.createStatement();
	//4단계 -	SQL 실행
	String sql = "SELECT * FROM `MEMBER` ORDER BY `rdate` ASC";
	ResultSet rs = stmt.executeQuery(sql);
	
	//5단계 - 결과셋 처리(Select일 경우)
	List<MemberBean> memberlist = new ArrayList<>();
	
	while(rs.next()){
		MemberBean mb = new MemberBean();
		
		mb.setUid(rs.getString(1));
		mb.setName(rs.getString(2));
		mb.setHp(rs.getString(3));
		mb.setPos(rs.getString(4));
		mb.setDep(rs.getInt(5));
		mb.setRdate(rs.getString(6));
		
		memberlist.add(mb);
	}
		
	//6단계
	rs.close();
	stmt.close();
	conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<script>
	function onDelete(){
		var result = confirm("정말 삭제하시겠습니까?");
			return result;
	}
	
</script>
</head>
<body>
	<h2>직원목록</h2>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>직급</th>
			<th>부서</th>
			<th>입사일</th>
			<th>기타</th>
		</tr>
		<% 
			for(MemberBean mb : memberlist){
		%>
		<tr>
			<td><%=mb.getUid() %></td>
			<td><%=mb.getName() %></td>
			<td><%=mb.getHp() %></td>
			<td><%=mb.getPos() %></td>
			<td><%=mb.getDep() %></td>
			<td><%=mb.getRdate().substring(0,10) %></td>
			<td>
				<a href="./delete.jsp?uid=<%= mb.getUid() %>" onclick="return onDelete()">삭제</a>
				<a href="./modifyForm.jsp?uid=<%= mb.getUid() %>">수정</a>
			</td>
		</tr>
		<%} %>
	</table>
	
	<a href="./regForm.jsp">직원등록하기</a>

</body>
</html>	
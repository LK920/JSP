<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.output.XmlOutput"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@page import="bean.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DBConfig"%>
<%@ page contentType="text/xml;charset=UTF-8" trimDirectiveWhitespaces="true"   pageEncoding="UTF-8"%>
<%
	//1)DB에서 데이터 가져오기
	Connection conn = DBConfig.getConnection();
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT * FROM `MEMBER`");
	
	List<MemberBean> memberList = new ArrayList<>();
	
	while(rs.next()){
		MemberBean mb = new MemberBean();
		mb.setUid(rs.getString(1));
		mb.setName(rs.getString(2));
		mb.setHp(rs.getString(3));
		mb.setPos(rs.getString(4));
		mb.setDep(rs.getInt(5));
		mb.setRdate(rs.getString(6));
		
		memberList.add(mb);
	}
	rs.close();
	stmt.close();
	conn.close();
	//2)xml 생성 - 편리한xml 동적태그 생성을 위한 Jdom 라이브러리 사용
	Document doc = new Document();
	Element members = new Element("members");
	
	for(MemberBean mb : memberList){
		Element member  = new Element("member");
		Element uid		= new Element("uid");
		Element name	= new Element("name");
		Element hp	 	= new Element("hp");
		Element pos	 	= new Element("pos");
		Element dep		= new Element("dep");
		Element rdate	= new Element("rdate");
		//각각의 태그 설정
		uid.setText(mb.getUid());
		name.setText(mb.getName());
		hp.setText(mb.getHp());
		pos.setText(mb.getPos());
		dep.setText(""+mb.getDep()); // 숫자인dep의 값을 string으로 바꿈 ""
		rdate.setText(mb.getRdate());
		
		member.addContent(uid);
		member.addContent(name);
		member.addContent(hp);
		member.addContent(pos);
		member.addContent(dep);
		member.addContent(rdate);
		
		members.addContent(member);
	}
	//xml문서의 루트 엘레번트로 members 태그 설정
	doc.setRootElement(members);
	//3)xml 출력
	String xml = new XMLOutputter(Format.getPrettyFormat()).outputString(doc);
	out.print(xml);
%>
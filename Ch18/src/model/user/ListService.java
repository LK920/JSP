package model.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.REUtil;

import bean.MemberBean;
import model.CommonService;

public class ListService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//DB정보
		String host ="jdbc:mysql://192.168.50.82:3306/krg";
		String user ="krg";
		String pass ="1234";
		
		Connection conn = null;
		Statement stmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(host, user, pass);
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM `MEMBER`");
			//5단계
			List<MemberBean> members = new ArrayList<>();
			
			while(rs.next()) {
				MemberBean mb = new MemberBean();
				mb.setUid(rs.getString(1));
				mb.setName(rs.getString(2));
				mb.setHp(rs.getString(3));
				mb.setPos(rs.getString(4));
				mb.setDep(rs.getInt(5));
				mb.setRdate(rs.getString(6).substring(2,10));
				
				members.add(mb);
			}
			rs.close();
			stmt.close();
			conn.close();
			//view 에서 출력할 데이터 공유
			req.setAttribute("members", members);
			
		}catch(Exception e) {
			
		}
		
		return "/user/list.jsp";
	}

}

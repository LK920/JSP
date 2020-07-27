package kr.farmstory2.service.user;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.farmstory2.bean.TermsBean;
import kr.farmstory2.config.DBConfig;
import kr.farmstory2.config.SQL;
import kr.farmstory2.controller.CommonService;

public class TermsService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(SQL.SELECT_TERMS);
		
		TermsBean tb = new TermsBean();
		if(rs.next()) {
			tb.setTerms(rs.getString(1));
			tb.setPrivacy(rs.getString(2));
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		req.setAttribute("tb", tb);
		
		return "/user/terms.jsp";
	}

}

package kr.jboard2.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.jboard2.config.DBConfig;
import kr.jboard2.config.SQL;
import kr.jboard2.controller.CommonService;

public class CommentService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String parent 	= req.getParameter("parent");
		String uid 		= req.getParameter("uid");
		String comment 	= req.getParameter("comment");
		String regip 	= req.getRemoteAddr();
		
		
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_COMMENT);
		psmt.setString(1, parent);
		psmt.setString(2, comment);
		psmt.setString(3, uid);
		psmt.setString(4, regip);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		
		return "redirect:/Jboard2/view.do?seq="+parent;
	}

}

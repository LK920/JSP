package kr.farmstory2.service.board;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.farmstory2.controller.CommonService;
import kr.farmstory2.dao.BoardDAO;
import kr.farmstory2.vo.ArticleVO;

public class WriteService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if(req.getMethod().equals("POST")) {
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String cate = req.getParameter("cate") ;
			String uid = req.getParameter("uid"); 
			String file = req.getParameter("file");
			String regip = req.getRemoteAddr();
			//파일 첨부 안하면 null 값이 아니라 빈 문자열이다.
			int hasfile = (file == "") ?  0 : 1 ;
			
			ArticleVO vo = new ArticleVO();
			vo.setCate(cate);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setFile(hasfile);
			vo.setUid(uid);
			vo.setRegip(regip);
			
			BoardDAO dao = BoardDAO.getInstance();
			dao.insertArticle(vo);
			
			return "redirect:/Farmstory2/board/list.do?";
		}else {
			
			String cate =  req.getParameter("cate");
			req.setAttribute("cate", cate);
			
			return "/board/write.jsp";
		}
		
	
		
		
	}

}

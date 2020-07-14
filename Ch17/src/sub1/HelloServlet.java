package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	
	@Override
	public void init() throws ServletException {
		System.out.println("HelloServlet init!!!");
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	}
	
	private void requestProc(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html;charset=utf-8");
		 //일반 출력 객체 out을 사용하지 못하여 새로 만들어준다. printwriter 타입으로
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>HelloServlet</title>");
		out.println("<meta charset='utf-8'/>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Hello Servlet!!!!</h1>");
		out.println("<a href='/Ch17/Welcome'>welcome</a>");
		out.println("<a href='/Ch17/greeting.do'>greeting</a>");
		out.println("</body>");
		out.println("</html>");
		
	}
	
}

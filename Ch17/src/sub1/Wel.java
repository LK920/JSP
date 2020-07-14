package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "wel", urlPatterns = { "/Welcome" })
public class Wel extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	public void init(ServletConfig config) throws ServletException {
		System.out.println("Welcome init!!!");
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestProc(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestProc(request, response);
	}
	
	private void requestProc(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html;charset=utf-8");
		 //일반 출력 객체 out을 사용하지 못하여 새로 만들어준다. printwriter 타입으로
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>WelcomeServlet</title>");
		out.println("<meta charset='utf-8'/>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Welcome Servlet!!!!</h1>");
		out.println("<a href='/Ch17/hello.do'>hello</a>");
		out.println("<a href='/Ch17/greeting.do'>greeting</a>");
		out.println("</body>");
		out.println("</html>");
		
	}

}

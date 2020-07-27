package kr.farmstory2.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import jdk.nashorn.internal.runtime.regexp.joni.Config;


public class MainController extends HttpServlet {
	//톰캣에서 서블릿을 구별하기 위해 필요한 식별 번호
	private static final long serialVersionUID = 1L;
	
	private Map<String, Object> instances = new HashMap<>();
	

	@Override
	public void init(ServletConfig config) throws ServletException {
		//if else를 무한히 확장할 수 없기에 여기서 맵으로 객체들을 처리한다. 키값을 action으로 만들어야한다.
		//키와 클래스 파일은 설정파일로 만들어야한다. -->WEB-INF에 properties 확장자로 만들
		
		//프로퍼티 파일 경로구하기
		ServletContext sc = config.getServletContext();
		String path = sc.getRealPath("/WEB-INF")+"/urlMapping.properties";
		
		Properties prop = new Properties();
		//프로퍼티는 키 문자열, value 문자열로 구성됨
		//스트림 연결
		try {
			//프로퍼티 파일과 스트림 연결
		FileInputStream fis = new FileInputStream(path);
		//입력 스트림으로 프로퍼티 파일 읽어서  prop객체로 키/맵 구조로 저장
		prop.load(fis);
		//입력 스트림 해제
		fis.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		//prop 객체를 가지고 동적 Model 객체를 갖는 Map에 저장
		Iterator iter = prop.keySet().iterator(); 
		//prop의 객체의 키값을 집합으로 만듦
		while(iter.hasNext()) {
			String k = iter.next().toString();
			String v = prop.getProperty(k);
			
			try {
				Class obj = Class.forName(v); //prop의 value
				Object instance = obj.newInstance(); // value 객체로 만듦
				
				instances.put(k, instance);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		requestProc(req,resp);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		requestProc(req,resp);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private void requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String path = req.getContextPath();
		 //rootpath 여기선 Jboard2
		String uri = req.getRequestURI(); 
		 // /Jboard2/*.do
		
		String action = uri.substring(path.length()); 
		// /*.do
		
		//맵에 저장된 객체를 꺼냄
		CommonService instance = (CommonService) instances.get(action);
		String result = instance.requestProc(req, resp);
		
		if(result.startsWith("redirect:")) {
			//리다이렉트
			String redirectURL = result.substring(9);
			resp.sendRedirect(redirectURL);
			
		}else if(result.startsWith("json:")) {
			
			PrintWriter out = resp.getWriter();
			out.print(result.substring(5));
			
		}else {
			//view 포워드 -->> 서블릿 등록 (xml로 이동후 등록 )
			RequestDispatcher dispatcher = req.getRequestDispatcher(result);
			dispatcher.forward(req,resp);
			
		}
	}
}

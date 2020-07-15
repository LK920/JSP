package controller;

import java.io.FileInputStream;
import java.io.IOException;
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
import model.CommonService;
import model.GreetingService;
import model.HelloService;
import model.WelcomeService;

public class MainController extends HttpServlet {
	//��Ĺ���� ������ �����ϱ� ���� �ʿ��� �ĺ� ��ȣ
	private static final long serialVersionUID = 1L;
	
	private Map<String, Object> instances = new HashMap<>();
	

	@Override
	public void init(ServletConfig config) throws ServletException {
		//if else�� ������ Ȯ���� �� ���⿡ ���⼭ ������ ��ü���� ó���Ѵ�. Ű���� action���� �������Ѵ�.
		//Ű�� Ŭ���� ������ �������Ϸ� �������Ѵ�. -->WEB-INF�� properties Ȯ���ڷ� ����
		
		//������Ƽ ���� ��α��ϱ�
		ServletContext sc = config.getServletContext();
		String path = sc.getRealPath("/WEB-INF")+"/urlMapping.properties";
		
		Properties prop = new Properties();
		//������Ƽ�� Ű ���ڿ�, value ���ڿ��� ������
		//��Ʈ�� ����
		try {
			//������Ƽ ���ϰ� ��Ʈ�� ����
		FileInputStream fis = new FileInputStream(path);
		//�Է� ��Ʈ������ ������Ƽ ���� �о  prop��ü�� Ű/�� ������ ����
		prop.load(fis);
		//�Է� ��Ʈ�� ����
		fis.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		//prop ��ü�� ������ ���� Model ��ü�� ���� Map�� ����
		Iterator iter = prop.keySet().iterator(); 
		//prop�� ��ü�� Ű���� �������� ����
		while(iter.hasNext()) {
			String k = iter.next().toString();
			String v = prop.getProperty(k);
			
			try {
				Class obj = Class.forName(v); //prop�� value
				Object instance = obj.newInstance(); // value ��ü�� ����
				
				instances.put(k, instance);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req,resp);
	}
	
	private void requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = req.getContextPath(); //rootpath ���⼱ Ch18
		String uri = req.getRequestURI();  // /Ch18/hello.do
		
		String action = uri.substring(path.length()); // /hello.do
		
		//�ʿ� ����� ��ü�� ����
		CommonService instance = (CommonService) instances.get(action);
		String result = instance.requestProc(req, resp);
		
		if(result.startsWith("redirect:")) {
			//�����̷�Ʈ
			String redirectURL = result.substring(9);
			resp.sendRedirect(redirectURL);
		}else {
			//view ������ -->> ���� ��� (xml�� �̵��� ��� )
			RequestDispatcher dispatcher = req.getRequestDispatcher(result);
			dispatcher.forward(req,resp);
			
		}
	}
}

package sub1;

import javax.servlet.jsp.JspWriter;

public class Account {
	
	private String bank;
	private String name;
	private String id;
	private int    money;

	public Account(String bank, String id, String name, int money) {
		this.bank  = bank;
		this.id    = id;
		this.name  = name;
		this.money = money;
	}
	
	public void deposit(int money) {
		this.money += money;
	}
	public void withdraw(int money) {
		this.money -= money;
	}
	public void show(JspWriter out) throws Exception {
		out.println("<h4>�����ܾ�</h4>");
		out.println("<p>");
		out.println("����� : "+bank+"</br>");
		out.println("���¹�ȣ : "+id+"</br>");
		out.println("�Ա��� : "+name+"</br>");
		out.println("�����ܾ� : "+money+"</br>");
		out.println("</p>");
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}
	
	
	
}

package master.order.model.vo;

import java.util.Date;

public class Order {
	private int order_Num;
	private int user_code;
	private int pro_num;
	private Date order_date;
	
	public Order() {}

	public Order(int order_Num, int user_code, int pro_num, Date order_date) {
		super();
		this.order_Num = order_Num;
		this.user_code = user_code;
		this.pro_num = pro_num;
		this.order_date = order_date;
	}

	public int getOrder_Num() {
		return order_Num;
	}

	public void setOrder_Num(int order_Num) {
		this.order_Num = order_Num;
	}

	public int getUser_code() {
		return user_code;
	}

	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}

	public int getPro_num() {
		return pro_num;
	}

	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	@Override
	public String toString() {
		return "Order [order_Num=" + order_Num + ", user_code=" + user_code + ", pro_num=" + pro_num + ", order_date="
				+ order_date + "]";
	}
	
	
}
	
	
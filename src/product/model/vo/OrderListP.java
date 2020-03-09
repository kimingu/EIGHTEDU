package product.model.vo;

import java.sql.Date;

public class OrderListP {
	private int order_num;
	private int user_code;
	private int pro_num;
	private Date order_date;
	public OrderListP(int order_num, int user_code, int pro_num, Date order_date) {
		super();
		this.order_num = order_num;
		this.user_code = user_code;
		this.pro_num = pro_num;
		this.order_date = order_date;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
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
		return "OrderListP [order_num=" + order_num + ", user_code=" + user_code + ", pro_num=" + pro_num
				+ ", order_date=" + order_date + "]";
	}
	
	
}

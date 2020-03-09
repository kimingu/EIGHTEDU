package user.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class UserOrder implements Serializable{
	private String pro_name;
	private String pro_type;
	private int price;
	private Date order_date;
	public UserOrder(String pro_name, String pro_type, int price, Date order_date) {
		super();
		this.pro_name = pro_name;
		this.pro_type = pro_type;
		this.price = price;
		this.order_date = order_date;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_type() {
		return pro_type;
	}
	public void setPro_type(String pro_type) {
		this.pro_type = pro_type;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	@Override
	public String toString() {
		return "UserOrder [pro_name=" + pro_name + ", pro_type=" + pro_type + ", price=" + price + ", order_date="
				+ order_date + "]";
	}
	
	
	
}

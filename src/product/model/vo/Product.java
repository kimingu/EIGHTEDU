package product.model.vo;

public class Product {
	private int pro_num;
	private String pro_name;
	private String pro_type;
	private int remain;
	private int price;
	public Product(int pro_num, String pro_name, String pro_type, int remain, int price) {
		super();
		this.pro_num = pro_num;
		this.pro_name = pro_name;
		this.pro_type = pro_type;
		this.remain = remain;
		this.price = price;
	}
	public Product(String pro_name, int remain, int price, String pro_type) {
		super();
		this.pro_name = pro_name;
		this.pro_type = pro_type;
		this.remain = remain;
		this.price = price;
	}
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
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
	public int getRemain() {
		return remain;
	}
	public void setRemain(int remain) {
		this.remain = remain;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "product [pro_num=" + pro_num + ", pro_name=" + pro_name + ", pro_type=" + pro_type + ", remain="
				+ remain + ", price=" + price + "]";
	}
	
	
}

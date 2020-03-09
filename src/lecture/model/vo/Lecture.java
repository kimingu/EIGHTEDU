package lecture.model.vo;

public class Lecture implements java.io.Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8122990455941482824L;
	/**
	 * 
	 */

	private int l_code;
	private String l_title;
	private int l_number;
	private int l_price;
	private String l_type;
	private int t_code; // 조인되서 가져오는거  1 , 2, 3 , 4
	private String l_content;
	private String t_name; // 나는 db에 없어요
	private String status;
	
	public Lecture() {
		
	}

	public Lecture(int l_code, String l_title, int l_number, int l_price, String l_type, int t_code, String l_content, String t_name, String status) {
		super();
		this.l_code = l_code;
		this.l_title = l_title;
		this.l_number = l_number;
		this.l_price = l_price;
		this.l_type = l_type;
		this.t_code = t_code;
		this.l_content = l_content;
		this.t_name = t_name;
		this.status = status;
	}
	


	public Lecture(String l_title, int l_number, int l_price, String l_type, String l_content, String t_name) {
		super();
		this.l_title = l_title;
		this.l_number = l_number;
		this.l_price = l_price;
		this.l_type = l_type;
		this.l_content = l_content;
		this.t_name = t_name;
	}
	
	public Lecture(String l_title, int l_number, int l_price, String l_type, String l_content, String t_name, int l_code) {
		super();
		this.l_title = l_title;
		this.l_number = l_number;
		this.l_price = l_price;
		this.l_type = l_type;
		this.l_content = l_content;
		this.t_name = t_name;
		this.l_code = l_code;
	}


	
	

	public Lecture(int l_code, String l_title, int l_number, int l_price, String l_type, String l_content,
			String t_name) {
		super();
		this.l_code = l_code;
		this.l_title = l_title;
		this.l_number = l_number;
		this.l_price = l_price;
		this.l_type = l_type;
		this.l_content = l_content;
		this.t_name = t_name;
	}
	
	


	
	

	public int getL_code() {
		return l_code;
	}

	public void setL_code(int l_code) {
		this.l_code = l_code;
	}

	public String getL_title() {
		return l_title;
	}

	public void setL_title(String l_title) {
		this.l_title = l_title;
	}

	public int getL_number() {
		return l_number;
	}

	public void setL_number(int l_number) {
		this.l_number = l_number;
	}

	public int getL_price() {
		return l_price;
	}

	public void setL_price(int l_price) {
		this.l_price = l_price;
	}

	public String getL_type() {
		return l_type;
	}

	public void setL_type(String l_type) {
		this.l_type = l_type;
	}

	public int getT_code() {
		return t_code;
	}

	public void setT_code(int t_code) {
		this.t_code = t_code;
	}

	public String getL_content() {
		return l_content;
	}

	public void setL_content(String l_content) {
		this.l_content = l_content;
	}
	
	

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Lecture [l_code=" + l_code + ", l_title=" + l_title + ", l_number=" + l_number + ", l_price=" + l_price
				+ ", l_type=" + l_type + ", t_code=" + t_code + ", l_content=" + l_content + ", t_name=" + t_name
				+ ", status=" + status + "]";
	}




	
	
	

}

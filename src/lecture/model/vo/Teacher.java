package lecture.model.vo;

public class Teacher implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int t_code;
	private String t_name;
	private String t_phone;
	private String t_address;
	
	
	public Teacher() {
		
	}


	public Teacher(int t_code, String t_name, String t_phone, String t_address) {
		super();
		this.t_code = t_code;
		this.t_name = t_name;
		this.t_phone = t_phone;
		this.t_address = t_address;
	}


	public int getT_code() {
		return t_code;
	}


	public void setT_code(int t_code) {
		this.t_code = t_code;
	}


	public String getT_name() {
		return t_name;
	}


	public void setT_name(String t_name) {
		this.t_name = t_name;
	}


	public String getT_phone() {
		return t_phone;
	}


	public void setT_phone(String t_phone) {
		this.t_phone = t_phone;
	}


	public String getT_address() {
		return t_address;
	}


	public void setT_address(String t_address) {
		this.t_address = t_address;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "Teacher [t_code=" + t_code + ", t_name=" + t_name + ", t_phone=" + t_phone + ", t_address=" + t_address
				+ "]";
	}
	
	
	
	
	
	
	

}

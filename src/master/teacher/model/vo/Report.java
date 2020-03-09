package master.teacher.model.vo;

import java.io.Serializable;

public class Report implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3647970928772016430L;
	private String r_code;
	private String r_content;
	private String r_number;
	private String user_code;
	private String b_code;

	public Report() {}

	public Report(String r_code, String r_content, String r_number, String user_code, String b_code) {
		super();
		this.r_code = r_code;
		this.r_content = r_content;
		this.r_number = r_number;
		this.user_code = user_code;
		this.b_code = b_code;
	}

	public String getR_code() {
		return r_code;
	}

	public void setR_code(String r_code) {
		this.r_code = r_code;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getR_number() {
		return r_number;
	}

	public void setR_number(String r_number) {
		this.r_number = r_number;
	}

	public String getUser_code() {
		return user_code;
	}

	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}

	public String getB_code() {
		return b_code;
	}

	public void setB_code(String b_code) {
		this.b_code = b_code;
	}

	@Override
	public String toString() {
		return "Report [r_code=" + r_code + ", r_content=" + r_content + ", r_number=" + r_number + ", user_code="
				+ user_code + ", b_code=" + b_code + "]";
	}

	

	
}

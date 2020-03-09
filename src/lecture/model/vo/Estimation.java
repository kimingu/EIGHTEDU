package lecture.model.vo;

import java.util.Date;

public class Estimation implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6914592909189156716L;
	private int e_code;
	private String e_title;
	private String e_content;
	private String e_grade;
	private int t_code;
	private String t_name;
	private int user_code;
	private String user_name;
	private Date e_date;
	private String status;
	
	public Estimation() {}

	public Estimation(int e_code, String e_title, String e_content, String e_grade, int t_code, String t_name,
			int user_code, String user_name, Date e_date, String status) {
		super();
		this.e_code = e_code;
		this.e_title = e_title;
		this.e_content = e_content;
		this.e_grade = e_grade;
		this.t_code = t_code;
		this.t_name = t_name;
		this.user_code = user_code;
		this.user_name = user_name;
		this.e_date = e_date;
		this.status = status;
	}

	public int getE_code() {
		return e_code;
	}

	public void setE_code(int e_code) {
		this.e_code = e_code;
	}

	public String getE_title() {
		return e_title;
	}

	public void setE_title(String e_title) {
		this.e_title = e_title;
	}

	public String getE_content() {
		return e_content;
	}

	public void setE_content(String e_content) {
		this.e_content = e_content;
	}

	public String getE_grade() {
		return e_grade;
	}

	public void setE_grade(String e_grade) {
		this.e_grade = e_grade;
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

	public int getUser_code() {
		return user_code;
	}

	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public Date getE_date() {
		return e_date;
	}

	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Estimation [e_code=" + e_code + ", e_title=" + e_title + ", e_content=" + e_content + ", e_grade="
				+ e_grade + ", t_code=" + t_code + ", t_name=" + t_name + ", user_code=" + user_code + ", user_name="
				+ user_name + ", e_date=" + e_date + ", status=" + status + "]";
	}
	
	

}

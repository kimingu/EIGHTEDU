package user.model.vo;

import java.sql.Date;

public class Teacher {
	private int b_code;
	private int user_code;
	private int m_code;
	private Date create_date;
	private int b_count;
	private String b_title;
	private String b_content;
	private String status;
	private String b_number;
	public Teacher(int b_code, int user_code, int m_code, Date create_date, int b_count, String b_title,
			String b_content, String status, String b_number) {
		super();
		this.b_code = b_code;
		this.user_code = user_code;
		this.m_code = m_code;
		this.create_date = create_date;
		this.b_count = b_count;
		this.b_title = b_title;
		this.b_content = b_content;
		this.status = status;
		this.b_number = b_number;
	}
	public int getB_code() {
		return b_code;
	}
	public void setB_code(int b_code) {
		this.b_code = b_code;
	}
	public int getUser_code() {
		return user_code;
	}
	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}
	public int getM_code() {
		return m_code;
	}
	public void setM_code(int m_code) {
		this.m_code = m_code;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public int getB_count() {
		return b_count;
	}
	public void setB_count(int b_count) {
		this.b_count = b_count;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getB_number() {
		return b_number;
	}
	public void setB_number(String b_number) {
		this.b_number = b_number;
	}
	@Override
	public String toString() {
		return "Teacher [b_code=" + b_code + ", user_code=" + user_code + ", m_code=" + m_code + ", create_date="
				+ create_date + ", b_count=" + b_count + ", b_title=" + b_title + ", b_content=" + b_content
				+ ", status=" + status + ", b_number=" + b_number + "]";
	}
	
	
}

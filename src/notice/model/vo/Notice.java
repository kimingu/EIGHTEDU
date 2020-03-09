package notice.model.vo;

import java.sql.Date;

public class Notice implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4467655374696851005L;
	private int n_code;
	private int user_code;
	private int m_code;
	private Date create_date;
	private int n_count;
	private String n_title;
	private String n_content;
	private String status;
	private String n_name;
	private String m_name;
	private String aliass;
	
	public Notice() {}

	public Notice(int n_code, int user_code, int m_code, Date create_date, int n_count, String n_title,
			String n_content, String status, String n_name, String m_name, String aliass) {
		super();
		this.n_code = n_code;
		this.user_code = user_code;
		this.m_code = m_code;
		this.create_date = create_date;
		this.n_count = n_count;
		this.n_title = n_title;
		this.n_content = n_content;
		this.status = status;
		this.n_name = n_name;
		this.m_name = m_name;
		this.aliass = aliass;
	}

	public Notice(int m_code, String aliass,String n_title, String n_content, String n_name) {
		super();
		this.m_code = m_code;
		this.aliass = aliass;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_name = n_name; 
	}

	public int getN_code() {
		return n_code;
	}

	public void setN_code(int n_code) {
		this.n_code = n_code;
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

	public int getN_count() {
		return n_count;
	}

	public void setN_count(int n_count) {
		this.n_count = n_count;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getN_name() {
		return n_name;
	}

	public void setN_name(String n_name) {
		this.n_name = n_name;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getAliass() {
		return aliass;
	}

	public void setAliass(String aliass) {
		this.aliass = aliass;
	}

	@Override
	public String toString() {
		return "Notice [n_code=" + n_code + ", user_code=" + user_code + ", m_code=" + m_code + ", create_date="
				+ create_date + ", n_count=" + n_count + ", n_title=" + n_title + ", n_content=" + n_content
				+ ", status=" + status + ", n_name=" + n_name + ", m_name=" + m_name + ", aliass=" + aliass + "]";
	}
	
	
	
	
}

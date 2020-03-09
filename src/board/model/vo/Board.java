package board.model.vo;

import java.sql.Date;

public class Board implements java.io.Serializable{
	
	private static final long serialVersionUID = 1815510838847173518L;
	private int b_code; // 게시판 번호
	private int user_code; // 유저 번호
	private int m_code; //말머리 번호(잡담=101...)
	private Date create_date; // 생성 날짜 
	private int b_count; // 조회수 
	private String b_title; // 제목 
	private String b_content; // 내용
	private String status; // 삭제 여부 
	private String b_name; // 카테고리(영어 일본어 중국어...)
	private String m_name; // 조인해서 가져온 말머리 이름 (잡담,질문)  
	private String aliass; // 유저 닉네임
	
	
	
	public Board() {}





	public Board(int b_code, int user_code, int m_code, Date create_date, int b_count, String b_title, String b_content,
			String status, String b_name, String m_name, String aliass) {
		super();
		this.b_code = b_code;
		this.user_code = user_code;
		this.m_code = m_code;
		this.create_date = create_date;
		this.b_count = b_count;
		this.b_title = b_title;
		this.b_content = b_content;
		this.status = status;
		this.b_name = b_name;
		this.m_name = m_name;
		this.aliass = aliass;
	}





	public Board(int m_code, String b_title, String b_content, String b_name, String aliass) {
		super();
		this.m_code = m_code;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_name = b_name;
		this.aliass = aliass;
	}





	public String getAliass() {
		return aliass;
	}
	
	public void setAliass(String aliass) {
		this.aliass = aliass;
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



	public String getB_name() {
		return b_name;
	}



	public void setB_name(String b_name) {
		this.b_name = b_name;
	}



	public String getM_name() {
		return m_name;
	}



	public void setM_name(String m_name) {
		this.m_name = m_name;
	}



	public Board(int m_code, String b_title, String b_content) {
		super();
		this.m_code = m_code;
		this.b_title = b_title;
		this.b_content = b_content;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public String toString() {
		return "Board [b_code=" + b_code + ", user_code=" + user_code + ", m_code=" + m_code + ", create_date="
				+ create_date + ", b_count=" + b_count + ", b_title=" + b_title + ", b_content=" + b_content
				+ ", status=" + status + ", b_name=" + b_name + ", m_name=" + m_name + ", aliass=" + aliass + "]";
	}



}

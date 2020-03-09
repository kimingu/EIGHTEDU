package board.model.vo;

import java.sql.Date;

public class BoardComment implements java.io.Serializable{

	private static final long serialVersionUID = -2478161140176740326L;
	private int c_code; // 댓글 번호
	private int b_code;
	private String c_content;
	private Date create_date;
	private String status;
	private int user_code;
	private String aliass;
	
	public BoardComment() {}

	

	public BoardComment(int c_code, String c_content, Date create_date, String aliass) {
		super();
		this.c_code = c_code;
		this.c_content = c_content;
		this.create_date = create_date;
		this.aliass = aliass;
	}

	public BoardComment(String c_content, Date create_date, String aliass) {
		super();
		this.c_content = c_content;
		this.create_date = create_date;
		this.aliass = aliass;
	}

	public BoardComment(int c_code, int b_code, String c_content, Date create_date, String aliass) {
		super();
		this.c_code = c_code;
		this.b_code = b_code;
		this.c_content = c_content;
		this.create_date = create_date;
		this.aliass = aliass;
	}

	public BoardComment(int c_code, int b_code, String c_content, Date create_date, String status, int user_code, String aliass) {
		super();
		this.c_code = c_code;
		this.b_code = b_code;
		this.c_content = c_content;
		this.create_date = create_date;
		this.status = status;
		this.user_code = user_code;
		this.aliass = aliass;
	}

	public BoardComment(int c_code, int b_code, String c_content, Date create_date, String status, String aliass) {
		super();
		this.c_code = c_code;
		this.b_code = b_code;
		this.c_content = c_content;
		this.create_date = create_date;
		this.status = status;
		this.aliass = aliass;
	}

	public BoardComment(int c_code, int b_code, String c_content, Date create_date, String aliass, int user_code) {
		super();
		this.c_code = c_code;
		this.b_code = b_code;
		this.c_content = c_content;
		this.create_date = create_date;
		this.aliass = aliass;
		this.user_code = user_code;
	}



	public int getC_code() {
		return c_code;
	}

	public void setC_code(int c_code) {
		this.c_code = c_code;
	}

	public int getB_code() {
		return b_code;
	}

	public void setB_code(int b_code) {
		this.b_code = b_code;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getUser_code() {
		return user_code;
	}

	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}

	public String getAliass() {
		return aliass;
	}

	public void setAliass(String aliass) {
		this.aliass = aliass;
	}

	@Override
	public String toString() {
		return "BoardComment [c_code=" + c_code + ", b_code=" + b_code + ", c_content=" + c_content + ", create_date="
				+ create_date + ", status=" + status + ", user_code=" + user_code + ", aliass=" + aliass + "]";
	}


	
	

}

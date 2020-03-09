package lecture.model.vo;

public class Video {
	private int v_code;
	private String v_link;
	private int c_code;
	private String status;
	private String c_title;
	
	public Video() {
		
	}

	public Video(int v_code, String v_link, int c_code, String status, String c_title) {
		super();
		this.v_code = v_code;
		this.v_link = v_link;
		this.c_code = c_code;
		this.status = status;
		this.c_title = c_title;
	}

	public int getV_code() {
		return v_code;
	}

	public void setV_code(int v_code) {
		this.v_code = v_code;
	}

	public String getV_link() {
		return v_link;
	}

	public void setV_link(String v_link) {
		this.v_link = v_link;
	}

	public int getC_code() {
		return c_code;
	}

	public void setC_code(int c_code) {
		this.c_code = c_code;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getC_title() {
		return c_title;
	}

	public void setC_title(String c_title) {
		this.c_title = c_title;
	}

	@Override
	public String toString() {
		return "Video [v_code=" + v_code + ", v_link=" + v_link + ", c_code=" + c_code + ", status=" + status
				+ ", c_title=" + c_title + "]";
	}

	
	
	

}

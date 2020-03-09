package master.Video.model.vo;

public class Video {
	
	private int v_code;
	private String v_link;
	private int c_code;
	private String status;
	private String l_title;
	private String c_title;
	private String c_time;
	
	public Video() {
		
	}

	public Video(int v_code, String v_link, int c_code, String status, String c_title, String c_time, String l_title) {
		super();
		this.v_code = v_code;
		this.v_link = v_link;
		this.c_code = c_code;
		this.status = status;
		this.c_title = c_title;
		this.c_time =  c_time;
		this.l_title = l_title;
	}
	
	public Video(int v_code, String v_link, int c_code, String status, String c_title, String c_time) {
		super();
		this.v_code = v_code;
		this.v_link = v_link;
		this.c_code = c_code;
		this.status = status;
		this.c_title = c_title;
		this.c_time =  c_time;

	}
	
	public Video(int v_code, String v_link, int c_code, String status, String c_title) {
		super();
		this.v_code = v_code;
		this.v_link = v_link;
		this.c_code = c_code;
		this.status = status;
		this.c_title = c_title;
	}
	
	public Video(String v_link, String c_title) {
		super();
		this.v_link = v_link;
		this.c_title = c_title;
	}
	
	public Video(String v_link, String c_title, int v_code) {
		super();
		this.v_link = v_link;
		this.c_title = c_title;
		this.v_code = v_code;
	}
	
	public Video(String v_link, String c_title, int v_code, String l_title) {
		super();
		this.v_link = v_link;
		this.c_title = c_title;
		this.v_code = v_code;
		this.l_title = l_title;
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

	public String getL_title() {
		return l_title;
	}

	public void setL_title(String l_title) {
		this.l_title = l_title;
	}

	public String getC_title() {
		return c_title;
	}

	public void setC_title(String c_title) {
		this.c_title = c_title;
	}
	
	

	public String getC_time() {
		return c_time;
	}

	public void setC_time(String c_time) {
		this.c_time = c_time;
	}

	@Override
	public String toString() {
		return "Video [v_code=" + v_code + ", v_link=" + v_link + ", c_code=" + c_code + ", status=" + status
				+ ", l_title=" + l_title + ", c_title=" + c_title + ", c_time=" + c_time + "]";
	}


	
	
	
	
	
	
}

package master.Class.model.vo;

public class Classs implements java.io.Serializable{
	/**
	 * 
	 */
	
	private int c_code;
	private String c_title;
	private String c_time;
	private int c_next;
	private int l_code;
	private int t_code;
	private String status;
	private String t_name;
	private String l_title;
	private String userName;
	
	public Classs() {
		
	}

	public Classs(int c_code, String c_title, String c_time, int c_next, int l_code, int t_code, String status,
			String t_name, String l_title) {
		super();
		this.c_code = c_code;
		this.c_title = c_title;
		this.c_time = c_time;
		this.c_next = c_next;
		this.l_code = l_code;
		this.t_code = t_code;
		this.status = status;
		this.t_name = t_name;
		this.l_title = l_title;

	}
	
	
	

	public Classs(String c_title, String c_time, int c_next, String l_title, String t_name)
	{
		super();
		this.c_title = c_title;
		this.c_time = c_time;
		this.c_next = c_next;
		this.l_title = l_title;
		this.t_name = t_name;
	}

	
	
	
	

	public Classs(String c_title, String c_time, int c_next, String l_title, String t_name, int c_code) {
		super();
		this.c_title = c_title;
		this.c_time = c_time;
		this.c_next = c_next;
		this.l_title = l_title;
		this.t_name = t_name;
		this.c_code = c_code;
	}

	public int getC_code() {
		return c_code;
	}

	public void setC_code(int c_code) {
		this.c_code = c_code;
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

	public int getC_next() {
		return c_next;
	}

	public void setC_next(int c_next) {
		this.c_next = c_next;
	}

	public int getL_code() {
		return l_code;
	}

	public void setL_code(int l_code) {
		this.l_code = l_code;
	}

	public int getT_code() {
		return t_code;
	}

	public void setT_code(int t_code) {
		this.t_code = t_code;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	public String getL_title() {
		return l_title;
	}

	public void setL_title(String l_title) {
		this.l_title = l_title;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "Classs [c_code=" + c_code + ", c_title=" + c_title + ", c_time=" + c_time + ", c_next=" + c_next
				+ ", l_code=" + l_code + ", t_code=" + t_code + ", status=" + status + ", t_name=" + t_name
				+ ", l_title=" + l_title + ", userName=" + userName + "]";
	}
	
	
	

	

	
	
	
	

}

package lecture.model.vo;

public class Class implements java.io.Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5000911620846352933L;
	private int c_code;
	private String c_title;
	private String c_time;
	private int c_next;
	private int t_code;
	private String t_name;
	
	public Class() {}

	public Class(int c_code, String c_title, String c_time, int c_next, int t_code, String t_name) {
		super();
		this.c_code = c_code;
		this.c_title = c_title;
		this.c_time = c_time;
		this.c_next = c_next;
		this.t_code = t_code;
		this.t_name = t_name;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Class [c_code=" + c_code + ", c_title=" + c_title + ", c_time=" + c_time + ", c_next=" + c_next
				+ ", t_code=" + t_code + ", t_name=" + t_name + "]";
	}
	
	
	
	
	

}

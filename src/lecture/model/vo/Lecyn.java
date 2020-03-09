package lecture.model.vo;

public class Lecyn {
	private int user_code;
	private int c_code;
	private String leclevel;
	public Lecyn(int user_code, int c_code, String leclevel) {
		super();
		this.user_code = user_code;
		this.c_code = c_code;
		this.leclevel = leclevel;
	}
	public int getUser_code() {
		return user_code;
	}
	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}
	public int getC_code() {
		return c_code;
	}
	public void setC_code(int c_code) {
		this.c_code = c_code;
	}
	public String getLeclevel() {
		return leclevel;
	}
	public void setLeclevel(String leclevel) {
		this.leclevel = leclevel;
	}
	
	
}

package master.teacher.model.vo;

public class Teacher implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1094839725086779472L;
	private int T_CODE;
	private String T_NAME;
	private String T_PHONE;
	private String T_ADDRESS;
	
	public Teacher() {}
	
	public Teacher(int t_CODE, String t_NAME, String t_PHONE, String t_ADDRESS) {
		super();
		T_CODE = t_CODE;
		T_NAME = t_NAME;
		T_PHONE = t_PHONE;
		T_ADDRESS = t_ADDRESS;
	}

	public int getT_CODE() {
		return T_CODE;
	}

	public void setT_CODE(int t_CODE) {
		T_CODE = t_CODE;
	}

	public String getT_NAME() {
		return T_NAME;
	}

	public void setT_NAME(String t_NAME) {
		T_NAME = t_NAME;
	}

	public String getT_PHONE() {
		return T_PHONE;
	}

	public void setT_PHONE(String t_PHONE) {
		T_PHONE = t_PHONE;
	}

	public String getT_ADDRESS() {
		return T_ADDRESS;
	}

	public void setT_ADDRESS(String t_ADDRESS) {
		T_ADDRESS = t_ADDRESS;
	}

	@Override
	public String toString() {
		return "Teacher [T_CODE=" + T_CODE + ", T_NAME=" + T_NAME + ", T_PHONE=" + T_PHONE + ", T_ADDRESS=" + T_ADDRESS
				+ "]";
	}
	
	
}

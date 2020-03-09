package user.model.vo;

public class LecList {
	private String lecName;
	private String lecType;
	private String teacherName;
	private String lecLevel;
	public LecList(String lecName, String lecType, String teacherName, String lecLevel) {
		super();
		this.lecName = lecName;
		this.lecType = lecType;
		this.teacherName = teacherName;
		this.lecLevel = lecLevel;
	}
	public String getLecName() {
		return lecName;
	}
	public void setLecName(String lecName) {
		this.lecName = lecName;
	}
	public String getLecType() {
		return lecType;
	}
	public void setLecType(String lecType) {
		this.lecType = lecType;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getLecLevel() {
		return lecLevel;
	}
	public void setLecLevel(String lecLevel) {
		this.lecLevel = lecLevel;
	}
	@Override
	public String toString() {
		return "LecList [lecName=" + lecName + ", lecType=" + lecType + ", teacherName=" + teacherName + ", lecLevel="
				+ lecLevel + "]";
	}
	
	
}

package master.user.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class User  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6252227011916370854L;
	private int user_Code;
	private String user_Name;
	private String user_Id;
	private String user_Pwd;
	private String email;
	private String phone;
	private String gender;
	private String user_No;
	private String address;
	private Date enroll_date;
	private int point;
	private String grade;
	private String status;
	private String aliass;

	public User() {
	}

	public User(int user_Code, String user_Name, String user_Id) {
		super();
		this.user_Code = user_Code;
		this.user_Name = user_Name;
		this.user_Id = user_Id;
	}

	public User(int user_Code, String user_No, String user_Id, String user_Name, String email, String phone, String address,
			Date enroll_date) {
		super();
		this.user_Code = user_Code;
		this.user_No = user_No;
		this.user_Id = user_Id;
		this.user_Name = user_Name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.enroll_date = enroll_date;
	}

	public User(String user_Name, String user_Id, String user_Pwd, String gender, String user_No, String aliass) {
		super();
		this.user_Name = user_Name;
		this.user_Id = user_Id;
		this.user_Pwd = user_Pwd;
		this.gender = gender;
		this.user_No = user_No;
		this.aliass = aliass;
	}

	public User(String user_Name, String user_Id, String user_Pwd, String email, String phone, String gender,
			String user_No, String address, String aliass) {
		super();
		this.user_Name = user_Name;
		this.user_Id = user_Id;
		this.user_Pwd = user_Pwd;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.user_No = user_No;
		this.address = address;
		this.aliass = aliass;
	}

	public int getUser_Code() {
		return user_Code;
	}

	public void setUser_Code(int user_Code) {
		this.user_Code = user_Code;
	}

	public String getUser_Name() {
		return user_Name;
	}

	public void setUser_Name(String user_Name) {
		this.user_Name = user_Name;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public String getUser_Pwd() {
		return user_Pwd;
	}

	public void setUser_Pwd(String user_Pwd) {
		this.user_Pwd = user_Pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getUser_No() {
		return user_No;
	}

	public void setUserNo(String user_No) {
		this.user_No = user_No;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAliass() {
		return aliass;
	}

	public void setAliass(String aliass) {
		this.aliass = aliass;
	}

	@Override
	public String toString() {
		return "User [userCode=" + user_Code + ", userName=" + user_Name + ", userId=" + user_Id + ", userPwd="
				+ user_Pwd + ", email=" + email + ", phone=" + phone + ", gender=" + gender + ", userNo=" + user_No
				+ ", address=" + address + ", enroll_date=" + enroll_date + ", point=" + point + ", grade=" + grade
				+ ", status=" + status + ", aliass=" + aliass + "]";
	}

}
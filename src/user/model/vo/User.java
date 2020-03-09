package user.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -7803476454748306337L;
	private int userCode;
	private String userName;
	private String userId;
	private String userPwd;
	private String email;
	private String phone;
	private String gender;
	private String userNo;
	private String address;
	private Date enroll_date;
	private int point;
	private String grade;
	private String status;
	private String aliass;
	public User(int userCode, String userName, String userId, String userPwd, String email, String phone, String gender,
			String userNo, String address, Date enroll_date, int point, String grade, String status, String aliass) {
		super();
		this.userCode = userCode;
		this.userName = userName;
		this.userId = userId;
		this.userPwd = userPwd;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.userNo = userNo;
		this.address = address;
		this.enroll_date = enroll_date;
		this.point = point;
		this.grade = grade;
		this.status = status;
		this.aliass = aliass;
	}
	public User(String userName, String userId, String userPwd, String gender, String userNo,
			String aliass) {
		super();
		this.userName = userName;
		this.userId = userId;
		this.userPwd = userPwd;
		this.gender = gender;
		this.userNo = userNo;
		this.aliass = aliass;
	}
	
	public User(String userName, String userId, String userPwd, String email, String phone, String gender,
			String userNo, String address, String aliass) {
		super();
		this.userName = userName;
		this.userId = userId;
		this.userPwd = userPwd;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.userNo = userNo;
		this.address = address;
		this.aliass = aliass;
	}
	public User(int userCode, String userName, String userId, String userPwd, String email, String phone, String gender,
			String userNo, String address, String aliass) {
		super();
		this.userCode = userCode;
		this.userName = userName;
		this.userId = userId;
		this.userPwd = userPwd;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.userNo = userNo;
		this.address = address;
		this.aliass = aliass;
	}
	
	public int getUserCode() {
		return userCode;
	}
	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
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
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
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
		return "User [userCode=" + userCode + ", userName=" + userName + ", userId=" + userId + ", userPwd=" + userPwd
				+ ", email=" + email + ", phone=" + phone + ", gender=" + gender + ", userNo=" + userNo + ", address="
				+ address + ", enroll_date=" + enroll_date + ", point=" + point + ", grade=" + grade + ", status="
				+ status + ", aliass=" + aliass + "]";
	}
	
	
}

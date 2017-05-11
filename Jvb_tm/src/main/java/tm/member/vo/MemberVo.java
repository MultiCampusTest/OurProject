package tm.member.vo;

import java.util.Date;

public class MemberVo {
	private int idx;
	private String userid;
	private String pwd;
	private String firstName;
	private String lastName;
	private String birthday;
	private String country;
	private String gender;
	private String introduce;
	private Date joinDate;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	@Override
	public String toString() {
		return "MemberVo [idx=" + idx + ", userid=" + userid + ", pwd=" + pwd + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", birthday=" + birthday + ", country=" + country + ", gender=" + gender
				+ ", introduce=" + introduce + ", joinDate=" + joinDate + "]";
	}
	
}
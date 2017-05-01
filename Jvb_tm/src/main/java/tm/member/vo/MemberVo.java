package tm.member.vo;

import java.util.Date;

public class MemberVo {
	private int u_idx;
	private String userid;
	private String pwd;
	private String f_name;
	private String l_name;
	private String email;
	private String birthday;
	private String country;
	private String gender;
	private String introduce;
	private Date u_date;
	 
	public int getU_idx() {
		return u_idx;
	}
	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
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
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getL_name() {
		return l_name;
	}
	public void setL_name(String l_name) {
		this.l_name = l_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public Date getU_date() {
		return u_date;
	}
	public void setU_date(Date u_date) {
		this.u_date = u_date;
	}
	
	@Override
	public String toString() {
		return "MemberVo [u_idx=" + u_idx + ", userid=" + userid + ", pwd=" + pwd + ", f_name=" + f_name + ", l_name="
				+ l_name + ", email=" + email + ", birthday=" + birthday + ", country=" + country + ", gender=" + gender
				+ ", introduce=" + introduce + ", u_date=" + u_date + "]";
	}
	
}

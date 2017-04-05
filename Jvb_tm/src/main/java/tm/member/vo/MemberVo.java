package tm.member.vo;

import java.util.Date;

public class MemberVo {
	public int u_idx;
	public String userid;
	public String pwd;
	public String name;
	public String email;
	public Date birthday;
	public String nationality;
	public String gender;
	public String introduce;
	public Date u_date;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
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
		return "MemberVo [u_idx=" + u_idx + ", userid=" + userid + ", pwd=" + pwd + ", name=" + name + ", email="
				+ email + ", birthday=" + birthday + ", nationality=" + nationality + ", gender=" + gender
				+ ", introduce=" + introduce + ", u_date=" + u_date + "]";
	}
	
	
	
}

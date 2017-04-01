package java.vo;

import java.util.Date;

public class BoardVo {
	
	private int b_idx;
	private String b_code;
	private String b_loc_category;
	private String b_sub_category;
	private String b_title;
	private Date b_start_date;
	private Date b_end_date;
	private String userid;
	private Date b_date;
	
	public int getB_idx() {
		return b_idx;
	}
	
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	
	public String getB_code() {
		return b_code;
	}
	
	public void setB_code(String b_code) {
		this.b_code = b_code;
	}
	
	public String getB_loc_category() {
		return b_loc_category;
	}
	
	public void setB_loc_category(String b_loc_category) {
		this.b_loc_category = b_loc_category;
	}
	
	public String getB_sub_category() {
		return b_sub_category;
	}
	
	public void setB_sub_category(String b_sub_category) {
		this.b_sub_category = b_sub_category;
	}
	
	public String getB_title() {
		return b_title;
	}
	
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	
	public Date getB_start_date() {
		return b_start_date;
	}
	
	public void setB_start_date(Date b_start_date) {
		this.b_start_date = b_start_date;
	}
	
	public Date getB_end_date() {
		return b_end_date;
	}
	
	public void setB_end_date(Date b_end_date) {
		this.b_end_date = b_end_date;
	}
	
	public String getUserid() {
		return userid;
	}
	
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public Date getB_date() {
		return b_date;
	}
	
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	@Override
	public String toString() {
		return "BoardVo [b_idx=" + b_idx + ", b_code=" + b_code + ", b_loc_category=" + b_loc_category
				+ ", b_sub_category=" + b_sub_category + ", b_title=" + b_title + ", b_start_date=" + b_start_date
				+ ", b_end_date=" + b_end_date + ", userid=" + userid + ", b_date=" + b_date + "]";
	}
	
}

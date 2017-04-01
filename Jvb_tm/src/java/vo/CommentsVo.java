package java.vo;

public class CommentsVo {

	private int cm_idx;
	private int b_idx;
	private String userid;
	private String cm_contents;
	private String cm_date;
	private int parent_code;
	private int group_seq;
	private int group_lv;
	public int getCm_idx() {
		return cm_idx;
	}
	public void setCm_idx(int cm_idx) {
		this.cm_idx = cm_idx;
	}
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getCm_contents() {
		return cm_contents;
	}
	public void setCm_contents(String cm_contents) {
		this.cm_contents = cm_contents;
	}
	public String getCm_date() {
		return cm_date;
	}
	public void setCm_date(String cm_date) {
		this.cm_date = cm_date;
	}
	public int getParent_code() {
		return parent_code;
	}
	public void setParent_code(int parent_code) {
		this.parent_code = parent_code;
	}
	public int getGroup_seq() {
		return group_seq;
	}
	public void setGroup_seq(int group_seq) {
		this.group_seq = group_seq;
	}
	public int getGroup_lv() {
		return group_lv;
	}
	public void setGroup_lv(int group_lv) {
		this.group_lv = group_lv;
	}
	
	
	@Override
	public String toString() {
		return "CommentsVo [cm_idx=" + cm_idx + ", b_idx=" + b_idx + ", userid=" + userid + ", cm_contents="
				+ cm_contents + ", cm_date=" + cm_date + ", parent_code=" + parent_code + ", group_seq=" + group_seq
				+ ", group_lv=" + group_lv + "]";
	}
	
	
}

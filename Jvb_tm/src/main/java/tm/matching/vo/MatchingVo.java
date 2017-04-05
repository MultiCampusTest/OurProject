package tm.matching.vo;

public class MatchingVo {

	private int mch_idx;
	private String mch_t_userid;
	private String mch_g_userid;
	private int b_idx;
	private int mch_code;
	private String mch_date;
	public int getMch_idx() {
		return mch_idx;
	}
	public void setMch_idx(int mch_idx) {
		this.mch_idx = mch_idx;
	}
	public String getMch_t_userid() {
		return mch_t_userid;
	}
	public void setMch_t_userid(String mch_t_userid) {
		this.mch_t_userid = mch_t_userid;
	}
	public String getMch_g_userid() {
		return mch_g_userid;
	}
	public void setMch_g_userid(String mch_g_userid) {
		this.mch_g_userid = mch_g_userid;
	}
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public int getMch_code() {
		return mch_code;
	}
	public void setMch_code(int mch_code) {
		this.mch_code = mch_code;
	}
	public String getMch_date() {
		return mch_date;
	}
	public void setMch_date(String mch_date) {
		this.mch_date = mch_date;
	}
	 
	@Override
	public String toString() {
		return "MatchingVo [mch_idx=" + mch_idx + ", mch_t_userid=" + mch_t_userid + ", mch_g_userid=" + mch_g_userid
				+ ", b_idx=" + b_idx + ", mch_code=" + mch_code + ", mch_date=" + mch_date + "]";
	}
	
	
	
}

package tm.board.vo;

public class CommentsVo {

	private String cm_idx;
	private String cm_writer;
	private String cm_date;
	private String b_idx;
	private String cm_content;
	private String cm_parent;
	private String cm_depth;
	private int cm_order;
	private String cm_delete;
	
	public String getCm_delete() {
		return cm_delete;
	}
	public void setCm_delete(String cm_delete) {
		this.cm_delete = cm_delete;
	}
	public String getCm_idx() {
		return cm_idx;
	}
	public void setCm_idx(String cm_idx) {
		this.cm_idx = cm_idx;
	}
	public String getCm_writer() {
		return cm_writer;
	}
	public void setCm_writer(String cm_writer) {
		this.cm_writer = cm_writer;
	}
	public String getCm_date() {
		return cm_date;
	}
	public void setCm_date(String cm_date) {
		this.cm_date = cm_date;
	}
	public String getB_idx() {
		return b_idx;
	}
	public void setB_idx(String b_idx) {
		this.b_idx = b_idx;
	}
	public String getCm_content() {
		return cm_content;
	}
	public void setCm_content(String cm_content) {
		this.cm_content = cm_content;
	}
	public String getCm_parent() {
		return cm_parent;
	}
	public void setCm_parent(String cm_parent) {
		this.cm_parent = cm_parent;
	}
	public String getCm_depth() {
		return cm_depth;
	}
	public void setCm_depth(String depth) {
		this.cm_depth = depth;
	}
	public int getCm_order() {
		return cm_order;
	}
	public void setCm_order(int cm_order) {
		this.cm_order = cm_order;
	}
	
}

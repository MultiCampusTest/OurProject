package java.vo;

public class MessageVo {

	private int msg_idx;
	private String msg_send_userid;
	private String msg_receive_userid;
	private String msg_contents;
	private String msg_date;
	public int getMsg_idx() {
		return msg_idx;
	}
	public void setMsg_idx(int msg_idx) {
		this.msg_idx = msg_idx;
	}
	public String getMsg_send_userid() {
		return msg_send_userid;
	}
	public void setMsg_send_userid(String msg_send_userid) {
		this.msg_send_userid = msg_send_userid;
	}
	public String getMsg_receive_userid() {
		return msg_receive_userid;
	}
	public void setMsg_receive_userid(String msg_receive_userid) {
		this.msg_receive_userid = msg_receive_userid;
	}
	public String getMsg_contents() {
		return msg_contents;
	}
	public void setMsg_contents(String msg_contents) {
		this.msg_contents = msg_contents;
	}
	public String getMsg_date() {
		return msg_date;
	}
	public void setMsg_date(String msg_date) {
		this.msg_date = msg_date;
	}
	 
	@Override
	public String toString() {
		return "MessageVo [msg_idx=" + msg_idx + ", msg_send_userid=" + msg_send_userid + ", msg_receive_userid="
				+ msg_receive_userid + ", msg_contents=" + msg_contents + ", msg_date=" + msg_date + "]";
	}
	
	
	
	
}

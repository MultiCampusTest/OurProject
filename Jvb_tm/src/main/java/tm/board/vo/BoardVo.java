 package tm.board.vo;

import java.util.Date;
import java.util.List;

public class BoardVo {
	
	private int boardIdx;
	private String code;
	private String locCategory;
	private String subCategory;
	private String title;
	private String startDate;
	private String endDate;
	private String userid;
	private Date writeDate;
	private int readCount;
	
	private String strLatLng;
	private String startLatLng;
	private String endLatLng;
	
	
	
	public String getStrLatLng() {
		return strLatLng;
	}
	public void setStrLatLng(String strLatLng) {
		this.strLatLng = strLatLng;
	}
	public String getStartLatLng() {
		return startLatLng;
	}
	public void setStartLatLng(String startLatLng) {
		this.startLatLng = startLatLng;
	}
	public String getEndLatLng() {
		return endLatLng;
	}
	public void setEndLatLng(String endLatLng) {
		this.endLatLng = endLatLng;
	}
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getLocCategory() {
		return locCategory;
	}
	public void setLocCategory(String locCategory) {
		this.locCategory = locCategory;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	
	@Override
	public String toString() {
		return "BoardVo [boardIdx=" + boardIdx + ", code=" + code + ", locCategory=" + locCategory + ", subCategory="
				+ subCategory + ", title=" + title + ", startDate=" + startDate + ", endDate=" + endDate + ", userid="
				+ userid + ", writeDate=" + writeDate + ", readCount=" + readCount + "]";
	}
}

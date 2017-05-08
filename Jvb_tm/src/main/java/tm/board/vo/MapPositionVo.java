package tm.board.vo;

public class MapPositionVo {

   private int mapIdx;
   private int boardIdx;
   private int markerSeq;
   private String latLng;
   private String contentsSeq;
   
public int getMapIdx() {
	return mapIdx;
}
public void setMapIdx(int mapIdx) {
	this.mapIdx = mapIdx;
}
public int getBoardIdx() {
	return boardIdx;
}
public void setBoardIdx(int boardIdx) {
	this.boardIdx = boardIdx;
}
public int getMarkerSeq() {
	return markerSeq;
}
public void setMarkerSeq(int markerSeq) {
	this.markerSeq = markerSeq;
}
public String getLatLng() {
	return latLng;
}
public void setLatLng(String latLng) {
	this.latLng = latLng;
}
public String getContentsSeq() {
	return contentsSeq;
}
public void setContentsSeq(String contentsSeq) {
	this.contentsSeq = contentsSeq;
}
   
  

}
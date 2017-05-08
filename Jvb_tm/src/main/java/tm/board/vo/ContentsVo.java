package tm.board.vo;

public class ContentsVo {
   
	private int contentsIdx;
	private int boardIdx;
	private int contentsSeq;
	private String contents;
	public int getContentsIdx() {
		return contentsIdx;
	}
	public void setContentsIdx(int contentsIdx) {
		this.contentsIdx = contentsIdx;
	}
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public int getContentsSeq() {
		return contentsSeq;
	}
	public void setContentsSeq(int contentsSeq) {
		this.contentsSeq = contentsSeq;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	@Override
	public String toString() {
		return "ContentsVo [contentsIdx=" + contentsIdx + ", boardIdx=" + boardIdx + ", contentsSeq=" + contentsSeq
				+ ", contents=" + contents + "]";
	}
  

}

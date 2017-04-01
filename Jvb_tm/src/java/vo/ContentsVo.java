package java.vo;

public class ContentsVo {

   private int ct_idx;
   private int b_idx;
   private int ct_num;
   private String ct_contents;
   public int getCt_idx() {
      return ct_idx;
   }
   public void setCt_idx(int ct_idx) {
      this.ct_idx = ct_idx;
   }
   public int getB_idx() {
      return b_idx;
   }
   public void setB_idx(int b_idx) {
      this.b_idx = b_idx;
   }
   public int getCt_num() {
      return ct_num;
   }
   public void setCt_num(int ct_num) {
      this.ct_num = ct_num;
   }
   public String getCt_contents() {
      return ct_contents;
   }
   public void setCt_contents(String ct_contents) {
      this.ct_contents = ct_contents;
   }
   @Override
   public String toString() {
      return "ContentsVo [ct_idx=" + ct_idx + ", b_idx=" + b_idx
            + ", ct_num=" + ct_num + ", ct_contents=" + ct_contents + "]";
   }

}

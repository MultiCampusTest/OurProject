package tm.image.vo;

public class ImageVo {

   private int img_idx;
   private String img_phy_name;
   private String img_ori_name;
   private String img_code;
   private String img_path;
   public int getImg_idx() {
      return img_idx;
   }
   public void setImg_idx(int img_idx) {
      this.img_idx = img_idx;
   }
   public String getImg_phy_name() {
      return img_phy_name;
   }
   public void setImg_phy_name(String img_phy_name) {
      this.img_phy_name = img_phy_name;
   }
   public String getImg_ori_name() {
      return img_ori_name;
   }
   public void setImg_ori_name(String img_ori_name) {
      this.img_ori_name = img_ori_name;
   }
   public String getImg_code() { 
	  return img_code;
   }
   public void setImg_code(String img_code) {
	  this.img_code = img_code;
   }
   public String getImg_path() {
      return img_path;
   }
   public void setImg_path(String img_path) {
      this.img_path = img_path;
   }
   @Override
   public String toString() {
      return "ImageVo [img_idx=" + img_idx + ", img_phy_name=" + img_phy_name
            + ", img_ori_name=" + img_ori_name + ", img_code=" + img_code
            + ", img_path=" + img_path + "]";
   }
}
   


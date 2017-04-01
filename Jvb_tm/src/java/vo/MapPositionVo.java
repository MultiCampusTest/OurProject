package java.vo;

public class MapPositionVo {

   private int map_idx;
   private int b_idx;
   private int map_marker;
   private String map_lat_position;
   private String map_lon_position;
   public int getMap_idx() {
      return map_idx;
   }
   public void setMap_idx(int map_idx) {
      this.map_idx = map_idx;
   }
   public int getB_idx() {
      return b_idx;
   }
   public void setB_idx(int b_idx) {
      this.b_idx = b_idx;
   }
   public int getMap_marker() {
      return map_marker;
   }
   public void setMap_marker(int map_marker) {
      this.map_marker = map_marker;
   }
   public String getMap_lat_position() {
      return map_lat_position;
   }
   public void setMap_lat_position(String map_lat_position) {
      this.map_lat_position = map_lat_position;
   }
   public String getMap_lon_position() {
      return map_lon_position;
   }
   public void setMap_lon_position(String map_lon_position) {
      this.map_lon_position = map_lon_position;
   }
   @Override
   public String toString() {
      return "MapPositionVo [map_idx=" + map_idx + ", b_idx=" + b_idx
            + ", map_marker=" + map_marker + ", map_lat_position="
            + map_lat_position + ", map_lon_position=" + map_lon_position
            + "]";
   }

}
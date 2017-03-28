package dao;

import java.util.HashMap;
import java.util.List;

public interface IImageDao {
	
	public int insertImage(HashMap<String, Object> params);
//	public int updateImage(Image image);
	public int deleteImage(int img_idx);
	public List<HashMap<String, Object>> selectByCode(String code);

}

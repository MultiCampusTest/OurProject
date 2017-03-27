package dao;

public interface IImageDao {
	
	public int insertImage(Image image);
//	public int updateImage(Image image);
	public int deleteImage(int img_idx);
	public List<Image> selectByCode(String code);

}

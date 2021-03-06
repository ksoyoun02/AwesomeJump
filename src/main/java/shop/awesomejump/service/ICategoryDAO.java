package shop.awesomejump.service;

import java.util.List;

import shop.awesomejump.domain.CategoryDTO;

public interface ICategoryDAO {

	public List<CategoryDTO> category() throws Exception;

	public List<CategoryDTO> categoryAllList(String cateCode) throws Exception;

	// 주영 / 카테고리 계층형 출력
	public List<CategoryDTO> categoryAllProduct() throws Exception;
	
	// 주영 / 빵부스러기
	public List<CategoryDTO> categoryBrunch(String cateCode) throws Exception;
	
}

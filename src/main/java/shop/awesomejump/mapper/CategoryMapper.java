package shop.awesomejump.mapper;

import java.util.List;

import shop.awesomejump.domain.CategoryDTO;

public interface CategoryMapper {

	// 태인 / 상품 등록 카테고리 출력
	public List<CategoryDTO> category() throws Exception;

	public List<CategoryDTO> categoryAllList(String cateCode) throws Exception;

	// 주영 / 카테고리 계층형 출력
	public List<CategoryDTO> categoryAllProduct() throws Exception;

	// 주영 / 빵부스러기
	public List<CategoryDTO> categoryBrunch(String cateCode) throws Exception;
	
}

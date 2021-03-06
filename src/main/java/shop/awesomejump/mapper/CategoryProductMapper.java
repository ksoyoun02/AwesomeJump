package shop.awesomejump.mapper;

import java.util.List;
import java.util.Map;

import shop.awesomejump.domain.ProductDTO;

public interface CategoryProductMapper {

	// 주영 / (회원) 상품 전체 출력 + 관심상품여부(using mem_no)
	public List<ProductDTO> categoryAndProductWithInterest(Map<String, Object> map) throws Exception;
	
	// 주영 / (비회원) 상품 전체 출력
	public List<ProductDTO> categoryAndProduct() throws Exception;
	
	// 주영 / 대분류에 해당하는 상품 전체 출력
	public List<ProductDTO> categoryMainProduct(Map<String, Object> map) throws Exception;

	// 주영 / 중분류에 해당하는 상품 전체 출력
	public List<ProductDTO> categoryMidProduct(Map<String, Object> map) throws Exception;

	// 주영 / 소분류에 해당하는 상품 전체 출력
	public List<ProductDTO> categorySubProduct(Map<String, Object> map) throws Exception;
	
	// 주영 / 소분류에 해당하는 상품 전체 출력
	public List<ProductDTO> getMemCategoryImageList() throws Exception;
	
	
	// 주영/ 상품검색
	public List<ProductDTO> searchProduct(Map<String, Object> map) throws Exception;

	
	
	
	

}

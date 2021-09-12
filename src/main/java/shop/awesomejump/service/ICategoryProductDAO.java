package shop.awesomejump.service;

import java.util.List;
import java.util.Map;

import shop.awesomejump.domain.ProImageDTO;
import shop.awesomejump.domain.ProductDTO;

public interface ICategoryProductDAO {


	// 주영 / (로그인 회원) 상품 전체 출력 + 관심상품여부(using mem_no)
	public List<ProductDTO> categoryAndProductWithInterest(int mem_no, int sort_option) throws Exception;
	
	// 주영 / 대분류에 해당하는 상품 전체 출력
	public List<ProductDTO> categoryMainProduct(int category_main, int mem_no, int sort_option) throws Exception;

	// 주영 / 중분류에 해당하는 상품 전체 출력
	public List<ProductDTO> categoryMidProduct(int category_mid, int mem_no, int sort_option) throws Exception;

	// 주영 / 소분류에 해당하는 상품 전체 출력
	public List<ProductDTO> categorySubProduct(int category_sub, int mem_no, int sort_option) throws Exception;
	
	// 주영 / 소분류에 해당하는 상품 전체 출력
	public List<ProductDTO> getMemCategoryImageList() throws Exception;
	
	// 주영/ 상품검색
	public List<ProductDTO> searchProduct(String keyword, int mem_no, int sort_option) throws Exception;
}

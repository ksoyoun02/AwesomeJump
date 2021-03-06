package shop.awesomejump.service;

import java.util.List;

import shop.awesomejump.domain.ProductDTO;
import shop.awesomejump.domain.ProductOptionDTO;

public interface IOptionDAO {

	// 상품 옵션 등록
	public int insertOption(ProductOptionDTO optionDto);
	
	// 상품 수정 전 옵션 삭제
	public int deleteOption(int product_no) throws Exception;

	// 상품 상세 정보 옵션 출력
	public List<ProductOptionDTO> listOption(int product_no) throws Exception;
	
	// 상품 수정 옵션 변경
	public int modifyOption(ProductOptionDTO optionDto) throws Exception;

	
	// 주영 / 상품에 해당한 옵션 
	public List<ProductDTO> productOption(int product_no) throws Exception;
}

package shop.awesomejump.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shop.awesomejump.domain.ProductDTO;
import shop.awesomejump.domain.ProductOptionDTO;
import shop.awesomejump.mapper.OptionMapper;
import shop.awesomejump.service.IOptionDAO;

@Repository
public class OptionDAOImpl implements IOptionDAO {

	@Autowired
	private OptionMapper optionMapper;

	// 상품 옵션 등록
	@Override
	public int insertOption(ProductOptionDTO optionDto) {
		System.out.println("insertOption optionDto ==> " + optionDto);
		int result = optionMapper.insertOption(optionDto);
		System.out.println("insertOption result ==> " + result);
		return result;
	}

	// 상품 상세 정보 옵션 출력
	@Override
	public List<ProductOptionDTO> listOption(int product_no) throws Exception {
		return optionMapper.listOption(product_no);
	}

	// 상품 수정 전 옵션 삭제
	@Override
	public int deleteOption(int product_no) throws Exception {
		return optionMapper.deleteOption(product_no);
		
	}
	
	// 상품 수정 옵션 변경
	public int modifyOption(ProductOptionDTO optionDto) throws Exception {
		return optionMapper.modifyOption(optionDto);
	}
	
	// 주영 / 상품에 해당한 옵션 
	public List<ProductDTO> productOption(int product_no) throws Exception{
		return optionMapper.productOption(product_no);
	}

	
}

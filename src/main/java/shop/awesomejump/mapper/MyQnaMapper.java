package shop.awesomejump.mapper;

import java.util.List;

import shop.awesomejump.domain.ProductQnaDTO;
import shop.awesomejump.domain.QnaDTO;

public interface MyQnaMapper {

	public List<QnaDTO> selectQnaList(int mem_no);
	
	public List<ProductQnaDTO> selectProductQnaList(int mem_no);
}

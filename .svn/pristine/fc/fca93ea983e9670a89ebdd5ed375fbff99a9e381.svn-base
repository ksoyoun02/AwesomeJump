package shop.awesomejump.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import shop.awesomejump.domain.ProductQnaDTO;
import shop.awesomejump.domain.QnaDTO;
import shop.awesomejump.mapper.MyQnaMapper;
import shop.awesomejump.service.IMyQnaDAO;

@Service
@RequiredArgsConstructor
public class MyQnaDAOImpl implements IMyQnaDAO {

	private final MyQnaMapper myQnaMapper;
	
	@Override
	public List<QnaDTO> selectQnaList(int mem_no) {
		return myQnaMapper.selectQnaList(mem_no);
	}

	@Override
	public List<ProductQnaDTO> selectProductQnaList(int mem_no) {
		return myQnaMapper.selectProductQnaList(mem_no);
	}
	
}
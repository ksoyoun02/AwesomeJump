package shop.awesomejump.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import shop.awesomejump.domain.MyReviewVO;
import shop.awesomejump.mapper.MyReviewMapper;
import shop.awesomejump.service.IMyReviewDAO;

@Service
@RequiredArgsConstructor
public class MyReviewDAOImpl implements IMyReviewDAO {
	
	private final MyReviewMapper myReviewMapper;

	@Override
	public List<MyReviewVO> selectMyReviewList(int mem_no) {
		return myReviewMapper.selectMyReviewList(mem_no);
	}
	
}
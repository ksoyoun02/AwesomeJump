package shop.awesomejump.service;

import java.util.List;

import shop.awesomejump.domain.MyReviewVO;

public interface IMyReviewDAO {
	
	public List<MyReviewVO> selectMyReviewList(int mem_no);
}

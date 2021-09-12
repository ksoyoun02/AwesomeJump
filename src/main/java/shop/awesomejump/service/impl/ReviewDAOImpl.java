package shop.awesomejump.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import shop.awesomejump.domain.ReviewDTO;
import shop.awesomejump.domain.ReviewImageDTO;
import shop.awesomejump.mapper.ReviewMapper;
import shop.awesomejump.service.IReviewDAO;

@Service
@RequiredArgsConstructor
public class ReviewDAOImpl implements IReviewDAO {

	private final ReviewMapper reviewMapper;
	
	@Override
	public boolean insertReview(ReviewDTO review) {
		return reviewMapper.insertReview(review) == 1;
	}

	@Override
	public boolean insertReviewImage(ReviewImageDTO reviewImage) {
		return reviewMapper.insertReviewImage(reviewImage) == 1;
	}
	
	@Override
	public List<ReviewDTO> getReviewList(int product_no) {
		return reviewMapper.selectReviewList(product_no);
	}

}
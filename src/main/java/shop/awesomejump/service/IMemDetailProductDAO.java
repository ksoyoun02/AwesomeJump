package shop.awesomejump.service;

import java.util.List;
import java.util.Map;

import shop.awesomejump.domain.CartDTO;
import shop.awesomejump.domain.ProImageDTO;
import shop.awesomejump.domain.ProInterestDTO;
import shop.awesomejump.domain.ProductDTO;
import shop.awesomejump.domain.ReviewDTO;
import shop.awesomejump.domain.ReviewImageDTO;

public interface IMemDetailProductDAO {


	// 주영 / 회원 상품 상세 정보
	public ProductDTO memDetail(int product_no) throws Exception;
	
	// 주영 / 회원 상품 상세 정보 이미지
	public List<ProImageDTO> getMemImageList(int product_no) throws Exception;
	
		
	// 주영 / 상품담기 버튼 클릭시 회원 장바구니에 등록
	public int insertProductCart(CartDTO cart) throws Exception;
	
	// 주영 / 관심상품 1개 등록
	public int interestInsertMember(ProInterestDTO interest) throws Exception;
	
	// 주영 / 동일한 관심상품 1개 삭제
	public int interestDeleteMember(ProInterestDTO interest) throws Exception;
	
	// 주영 / 해당 상품에 관한 별점 / 리뷰 수 
	public double avgReviewGrade(int product_no) throws Exception;
	
	// 주영 / 해당 상품 리뷰수
	public int cntReviewGrade(int product_no) throws Exception;	
	
	// 주영/ 상품이 등록된 총 갯수
	public int selectAllCountProduct() throws Exception;
	
	// 주영/ 여러 상품 이미지 출력
	public List<ProImageDTO> getAllMemImageList(List<Integer> product_no_list) throws Exception;
	
	// 주영 / 추천 상품
	public List<ProductDTO> selectRecommendProduct(int category_mid) throws Exception;
	
	// 주영 / 리뷰에대한 사진
	public List<ReviewImageDTO> getProductAllReviewImageList(List<Integer> review_no_list) throws Exception;
	
	public boolean optionExistsOnProduct(int product_no, int product_option_no) throws Exception;
	
}

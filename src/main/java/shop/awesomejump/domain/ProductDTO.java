package shop.awesomejump.domain;

import java.util.List;

import lombok.Data;

@Data
public class ProductDTO {
	
	// 상품 고유 번호
	private int product_no;
	
	private int product_grade;
	// 상품 재고
	private int product_stock;
	
	/** 별점 평균 */
	private double review_grade;
	
	/** 리뷰 건수 */
	private int review_cnt;
	
	// 관심 상품 여부
	private String product_interest_yn;
		
	// 포인트
	private int product_point;
	
	// 상품명
	private String product_name;
	
	// 리뷰
	private  List<ReviewDTO> reviewList;
	
	// 상품 가격
	private int product_price;
	
	// 상품 설명
	private String product_content;
	
	// 상품 재질
	private String product_texture;
	
	// 상품 썸네일
	private String product_thumb_img;
	
	// 대분류
	private String category_main;
	
	// 중분류
	private String category_mid;
	
	// 소분류
	private String category_sub;
	
	
//	// 상품 색상
	private String product_option_color;
//	
//	// 상품 크기
	private String product_option_size;
//	
//	// 상품 옵션 번호
	private int product_option_no;
	
	
	// 상품 이미지
	private List<ProImageDTO> imageList;
	
}

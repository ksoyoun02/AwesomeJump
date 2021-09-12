package shop.awesomejump.mapper;

import java.util.List;

import shop.awesomejump.domain.ProImageDTO;
import shop.awesomejump.domain.ProductDTO;
import shop.awesomejump.domain.ProductOptionDTO;

public interface ProductMapper {

	// 상품 등록
	public int insertProduct(ProductDTO pDto) throws Exception;
	
	// 상품 목록
	public List<ProductDTO> listProduct() throws Exception;
	
	// 상품 검색 목록
	public List<ProductDTO> serchProduct(String product_name) throws Exception;
	
	// 상품 상세 정보
	public ProductDTO detailProduct(int product_no) throws Exception;
	
	// 상품 수정
	public int modifyProduct(ProductDTO pDto) throws Exception;
	
	// 상품 이미지 등록
	public int insertProductImage(ProImageDTO piDto) throws Exception;
	
	// 상품 이미지 출력
	public List<ProImageDTO> getImageList(int product_no) throws Exception;
	
	// 수정할 상품 이미지 전체 삭제
	public void deleteImageAll(int product_no) throws Exception;
	
	// 주영 / 상품에 해당하는 옵션 출력
	public List<ProductOptionDTO> selectProductOption(int product_no) throws Exception;
	
	//지민 결제페이지 사용
	public ProductDTO getProduct(int product_no);

    // 상품 리뷰 점수 업데이트
	public int updateProductReview(int product_no);

	// 소연 메인페이지 사용
	public List<ProductDTO> selBestPro();
	
}

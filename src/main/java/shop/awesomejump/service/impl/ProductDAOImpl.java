package shop.awesomejump.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shop.awesomejump.domain.ProImageDTO;
import shop.awesomejump.domain.ProductDTO;
import shop.awesomejump.domain.ProductOptionDTO;
import shop.awesomejump.mapper.ProductMapper;
import shop.awesomejump.service.IProductDAO;

@Repository
public class ProductDAOImpl implements IProductDAO {

	@Autowired
	private ProductMapper productMapper;

//	private static final Logger logger = LoggerFactory.getLogger(ProductDAOImpl.class);
	
	// 상품 등록
	@Override
	public void insertProduct(ProductDTO pDto) throws Exception {
		
		productMapper.insertProduct(pDto);

		if (pDto.getImageList() == null || pDto.getImageList().size() <= 0) {
			return;
		}

		pDto.getImageList().forEach(attach -> {
			
			attach.setProduct_no(pDto.getProduct_no());
			try {
				productMapper.insertProductImage(attach);
			} catch (Exception e) {
				e.printStackTrace();
			}

		});

	}

	// 상품 목록
	@Override
	public List<ProductDTO> listProduct() throws Exception {
		return productMapper.listProduct();
	}
	
	// 상품 검색 목록
	@Override
	public List<ProductDTO> serchProduct(String product_name) throws Exception {
		return productMapper.serchProduct(product_name);
	}

	// 상품 상세 정보
	@Override
	public ProductDTO detailProduct(int product_no) throws Exception {
		return productMapper.detailProduct(product_no);
	}

	// 상품 수정
	@Override
	public int modifyProduct(ProductDTO pDto) throws Exception {
		
		if (pDto.getImageList() == null || pDto.getImageList().size() <= 0) {
			return 0;
		}

		pDto.getImageList().forEach(attach -> {
			
			attach.setProduct_no(pDto.getProduct_no());
			try {
				productMapper.insertProductImage(attach);
			} catch (Exception e) {
				e.printStackTrace();
			}

		});
		
		
		return productMapper.modifyProduct(pDto);
	}

	// 상품 이미지 등록
	@Override
	public int insertProductImage(ProImageDTO piDto) throws Exception {
		return productMapper.insertProductImage(piDto);
	}
	
	// 상품 이미지 출력
	@Override
	public List<ProImageDTO> getImageList(int product_no) throws Exception {
		return productMapper.getImageList(product_no);
	}
	
	// 수정할 상품 이미지 전체 삭제
	@Override
	public void deleteImageAll(int product_no) throws Exception {
		productMapper.deleteImageAll(product_no);
	}

	@Override
	// 주영 / 상품에 해당하는 옵션 출력
	public List<ProductOptionDTO> selectProductOption(int product_no) throws Exception {
		return productMapper.selectProductOption(product_no);
	}
	
	//지민 결제페이지에서 사용
	@Override
	public ProductDTO getProduct(int product_no) {
		return productMapper.getProduct(product_no);
	}

	// 상품 리뷰 점수 업데이트
	@Override
	public int updateProductReview(int product_no) {
		return productMapper.updateProductReview(product_no);
	}
	
	@Override
	public List<ProductDTO> bestPro() {
		
		return productMapper.selBestPro();
	}
}

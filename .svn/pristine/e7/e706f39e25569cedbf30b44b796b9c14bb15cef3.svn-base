package shop.awesomejump.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import shop.awesomejump.domain.ProductDTO;
import shop.awesomejump.mapper.CategoryProductMapper;
import shop.awesomejump.service.ICategoryProductDAO;

@Repository
public class CategoryProductDAOImpl implements ICategoryProductDAO {

	@Inject
	private CategoryProductMapper categoryproductMapper;


	// 주영 / 상품 전체 출력 + 관심상품여부(using mem_no)
	@Override
	public List<ProductDTO> categoryAndProductWithInterest(int mem_no, int sort_option) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		map.put("mem_no", mem_no);
		map.put("sort_option", sort_option);
		
		List<ProductDTO> list = categoryproductMapper.categoryAndProductWithInterest(map);
		System.out.println("categoryAndProduct    "+list);
		
		return list;
	}
	
	// 주영 / 대분류에 해당하는 상품 전체 출력
	@Override
	public List<ProductDTO> categoryMainProduct(int category_main, int mem_no, int sort_option) throws Exception{
		Map<String, Object> map = new HashMap<>();
		
		map.put("category_main", category_main);
		map.put("mem_no", mem_no);
		map.put("sort_option", sort_option);
		
		return categoryproductMapper.categoryMainProduct(map);
	}

	// 주영 / 중분류에 해당하는 상품 전체 출력
	@Override
	public List<ProductDTO> categoryMidProduct(int category_mid, int mem_no, int sort_option) throws Exception{
		Map<String, Object> map = new HashMap<>();
		
		map.put("category_mid", category_mid);
		map.put("mem_no", mem_no);
		map.put("sort_option", sort_option);
		
		return categoryproductMapper.categoryMidProduct(map);
	}

	// 주영 / 소분류에 해당하는 상품 전체 출력
	@Override
	public List<ProductDTO> categorySubProduct(int category_sub, int mem_no, int sort_option) throws Exception{
		Map<String, Object> map = new HashMap<>();
		
		map.put("category_sub", category_sub);
		map.put("mem_no", mem_no);
		map.put("sort_option", sort_option);
		
		return categoryproductMapper.categorySubProduct(map);
	}

	
	// 주영 / 소분류에 해당하는 상품 전체 출력
	@Override
	public List<ProductDTO> getMemCategoryImageList() throws Exception{
		return categoryproductMapper.getMemCategoryImageList();
	}

	
	// 주영/ 상품검색
	@Override
	public List<ProductDTO> searchProduct(String keyword, int mem_no, int sort_option) throws Exception{
		Map<String, Object> map = new HashMap<>();
		
		map.put("keyword", keyword);
		map.put("mem_no", mem_no);
		map.put("sort_option", sort_option);
		
		return categoryproductMapper.searchProduct(map);
	}
}
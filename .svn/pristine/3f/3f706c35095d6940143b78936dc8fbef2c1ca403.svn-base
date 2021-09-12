package shop.awesomejump.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import shop.awesomejump.domain.CategoryDTO;
import shop.awesomejump.mapper.CategoryMapper;
import shop.awesomejump.service.ICategoryDAO;

@Repository
public class CategoryDAOImpl implements ICategoryDAO {

	
	@Inject
	private CategoryMapper categoryMapper;
	
	@Override
	public List<CategoryDTO> category() throws Exception {
		return categoryMapper.category();
	}

	@Override
	public List<CategoryDTO> categoryAllList(String cateCode) throws Exception {
		return categoryMapper.categoryAllList(cateCode);
	}

	
	// 주영 / 카테고리 계층형 출력
	@Override
	public List<CategoryDTO> categoryAllProduct() throws Exception {

		return categoryMapper.categoryAllProduct();
	}
	
	// 주영 / 빵부스러기
	@Override
	public List<CategoryDTO> categoryBrunch(String cateCode) throws Exception{
		return categoryMapper.categoryBrunch(cateCode);	
	}

}
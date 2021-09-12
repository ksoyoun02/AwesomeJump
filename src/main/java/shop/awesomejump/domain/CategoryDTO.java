package shop.awesomejump.domain;

import lombok.Data;

@Data
public class CategoryDTO {
	
	
	// 카테고리 이름
	private String cateName;
	
	// 카테고리 코드
	private String cateCode;
	
	// 카테고리 상위 참조 코드
	private String cateCodeRef;
	
	// 카테고리 level
	private int level;
	
}

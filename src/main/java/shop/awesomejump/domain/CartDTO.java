package shop.awesomejump.domain;

import lombok.Data;

@Data
public class CartDTO {

	private int cart_no; 	//장바구니 번호
	private int mem_no;		//회원번호
	private int product_no;	//상품고유번호
	private int cart_amount;	//상품수량
	private int product_option_no;	//상품옵션번호

	
}

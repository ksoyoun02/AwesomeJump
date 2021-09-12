package shop.awesomejump.service;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import shop.awesomejump.domain.CartDTO;
import shop.awesomejump.domain.CartOptionDTO;
import shop.awesomejump.domain.ListCartDTO;
import shop.awesomejump.domain.TotalCartDTO;

public interface ICartDAO {
		//장바구니 추가
		public int insertCart(CartDTO cart);

		//장바구니 목록
		public List<ListCartDTO> listCart(int mem_no);
		
		//상품 옵션목록
		public List<CartOptionDTO> cartOption(int product_no);
		
		//장바구니 상품총액, 총 포인트
		
		public TotalCartDTO totalCart(int mem_no);
		
		public TotalCartDTO totalCartByCartList(@Param("mem_no") int mem_no, @Param("cart_no") int[] cart_no);
		
		//장바구니 비우기
		public void deleteAllCart(int mem_no);
		
		//장바구니 상품 갯수
		public int countCart(CartDTO cart);
		
		//장바구니 개별 삭제
		public int deleteCart(int cart_no);
		
		//장바구니 수량수정
		public void modifyAmount(CartDTO cDto);
		
		//장바구니 옵션 수정
		public void modifyOption(CartDTO cDto);
		
		//장바구니에 동일한 상품이 존재하면 수정
		public int updateCart(CartDTO cart);
		
		public CartDTO getCart(int cart_no);
		
		public CartOptionDTO getOption(int product_option_no);
		
		public boolean removeCart(int cart_no);
}

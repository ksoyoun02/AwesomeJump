package shop.awesomejump.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.awesomejump.domain.CartDTO;
import shop.awesomejump.domain.CartOptionDTO;
import shop.awesomejump.domain.ListCartDTO;
import shop.awesomejump.domain.TotalCartDTO;
import shop.awesomejump.mapper.CartMapper;
import shop.awesomejump.service.ICartDAO;
@Service
public class CartDAOImpl implements ICartDAO{
	
	@Autowired
	private CartMapper cartMapper;
	
	//장바구니 추가
	@Override
	public int insertCart(CartDTO cart) {
		int result = 0;
		result = cartMapper.insertCart(cart);
		return result;
		
	}
	
	//장바구니 목록
	@Override
	public List<ListCartDTO> listCart(int mem_no) {
		
		return cartMapper.listCart(mem_no);
	}
	//상품 목록
	@Override
	public List<CartOptionDTO> cartOption(int product_no) {

		return cartMapper.cartOption(product_no);
	}
	
	//장바구니 상품 총액, 총 포인트
	@Override
	public TotalCartDTO totalCart(int mem_no) {
		return cartMapper.totalCart(mem_no);
	}
	
	@Override
	public TotalCartDTO totalCartByCartList(int mem_no, int[] cart_no) {
		return cartMapper.totalCartByCartList(mem_no, cart_no);
	}

	@Override
	public void deleteAllCart(int mem_no) {
		cartMapper.deleteAllCart(mem_no);
		
	}
	@Override
	public int countCart(CartDTO cart) {
		
		return cartMapper.countCart(cart);
	}
	
	@Override
	public int deleteCart(int cart_no) {
		
		return cartMapper.deleteCart(cart_no);
	}
	
	@Override
	public void modifyAmount(CartDTO cDto) {
		cartMapper.modifyAmount(cDto);
	}

	@Override
	public int updateCart(CartDTO cart) {
		return cartMapper.updateCart(cart);
	}

	@Override
	public void modifyOption(CartDTO cDto) {
		cartMapper.modifyOption(cDto);
		
	}

	@Override
	public CartDTO getCart(int cart_no) {
		return cartMapper.getCart(cart_no);
	}

	@Override
	public CartOptionDTO getOption(int product_option_no) {
		return cartMapper.getOption(product_option_no);
	}

	@Override
	public boolean removeCart(int cart_no) {
		return cartMapper.deleteCart(cart_no) == 1;
	}
	
	


}

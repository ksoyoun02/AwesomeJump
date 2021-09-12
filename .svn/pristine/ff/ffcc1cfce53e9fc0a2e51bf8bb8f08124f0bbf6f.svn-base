package shop.awesomejump.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import shop.awesomejump.domain.CartDTO;
import shop.awesomejump.domain.CartOptionDTO;
import shop.awesomejump.domain.ListCartDTO;
import shop.awesomejump.domain.TotalCartDTO;

public interface CartMapper {
	
	public int insertCart(CartDTO cart);
	
	public List<ListCartDTO> listCart(int mem_no);

	public List<CartOptionDTO> cartOption(int product_no);
	
	public TotalCartDTO totalCart(int mem_no);
	
	public TotalCartDTO totalCartByCartList(@Param("mem_no") int mem_no, @Param("cart_no") int[] cart_no);
	
	public void deleteAllCart(int mem_no);
	
	public int countCart(CartDTO cart);
	
	public int deleteCart(int cart_no);
	
	public void modifyAmount(CartDTO cDto);
	
	public void modifyOption(CartDTO cDto);
	
	public int updateCart(CartDTO cart);
	
	public CartDTO getCart(int cart_no);
	
	public CartOptionDTO getOption(int product_option_no);
}

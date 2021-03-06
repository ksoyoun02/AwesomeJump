package shop.awesomejump.controller;



import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import shop.awesomejump.domain.CartDTO;
import shop.awesomejump.domain.CartOptionDTO;
import shop.awesomejump.domain.ListCartDTO;
import shop.awesomejump.domain.MemberDTO;
import shop.awesomejump.domain.ProImageDTO;
import shop.awesomejump.domain.TotalCartDTO;
import shop.awesomejump.service.ICartDAO;
import shop.awesomejump.service.IProductDAO;


@Controller
@RequestMapping("/awesomejump/cart")
public class CartController {
	
	@Autowired
	private ICartDAO cartDao;
	
	@Autowired
	private IProductDAO productDao;
	
	private Logger log = LoggerFactory.getLogger(CartController.class);
	//장바구니 추가
//	@PostMapping("/insert")
//	public String insertCart(CartDTO cDto, @AuthenticationPrincipal MemberDTO member, Model model)throws Exception{
//		//장바구니에 기존 상품이 있는지 검사
//		int count = cartDao.countCart(cDto);
////		count = (count > 0) ? int 반환1 : int 반환2;
////		count = (count > 0) ? cartDao.modifyCart(cDto) : cartDao.insertCart(cDto);
//		if (count == 0) {
//			//상품이 없으면 insert
//			cartDao.insertCart(cDto);
//		} else {
//			// 상품이 있으면 update
//			cartDao.updateCart(cDto);
//		}
//		
//		
//		return "redirect:/awesomejump/cart/list";
//	}
	@RequestMapping("/list")
	public String listCart(Model model, @AuthenticationPrincipal MemberDTO member) throws Exception{
	
	      //회원 장바구니 목록 가져오기
	      log.info("회원 member : " + member.getMem_no());
	      List<ListCartDTO> list = cartDao.listCart(member.getMem_no());
	      log.info("list : " + list);
	      
	      //리스트(i)번째 상품의 상품번호
	   //   list.get(0).getProduct_no();
	      
	      List<CartOptionDTO> optionList = new ArrayList<CartOptionDTO>();
	      ProImageDTO productImage = new ProImageDTO();
	      String imagePath = "";
	      for(ListCartDTO cart: list ){
	    	  optionList = cartDao.cartOption(cart.getProduct_no());
	    	  cart.setOption(optionList);  
	    	  
	    	  productImage = productDao.getImageList(cart.getProduct_no()).get(0);
	    	  
	    	  imagePath = productImage.getPro_image_path() +
						"/" + productImage.getPro_image_uuid() + 
						"_"   + productImage.getPro_image_name();
	    	  
	    	  cart.setProduct_image_path(imagePath);
	      }
	      log.info("optionList :"+optionList);

		// 장바구니 총액, 총 포인트 구하기
		TotalCartDTO cDto = cartDao.totalCart(member.getMem_no());
	
		model.addAttribute("member", member);
		model.addAttribute("listCart", list);
		
		log.info("listCart : " + list);
		
		if (cDto != null) {
			
			model.addAttribute("totalPrice", cDto.getTotalPrice());
			model.addAttribute("totalPoint", cDto.getTotalPoint());
		}				
		return "/awesomejump/cart/list";
	}
	
	//장바구니 비우기
	@RequestMapping("/deleteAll")
	public String deleteAll(@AuthenticationPrincipal MemberDTO member) {
		cartDao.deleteAllCart(member.getMem_no());				
		return "redirect:/awesomejump/cart/list";
	}
	
	//장바구니 부분삭제
	
	@RequestMapping("/delete")
	public String delete(@RequestParam(defaultValue = "0") int cart_no) {
		log.info("cart_no "+cart_no);
		
		if (cart_no == 0) {
			return "redirect:index";
		}
		
		cartDao.deleteCart(cart_no);
		
		return "redirect:/awesomejump/cart/list";
	}
	
	//장바구니 수정
	@PostMapping("/update")
	public String modifyCart(CartDTO cDto, @AuthenticationPrincipal MemberDTO member) {
		
		
		//수량 옵션 변경
		cartDao.modifyAmount(cDto);		
		
		return "redirect:/awesomejump/cart/list";
	}
	
	
	
	
}
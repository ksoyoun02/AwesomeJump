package shop.awesomejump.controller;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.siot.IamportRestClient.IamportClient;

import shop.awesomejump.domain.AddressDTO;
import shop.awesomejump.domain.CartDTO;
import shop.awesomejump.domain.CartOptionDTO;
import shop.awesomejump.domain.CheckoutDTO;
import shop.awesomejump.domain.CouponMemDTO;
import shop.awesomejump.domain.MemberDTO;
import shop.awesomejump.domain.MemberOrderDetailDTO;
import shop.awesomejump.domain.OrderInfoDTO;
import shop.awesomejump.domain.PointListDTO;
import shop.awesomejump.domain.ProImageDTO;
import shop.awesomejump.domain.ProductDTO;
import shop.awesomejump.domain.TotalCartDTO;
import shop.awesomejump.service.IAddressDAO;
import shop.awesomejump.service.ICartDAO;
import shop.awesomejump.service.IMemberDAO;
import shop.awesomejump.service.IOrderDAO;
import shop.awesomejump.service.IProductDAO;

@Controller
@RequestMapping("/checkout")
public class OrderController {
	
//	@Autowired
//	private IOrderDAO orderDao;
//	
	@Autowired
	private ICartDAO cartDao;	
	@Autowired
	private IProductDAO productDao;
	@Autowired
	private IMemberDAO memberDao;
	@Autowired
	private IAddressDAO addressDao;
	@Autowired
	private IOrderDAO orderDao;
	
	private IamportClient api = 
			new IamportClient("0539856865518992", "1256f5b4f830b9716b4a808e4c533df01633b46ccd79a119cd3026024df6becc8832be67bf369e07");
	
	//?????? ??????
	@PostMapping
	public String checkout(@AuthenticationPrincipal MemberDTO member, Model model,
							@RequestParam("cart_no") int[] cart_no
							) throws Exception {

		System.out.println("cart_no == " +cart_no + "/ cart_amount == ");
		
		model.addAttribute("mem_no", member.getMem_no());
		//????????? ?????? ??????
		List<CheckoutDTO> checkoutList = new ArrayList<CheckoutDTO>();
		
		for(int i = 0; i< cart_no.length; i++) {
			int pro_no = cart_no[i];
			CartDTO cart = cartDao.getCart(pro_no);
			System.out.println("cart == "+cart);
			ProductDTO prod = this.productDao.getProduct(cart.getProduct_no());
			CartOptionDTO option = cartDao.getOption(cart.getProduct_option_no());
			ProImageDTO productImage = productDao.getImageList(cart.getProduct_no()).get(0);
			CheckoutDTO checkout = CheckoutDTO.builder()
									.cart_no(pro_no)
									.cart_quantity(cart.getCart_amount())
									.product_name(prod.getProduct_name())
									.product_price(prod.getProduct_price())
									.product_point(prod.getProduct_point())
									.product_texture(prod.getProduct_texture())
									.product_image_path(productImage.getPro_image_path() +
											"/" + productImage.getPro_image_uuid() + 
											"_"   + productImage.getPro_image_name())
									.product_option_no(option.getProduct_option_no())
									.product_option_size(option.getProduct_option_size())
									.product_option_color(option.getProduct_option_color())
									.build();
			checkoutList.add(checkout);
		}
		
		model.addAttribute("checkout", checkoutList);
		//?????? ?????????/?????????
		TotalCartDTO cDto = cartDao.totalCartByCartList(member.getMem_no(), cart_no);
		
		model.addAttribute("totalPrice", cDto.getTotalPrice());
		model.addAttribute("totalPoint", cDto.getTotalPoint());
		
		//????????? ????????? ????????????
		MemberDTO mem = memberDao.getEmail(member.getMem_no());		
		model.addAttribute("email", mem);
		
		//?????? ?????? ????????????
		List<AddressDTO> addr = addressDao.selectAddressList(member.getMem_no());		
		model.addAttribute("addressList", addr);
		
		//????????? ????????? ????????????
		int point = memberDao.selPoint(member.getMem_no());		
		model.addAttribute("point", point);
		
		//????????? ?????? ????????????
		List<CouponMemDTO> cpDto = memberDao.orderCoupon(member.getMem_no());
		
		model.addAttribute("coupon", cpDto);
		
		return "/awesomejump/checkout";
	}
	
	
	
	
	@Transactional
	@ResponseBody
	@PostMapping("/complete")
	public Map<String, Boolean> checkoutComplete(@RequestBody Map<String, String> orderMap,
										  @AuthenticationPrincipal MemberDTO member) {
		//System.out.println("??????");
		ObjectMapper objectMapper = new ObjectMapper();
		
		OrderInfoDTO order = new OrderInfoDTO();
		List<Integer> cartList = Collections.emptyList();
		CouponMemDTO useCp = new CouponMemDTO();
		MemberDTO mDto = new MemberDTO();
		List<Integer> pointList =Collections.emptyList();
		try {
			order = objectMapper.readValue(orderMap.get("order"), new TypeReference<OrderInfoDTO>() {});
			cartList = objectMapper.readValue(orderMap.get("cart"), new TypeReference<List<Integer>>() {});
			useCp = objectMapper.readValue(orderMap.get("updateCp"), new TypeReference<CouponMemDTO>() {});
			mDto = objectMapper.readValue(orderMap.get("updatePt"), new TypeReference<MemberDTO>() {});
			pointList = objectMapper.readValue(orderMap.get("point"), new TypeReference<List<Integer>>() {});
			
		} catch (Exception e) { 
			e.printStackTrace(); 
		}
		System.out.println("order : "+ order);
		System.out.println("cartList : "+ cartList);
		System.out.println("useCp : "+ useCp);
		System.out.println("pointList : "+pointList);
		
		
		String order_uid = order.getOrder_info_uid();
		
		order.setMem_no(member.getMem_no());
//		?????? ????????? ??????
		List<MemberOrderDetailDTO> orderDetailList = new ArrayList<>();
		
		
		cartList.forEach(cart_no -> {
			CartDTO cart = cartDao.getCart(cart_no);
			ProImageDTO productImage;
			try {
				productImage = productDao.getImageList(cart.getProduct_no()).get(0);
				MemberOrderDetailDTO orderDetail = MemberOrderDetailDTO.builder()
						.order_info_uid(order_uid)
						.product_no(cart.getProduct_no())
						.order_detail_quantity(cart.getCart_amount())
						.product_option_no(cart.getProduct_option_no())
						.imagePath(productImage.getPro_image_path() +
								"/" + productImage.getPro_image_uuid() + 
								"_"   + productImage.getPro_image_name())
						.build();
				orderDetailList.add(orderDetail);
				//????????? ?????? ?????????????????? ??????
				cartDao.removeCart(cart_no);										  
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		});
		order.setOrderDetailList(orderDetailList);
		
		System.out.println("order :::::"+order);
		
		//????????? ?????? orderInfo??? ??????
		boolean result = orderDao.registerOrder(order);
		
		for(MemberOrderDetailDTO dd : orderDetailList) {
			orderDao.insertOrderDetail(dd);
		}
		
		
		System.out.println("registerOrder result = {}" + result);
		
		//????????? ?????? orderDetail??? ??????
//		List<MemberOrderDetailDTO> list =orderDao.selectOrderDetailByUid(order.getOrder_info_uid());
//		for(MemberOrderDetailDTO od : list) {
//			orderDao.insertOrderDetail(od);
//		}
		
		
		System.out.println("useCp.getCoupon_no() : "+ useCp.getCoupon_no());
		//?????? ????????? ????????? ?????? ????????????
		if(useCp.getCoupon_no() > 0) {
			
			CouponMemDTO cmDto = new CouponMemDTO();
			cmDto.setOrder_info_uid(order_uid);
			cmDto.setCoupon_no(useCp.getCoupon_no());
			cmDto.setMem_no(member.getMem_no());
			memberDao.updateCoupon(cmDto);
			System.out.println("cmDto : "+ cmDto);
		}
				
		System.out.println("??????");		
		//?????????????????? insert
	
		for(Integer point : pointList ) {
			PointListDTO plDto = new PointListDTO();
			plDto.setMem_no(member.getMem_no());
			plDto.setOrder_info_uid(order_uid);
			plDto.setPoint_amount(point);
			
			memberDao.insertPoint(plDto);
		}
		
		
		//?????? ????????? ??????
		MemberDTO mmDto = new MemberDTO();
		mmDto.setMem_no(member.getMem_no());
		mmDto.setMem_point(mDto.getMem_point());
		memberDao.updatePoint(mmDto);
		System.out.println("mmDto : " + mmDto);
		
		return Collections.singletonMap("checkoutResult", true);
	}
	
	

	@GetMapping("/complete")
	public String checkoutComplete(@RequestParam String imp_uid,
								  @RequestParam String merchant_uid,
								  				Model model) {
		
		OrderInfoDTO order = orderDao.getOrderByUid(merchant_uid);
		if (order == null) {
			return "redirect:/";
		}
		model.addAttribute("order", order);
		
		return "/awesomejump/complete";
		
	}
	

}

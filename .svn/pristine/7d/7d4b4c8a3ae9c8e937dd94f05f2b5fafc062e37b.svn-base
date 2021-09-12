package shop.awesomejump.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.awesomejump.domain.CouponMemDTO;
import shop.awesomejump.domain.MemberDTO;
import shop.awesomejump.service.IMemberDAO;

@Controller
public class CouponListController {

	@Autowired
	private IMemberDAO memberDao;
	
	@RequestMapping("/couponList")
	public String couponList() {
		
		return "awesomejump/couponList";
	}
	
	@PostMapping("/postCoupon")
	public @ResponseBody HashMap<String, Object> postCoupon(@RequestParam("coupon_no") int coupon_no, @AuthenticationPrincipal MemberDTO member,HttpServletResponse response) {
		HashMap<String, Object> json = new HashMap<String, Object>();
		int couponResult = 0;
		
		try {
			//System.out.println(coupon_no);
			//System.out.println(member.getMem_no());
			
			CouponMemDTO cDto = new CouponMemDTO();
			cDto = memberDao.couponList(coupon_no, member.getMem_no());
			
			if(cDto == null) {
				// 해당 쿠폰이 발급된 적이 없다면
				couponResult = memberDao.getCoupon(coupon_no, member.getMem_no());
				System.out.println(couponResult);
				if(couponResult > 0) {
					json.put("result", 1);
				}else {
					json.put("result", -3);
				}
			}else {
				// 이미 쿠폰이 발급된 정보가 있다면
				json.put("result", -2);
			}
		} catch (Exception e) {
			// 시큐리티로 접근한 mem정보가 없다면
			json.put("result", -1);
		}
		return json;
	}
	
}

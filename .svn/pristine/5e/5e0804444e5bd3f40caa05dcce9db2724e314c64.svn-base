package shop.awesomejump.controller;

import java.util.List;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import shop.awesomejump.domain.MemberDTO;
import shop.awesomejump.domain.MyReviewVO;
import shop.awesomejump.service.IMyReviewDAO;

@Controller
@Secured("ROLE_USER")
@RequestMapping("/myReview")
@RequiredArgsConstructor
public class MyReviewController {
	
	private final IMyReviewDAO myReviewService;
	
	@GetMapping
	public String myReview(@AuthenticationPrincipal MemberDTO member, Model model) {
		List<MyReviewVO> myReviewList = myReviewService.selectMyReviewList(member.getMem_no());
		
		model.addAttribute("myReviewList", myReviewList);
		return "awesomejump/myReview";
	}
}
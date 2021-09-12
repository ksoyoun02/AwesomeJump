package shop.awesomejump.controller;

// TODO: myQna.jsp UI 마무리

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import shop.awesomejump.domain.MemberDTO;
import shop.awesomejump.domain.MyQnaVO;
import shop.awesomejump.domain.ProductQnaDTO;
import shop.awesomejump.domain.QnaDTO;
import shop.awesomejump.service.IMyQnaDAO;

@Controller
@Secured("ROLE_USER")
@RequiredArgsConstructor
@RequestMapping("/myQna")
public class MyQnaController {

	private final IMyQnaDAO myQnaService;
	
	@GetMapping
	public String myQna(@AuthenticationPrincipal MemberDTO member, Model model) {
		
		List<QnaDTO> qnaList = myQnaService.selectQnaList(member.getMem_no());
		List<ProductQnaDTO> productQnaList = myQnaService.selectProductQnaList(member.getMem_no());
		List<MyQnaVO> myQnaList = new ArrayList<>();
		
		qnaList.forEach(qna -> {
			MyQnaVO myQna = buildMyQnaVO(qna);
			myQnaList.add(myQna);
		});
		
		productQnaList.forEach(qna -> {
			MyQnaVO myQna = buildMyQnaVO(qna);
			myQnaList.add(myQna);
		});
		
		myQnaList.sort(new Comparator<MyQnaVO>() {
			@Override
			public int compare(MyQnaVO qna1, MyQnaVO qna2) {
				Date registerDate1 = qna1.getQnaRegisterDate();
				Date registerDate2 = qna2.getQnaRegisterDate();
				
				return registerDate1.equals(registerDate2) ? 0 :
					   registerDate1.before(registerDate2) ? 1 : -1;
			}
		});
		
		model.addAttribute("myQnaList", myQnaList);
		return "awesomejump/myQna";
	}

	private MyQnaVO buildMyQnaVO(Object qnaObj) {
		
		if (qnaObj instanceof QnaDTO) {
			QnaDTO qna = (QnaDTO) qnaObj;
			
			MyQnaVO myQna = MyQnaVO.builder()
					.qnaCategory(qna.getQna_category())
					.qnaTitle(qna.getQna_title())
					.qnaRegisterDate(qna.getQna_date())
					.qnaAnswerStatus(qna.getQna_reply_yn())
					.build();
			
			return myQna;
		
		} else {
			ProductQnaDTO qna = (ProductQnaDTO) qnaObj;
			
			MyQnaVO myQna = MyQnaVO.builder()
					.qnaCategory("상품 문의")
					.qnaTitle(qna.getPro_qna_title())
					.qnaRegisterDate(qna.getPro_qna_date())
					.qnaAnswerStatus(qna.getPro_qna_reply_yn())
					.build();
			
			return myQna;
		}
	}
	
}
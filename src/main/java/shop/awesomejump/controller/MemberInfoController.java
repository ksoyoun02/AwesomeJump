package shop.awesomejump.controller;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import shop.awesomejump.domain.MemberDTO;
import shop.awesomejump.service.IMemberDAO;
import shop.awesomejump.util.FileUtils;

// TODO: 포인트, 쿠폰, 주문 기능 개발 후 회원 탈퇴 모달에 추가정보 출력되게 변경, 사용자에게 알림
// TODO: 서버 시간 고친 뒤에 회원 가입일, 이전 로그인 날짜 형식 변경

@Slf4j
@Controller
@Secured("ROLE_USER")
@RequestMapping("/members")
@RequiredArgsConstructor
public class MemberInfoController {

	private final String uploadPath;
	private final IMemberDAO memberService;
	private final PasswordEncoder passwordEncoder;
	
	@GetMapping
	public String memberInfo() {
		return "awesomejump/members";
	}
	
	@ResponseBody
	@PostMapping("/nickcheck")
	public Map<String, Object> nickCheck(@RequestBody String nickname) {
		
		int result = 0;
		try {
			result = memberService.confirmNickname(nickname);
		} catch (Exception e) { e.printStackTrace(); }
		
		return Collections.singletonMap("checkResult", result);
	}
	
	@PostMapping("/nickmodify")
	public String nickModify(@RequestParam String nickname, @AuthenticationPrincipal MemberDTO member,
							 RedirectAttributes redirectAttr) {
		
		String email = member.getMem_email();
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("mem_nickname", nickname);
		paramMap.put("mem_email", email);
		
		MemberDTO modifiedMember = null;
		try {
			modifiedMember = memberService.modifyNickname(paramMap);
		} catch (NotFoundException e) {
			log.error("{}", e.getMessage());
			
			redirectAttr.addFlashAttribute("modifyResult", false);
			return "redirect:/members";
		}
		
		MemberDTO imageModifiedMember = new FileUtils().setMemberProfileImagePath(modifiedMember);
		SecurityContextHolder.getContext()
				.setAuthentication(new UsernamePasswordAuthenticationToken
							(imageModifiedMember, "[Protected]", Collections.singletonList(new SimpleGrantedAuthority("ROLE_USER"))));
		
		redirectAttr.addFlashAttribute("modifyResult", true);
		return "redirect:/members";
	}
	
	@PostMapping("/profileimagemodify")
	public String profileImageModify(MultipartFile[] uploadedImage, RedirectAttributes redirectAttr,
									@AuthenticationPrincipal MemberDTO member) {
		
		FileUtils fileUtils = new FileUtils();
		
		String memberRegisterDatePath = fileUtils.getDatePath(member.getMem_date());
		Path imageUploadPath = Paths.get(uploadPath, "members", memberRegisterDatePath);
		
		List<String> imageNameList = Collections.emptyList();
		try {
			imageNameList = fileUtils.uploadImagesToPath(uploadedImage, imageUploadPath);
		} catch (Exception e) { e.printStackTrace(); }
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("mem_profile_img", imageNameList.get(0));
		paramMap.put("mem_email", member.getMem_email());
		
		MemberDTO modifiedMember = null;
		try {
			modifiedMember = memberService.updateProfileImagePath(paramMap);
		} catch (NotFoundException e) {
			log.error("{}", e.getMessage());
			
			redirectAttr.addFlashAttribute("modifyResult", false);
			return "redirect:/members";
		}
		
		SecurityContextHolder.getContext()
				.setAuthentication(new UsernamePasswordAuthenticationToken
						(modifiedMember, "[Protected]", Collections.singletonList(new SimpleGrantedAuthority("ROLE_USER"))));
	
		redirectAttr.addFlashAttribute("modifyResult", true);
		return "redirect:/members";
	}

	@ResponseBody
	@PostMapping("/passwordcheck")
	public Map<String, Object> passwordCheck(@RequestBody Map<String, String> validateInfo) { 
		
		MemberDTO member = memberService.getMemberByEmail(validateInfo.get("mem_email"));
		boolean result = passwordEncoder.matches(validateInfo.get("mem_pw"), member.getMem_pw());
		log.debug("passwordCheck result = {}", result);
		
		return Collections.singletonMap("checkResult", result == true ? 1 : 0);
	}
	
	@PostMapping("/changepw")
	public String modifyPassword(@RequestParam String newPassword, @AuthenticationPrincipal MemberDTO member,
								 RedirectAttributes redirectAttr) {
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("mem_pw", passwordEncoder.encode(newPassword));
		paramMap.put("mem_email", member.getMem_email());
		
		boolean result = memberService.modifyPassword(paramMap);
		log.debug("modifyPassword result = {}", result);
		
		redirectAttr.addFlashAttribute("modifyResult", true);
		return "redirect:/members";
	}
	
	@PostMapping("/leavemember")
	public String leaveMember(@AuthenticationPrincipal MemberDTO member, @RequestParam int leaveConfirm,
							  HttpServletRequest request, HttpServletResponse response,
							  RedirectAttributes redirectAttr) {
		
		if (leaveConfirm == 1) {
			boolean result = memberService.modifyMemberEnabledYN(member.getMem_email(), 0);
			log.debug("leaveMember result = {}", result);
			
			redirectAttr.addFlashAttribute("leaveResult", result ? true : false);
		}
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		
		return "redirect:/";
	}
	
}
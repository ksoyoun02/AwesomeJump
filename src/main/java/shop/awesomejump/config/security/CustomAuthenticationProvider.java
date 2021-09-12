package shop.awesomejump.config.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

import lombok.extern.slf4j.Slf4j;
import shop.awesomejump.domain.MemberDTO;
import shop.awesomejump.service.IMemberDAO;

// TODO: 회원 탈퇴로 비활성화 시 문구 분리하기

@Slf4j
public class CustomAuthenticationProvider implements AuthenticationProvider {
				//화면에서 입력한 로그인 정보와 DB에서 가져온 사용자의 정보를 비교해주는 인터페이스
	
	@Autowired
	private IMemberDAO memberDao;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		//화면에서 사용자가 입력한 로그인 정보를 담고 있다
		
		
		String username = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();
		log.debug("username = {}, password = {}", username, password);
		
		MemberDTO member = memberDao.getMemberByEmail(username);
		if (member != null) {
			
			if (!member.getMem_email_yn().equalsIgnoreCase("y")) {
				throw new LockedException("이메일 인증이 되지 않은 계정입니다.");
			
			} else if (member.getMem_enabled_yn().equals("0")) {
				throw new DisabledException("비활성화된 계정입니다.");
			}
		}
		
		return null;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}
	
}
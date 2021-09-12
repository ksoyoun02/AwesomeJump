package shop.awesomejump.config.security;

import java.io.IOException;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String errorMessage = "";
		int loginResult = 0;
		
		if(exception instanceof BadCredentialsException ||  //비밀번호가 일치하지 않는 경우
		   exception instanceof InternalAuthenticationServiceException) {
					//시스템 문제로 내부 인증 관련 처리 요청을 할 수 없는 경우
			errorMessage = "아이디나 비밀번호가 맞지 않습니다.";
	
		} else if (exception instanceof LockedException) {
			errorMessage = exception.getMessage();
			loginResult = -1;
			
		} else if (exception instanceof DisabledException) {
			errorMessage = exception.getMessage();
			loginResult = -2;
			
		} else {
			errorMessage = "로그인에 실패하였습니다.";
		}
		
		log.debug("errorMessage = {}", errorMessage);
		String result = new ObjectMapper()
				.writeValueAsString(Collections.singletonMap("loginResult", loginResult));
		
		response.getWriter().print(result);
	}		
	
}
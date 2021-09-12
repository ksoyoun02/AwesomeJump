package shop.awesomejump.config.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.web.authentication.rememberme.CookieTheftException;
import org.springframework.web.filter.GenericFilterBean;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CookieTheftExceptionHandlerFilter extends GenericFilterBean {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		try {
			chain.doFilter(request, response);
		} catch (CookieTheftException e) {
			log.debug("로그인 상태 유지를 위한 토큰이 일치하지 않습니다.");
			
			HttpServletResponse resp = (HttpServletResponse) response;
			resp.sendRedirect("/");
		}

	}

}
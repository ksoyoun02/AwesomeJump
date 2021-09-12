package shop.awesomejump.config.initializer;

import javax.servlet.ServletContext;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;
import org.springframework.web.multipart.support.MultipartFilter;

public class SecurityWebAppInitializer extends AbstractSecurityWebApplicationInitializer {
	//웹 요청 필터
	//DelegatingFilterProxy
	//애플리케이션으로 들어오는 요청을 가로채 id가 springsecurityfilterchain인 bean에게 위임시킨다.
	
	 @Override
	protected void beforeSpringSecurityFilterChain(ServletContext servletContext) {
		 insertFilters(servletContext, new MultipartFilter());
	}
}
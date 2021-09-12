package shop.awesomejump.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import shop.awesomejump.config.security.SecurityConfig;

public class WebConfig 
extends AbstractAnnotationConfigDispatcherServletInitializer {
			//내부적으로 DispatcherServlet과 ContextLoaderListener를 생성

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] { RootConfig.class, SecurityConfig.class };
		//getRootConfigClasses()에서 리턴된 @Configuration 클래스들은
		//ContextLoaderListender가 생성한 애플리케이션 컨텍스트를 설정하는데 사용됨.
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { ServletConfig.class };
		//getServletConfigClasses()에서 리턴된 @Configuration 클래스들은 DispatcherServlet의
		//애플리케이션 컨텍스트에 대한 핀들을 정의
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
		// DispatcharServelet을 "/"에 매핑
		// 매핑 되기 위한, 하나 혹은 여러개의 패스를 지정, 
		// '/'은 애플리케이션으로 오는 모든요청을처리
	}
	
	@Override
    protected Filter[] getServletFilters() {
        CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
        //문자인코딩처리
        encodingFilter.setEncoding("UTF-8");

        return new Filter[]{ encodingFilter };
    }
	 
}
package shop.awesomejump.config.initializer;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.web.WebApplicationInitializer;

public class WebAppInitializer implements WebApplicationInitializer {
	//java로 web.xml 구현하기 위해 -
	
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		//onStartup 메소드를 오버라이드 해주면서 스프링설정을 해준다.
	}

}

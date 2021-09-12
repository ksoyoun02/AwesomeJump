package shop.awesomejump.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
public class ProfileConfig {

	@Profile("dev")
	@Configuration
	@PropertySource("classpath:/shop/awesomejump/doc/path.properties")
    public static class DevProfileConfig {
		
		@Autowired
		Environment environment;
		
		@Bean
		public String uploadPath() {
			return environment.getProperty("uploadPath");
		}
    }

	@Profile("prod")
    @Configuration
    public static class ProdProfileConfig {
    	
		@Bean
		public String uploadPath() {
			return "/usr/local/upload";
		}
    	
    }

}

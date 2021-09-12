package shop.awesomejump.config;

import org.apache.commons.lang3.SystemUtils;
import org.springframework.test.context.ActiveProfilesResolver;

public class ProfileResolver implements ActiveProfilesResolver {

	@Override
	public String[] resolve(Class<?> testClass) {
		
		String[] devTest  = {"dev", "test"};
		String[] prodTest = {"prod", "test"};
		
		return SystemUtils.IS_OS_WINDOWS ? devTest : prodTest;
	}
}

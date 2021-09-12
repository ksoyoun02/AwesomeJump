package shop.awesomejump.controller;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.Collection;
import java.util.Collections;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import shop.awesomejump.config.ProfileResolver;
import shop.awesomejump.config.RootConfig;
import shop.awesomejump.config.ServletConfig;
import shop.awesomejump.domain.CustomAdapter;
import shop.awesomejump.domain.MemberDTO;

@WithMockUser(authorities = "ROLE_USER")

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ActiveProfiles(resolver = ProfileResolver.class)
@ContextConfiguration(classes = { RootConfig.class, ServletConfig.class })
public class MemberControllerTest {
	
	@Autowired
	private WebApplicationContext context;
	private MockMvc mockMvc;
	
	@Mock
	MemberControllor memController;
	
	@Autowired
	private UserDetailsService customUserService;
	private MemberDTO member;
	
	@Before
    public void before() {

    	/**********************************************************************************************************
    	 * 컨트롤러가 매개변수로 @AuthenticationPrincipal MemberDTO member를 받아서 가져다 쓰는경우에 필요한 코드 */ 
    	
    	// 아이디로 DB에 조회하여(username) 특정 권한 부여 후(role) 로그인
    	String username = "test@email.com";
    	String role = "ROLE_USER";
    	loginUser(username, role);
    	
    	/**********************************************************************************************************/
    	
    	// mockMvc 설정
        mockMvc = MockMvcBuilders
        		.webAppContextSetup(context)
        		.apply(springSecurity())
        		.build();
    }
	 @After
	    public void after() {
			member = new MemberDTO();
	    }

	    private void loginUser(String username, String role) {
			CustomAdapter userDetails = (CustomAdapter) customUserService.loadUserByUsername(username);
	        member = userDetails.getMember();
	        		
	        SecurityContextHolder.getContext()
	        	.setAuthentication(new UsernamePasswordAuthenticationToken(member, "[Protected]", getSimpleAuthorities(role)));
		}
	    private Collection<? extends GrantedAuthority> getSimpleAuthorities(String role) {
	        return Collections.singletonList(new SimpleGrantedAuthority(role));
	    }
		
	    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@Test
	@Ignore
	// 이메일 인증 테스트
	public void emailAuth() throws Exception {
		mockMvc.perform(get("/emailAuth")
				.param("userEmail", "ksoyoun95@naver.com")
				.param("emailCode", "1234"))
				.andDo(print())
				.andExpect(status().isOk());
}
	@Test
	@Ignore
	// 이메일 중복 체크 테스트
	public void email_check() throws Exception {
		
		mockMvc.perform(get("/email_check")
				.param("email", "ksoyoun95@naver.com"))
				.andDo(print())
				.andExpect(status().isOk());
	}
	
	@Test
	@Ignore
	// 닉네임 중복 체크 테스트
	public void nickName_check() throws Exception {
		
		mockMvc.perform(get("/nickName_check")
				.param("nickName", "test"))
				.andDo(print())
				.andExpect(status().isOk());
	}
	
	@Test
	@Ignore
	//회원가입 테스트
	public void Register() throws Exception {
		
		mockMvc.perform(post("/register")
				.with(csrf())
				.param("mem_email", "test03@naver.com")
				.param("mem_pw", "1234")
				.param("mem_nickname", "test01"))
		.andDo(print())
		.andExpect(status().isOk());
	}
	
	@Test
	public void interest() throws Exception{
		mockMvc.perform(get("/interest"))
		.andDo(print())
		.andExpect(status().isOk());
	}
}

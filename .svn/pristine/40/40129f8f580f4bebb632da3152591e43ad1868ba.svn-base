package shop.awesomejump.controller;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThat;
import static org.junit.Assert.assertTrue;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.handler;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.hamcrest.CoreMatchers;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestName;
import org.junit.runner.RunWith;
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
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import shop.awesomejump.config.ProfileResolver;
import shop.awesomejump.config.RootConfig;
import shop.awesomejump.config.ServletConfig;
import shop.awesomejump.domain.AddressDTO;
import shop.awesomejump.domain.CustomAdapter;
import shop.awesomejump.domain.MemberDTO;
import shop.awesomejump.service.IAddressDAO;

/*****************************************************************************************************************************
 * 테스트 케이스 실행 전 shop.awesomejump.doc 패키지의 path.properties를 테스트 경로의 동일한 패키지에 넣어야 실행할 수 있어요
 *****************************************************************************************************************************/

//현재 클래스(AddressCotrollerTest)에서 수행되는 테스트에 권한 부여 (메서드에 개별 적용 가능)
@WithMockUser(authorities = "ROLE_USER")

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ActiveProfiles(resolver = ProfileResolver.class)
@ContextConfiguration(classes = { RootConfig.class, ServletConfig.class })
public class AddressCotrollerTest {
	@Rule public TestName testName = new TestName();
	
	@Autowired
	private WebApplicationContext context;
	private MockMvc mockMvc;
	@Autowired
	private UserDetailsService customUserService;
	private MemberDTO member;
	
	@Autowired
	private IAddressDAO addressService;
	
    @Before
    public void before() {

		/****************************************************************************************************
    	 * 컨트롤러가 인자 @AuthenticationPrincipal MemberDTO member를 받아서 가져다 쓰는경우에 필요한 코드 */ 
    	
    	// 아이디로 DB에 조회하여(username) 특정 권한 부여 후(role) 로그인
    	String username = "test@email.com";
    	String role = "ROLE_USER";
    	loginUser(username, role);
    	/****************************************************************************************************/
    	
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
	public void address() throws Exception {
		
		List<AddressDTO> addressList = addressService.selectAddressList(member.getMem_no());
		
		mockMvc.perform(get("/address"))
			   .andExpect(handler().methodName("address"))
			   .andExpect(model().attribute("addressList", addressList))
			   .andExpect(view().name("awesomejump/address"))
			   .andExpect(status().isOk());
	}
	
	@Test
	public void newAddress() throws Exception {
		
		mockMvc.perform(get("/address/newAddress"))
		   	   .andExpect(status().is4xxClientError());
		
		int address_no = 0;
		try {
		ResultActions resultActions = insertAddress();
		
		address_no = (int)
		resultActions.andExpect(handler().methodName("newAddress"))
	       			 .andExpect(view().name("redirect:/address"))
	       			 .andExpect(redirectedUrl("/address"))
	       			 .andReturn().getFlashMap().get("address_no");
		
		} finally {
			addressService.deleteAddress(address_no);
		}
		
	}

	@Test
	public void modifyAddress() throws Exception {
		
		mockMvc.perform(get("/address/modifyAddress"))
			   .andExpect(status().is4xxClientError());
		
		Integer address_no = 0;
		try {
		ResultActions resultActions = insertAddress();
		
		address_no = (int)
		resultActions.andReturn().getFlashMap().get("address_no");
		
		mockMvc.perform(post("/address/modifyAddress")
			   .with(csrf())
			   .param("address_no", address_no.toString())
			   .param("address_nickname", "변경됨")
			   .param("address_receiver_name", "변경됨")
			   .param("address_receiver_phone", "010-8765-4321")
			   .param("address_postcode", "61150")
			   .param("addressList", "광주 북구 동문대로 452 변경됨, 동문대로,  (장등동)"))
			   .andExpect(handler().methodName("modifyAddress"))
			   .andExpect(view().name("redirect:/address"))
		  	   .andExpect(redirectedUrl("/address"));
		
		AddressDTO modifiedAddress = addressService.selectAddress(address_no);
		assertEquals(modifiedAddress.getAddress_nickname(), "변경됨");
		assertEquals(modifiedAddress.getAddress_receiver_name(), "변경됨");
		assertEquals(modifiedAddress.getAddress_receiver_phone(), "010-8765-4321");
		assertEquals(modifiedAddress.getAddress_postcode(), 61150);
		assertThat(modifiedAddress.getAddress_detail(), CoreMatchers.containsString("변경됨"));
		
		} finally {
			addressService.deleteAddress(address_no);
		}
	
	}
	
	@Test
	public void deleteAddress() throws Exception {
		
		mockMvc.perform(get("/address/deleteAddress"))
		   .andExpect(status().is4xxClientError());
	
		ResultActions resultActions = insertAddress();
		
		Integer address_no = (int)
		resultActions.andReturn().getFlashMap().get("address_no");
		
		mockMvc.perform(post("/address/deleteAddress")
			   .with(csrf())
			   .param("address_no", address_no.toString()))
			   .andExpect(handler().methodName("deleteAddress"))
			   .andExpect(view().name("redirect:/address"))
		  	   .andExpect(redirectedUrl("/address"));
		
		List<AddressDTO> addressList = addressService.selectAddressList(member.getMem_no());
		boolean addressExists = addressList.stream()
				.anyMatch(address -> address.getAddress_no() == address_no);
		
		assertTrue(!addressExists);
	}
	
	private ResultActions insertAddress() throws Exception {
	
		return mockMvc.perform(post("/address/newAddress")
			   .with(csrf())
			   .param("address_nickname", "테스트")
			   .param("address_receiver_name", "테스트")
			   .param("address_receiver_phone", "010-1234-5678")
			   .param("address_postcode", "61140")
			   .param("addressList", "광주 북구 동문대로 452, 동문대로,  (장등동)"));
	}
}
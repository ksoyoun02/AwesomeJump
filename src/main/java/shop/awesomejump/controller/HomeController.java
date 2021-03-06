package shop.awesomejump.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import shop.awesomejump.domain.ProImageDTO;
import shop.awesomejump.domain.ProductDTO;
import shop.awesomejump.domain.ProductOptionDTO;
import shop.awesomejump.domain.RecaptchaDTO;
import shop.awesomejump.service.IMemberDAO;
import shop.awesomejump.service.IProductDAO;

@Controller
public class HomeController {

	@Autowired
	private IMemberDAO memberDao;
	
	@Autowired
	private IProductDAO productDao;
	
	@Autowired
	private String uploadPath;
	
	@GetMapping("/")
	public String index(Model model) {
		List<ProductDTO> pDto = new ArrayList<ProductDTO>();
		
		pDto = productDao.bestPro();
		//System.out.println("메인 -> "+pDto);
		
		for(int i = 0 ; i < pDto.size(); i ++) {
			int no = pDto.get(i).getProduct_no();
			
			ProImageDTO productImage = new ProImageDTO();
			String imagePath = "";
			
			try {
				productImage = productDao.getImageList(no).get(0);
    			
    			imagePath = productImage.getPro_image_path() +
						"/" + productImage.getPro_image_uuid() + 
						"_"   + productImage.getPro_image_name();
    			
    			//System.out.println(productImage.getPro_image_name() + " = " + imagePath);

    			pDto.get(i).setProduct_thumb_img(imagePath);
			} catch (Exception e) {
			}
			
		}
		model.addAttribute("bestList", pDto);
		
		return "awesomejump/index";
	}
	
	@PostMapping("/captcha")
	@ResponseBody
	public RecaptchaDTO captcah(String token){
		
		String url = "https://www.google.com/recaptcha/api/siteverify";
	
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
	    
	    MultiValueMap<String, String> map= new LinkedMultiValueMap<>();
        map.add("secret", "6Ld9RrUbAAAAAOHiBWqzfog5-XDrRniv12CU_Ur2");
        map.add("response", token);
        
        
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);
		
        RecaptchaDTO response = restTemplate.postForObject(url, request, RecaptchaDTO.class);
        
        //System.out.println("map : "+ map);
        //System.out.println("캡챠 : " + token);
		return response;
		
	}
	
	@Secured("ROLE_USER")
	@GetMapping("/websocket_chat")
	public String websocket() {
		return "awesomejump/websocket_chat";
	}
	
	@GetMapping("/alert")
	public String alert() {
		return "awesomejump/alert";
	}
	@GetMapping("/chat")
	public String chat() {
		return "awesomejump/chat";
	}
	
	@GetMapping("/cookie")
	public String cookie(HttpServletRequest request, Model model) throws Exception {
		
		Cookie[] cookie = request.getCookies();
		if(cookie != null){	
			// 쿠키 정렬 순
	   		for(int i = 0; i < cookie.length; i++) {
	   			String name = cookie[i].getName();
	   			if(name.indexOf("Name")!=-1){
	   				
	    			String value = cookie[i].getValue();
	    			//String item = URLDecoder.decode(value,"UTF-8");
	    			
	    			System.out.print(name);
	    			System.out.println(value);
					
	    			}
				}
   		// 쿠키 역순
	   		for(int i = cookie.length-1;0<=i;i--) {
	   			String name = cookie[i].getName();
	   			if(name.indexOf("Name")!=-1){
	   				
	    			String value = cookie[i].getValue();
	    			//String item = URLDecoder.decode(value,"UTF-8");
	    			
	    			System.out.print(name);
	    			System.out.println(value);
	    			
	    			ProductDTO pDto = new ProductDTO();
	    			pDto = memberDao.recentView(value);
	    			System.out.println("상품" + pDto);
	    			model.addAttribute("recentView["+"i]",pDto);
	    			System.out.println(i);
	    			
	   			}
			}
		}
		
		return "awesomejump/cookie";
		
	}
	
	@GetMapping("/register")
	public String register() {
		return "awesomejump/register";
	}
	
	@GetMapping("/login")
	public String login() {
		return "awesomejump/login";
	}
	
	// LOGOUT
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
			
			Cookie remember = new Cookie("remember-me", null);
			remember.setMaxAge(0);
			response.addCookie(remember);

			Cookie jsessionid = new Cookie("JSESSIONID", null);
			jsessionid.setMaxAge(0);
			response.addCookie(jsessionid);

			
			
		}
		
		return "redirect:/";
	}
	
//	@GetMapping("/category")
//	public String category(Model model) {
//		
//		return "awesomejump/category";
//	}
	
	@GetMapping("/cart")
	public String cart() {
		return "awesomejump/cart";
	}
	
	@GetMapping("/checkout")
	public String checkout() {
		return "awesomejump/checkout";
	}
	
	@GetMapping("/confirmation")
	public String confirmation() {
		return "awesomejump/confirmation";
	}
	
	@GetMapping("/tracking")
	public String trackingOrder() {
		return "awesomejump/tracking";
	}
	
	@GetMapping("/blog")
	public String blog() {
		return "awesomejump/blog";
	}
	
	@GetMapping("/single-blog")
	public String singleBlog() {
		return "awesomejump/single-blog";
	}
	
	@GetMapping("/single-product")
	public String singleProduct() {
		return "awesomejump/single-product";
	}
	
	@GetMapping("/contact")
	public String contact() {
		return "awesomejump/contact";
	}

	@GetMapping("/elements")
	public String elements() {
		return "awesomejump/elements";
	}
	
	@GetMapping("/feature")
	public String feature() {
		return "awesomejump/feature";
	}
	
	
	// 상품 등록할 때 미리보기 이미지
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName) {
		System.out.println("getImage GET 호출");
		
		/* File file = new File(uploadPath + "\\product\\" + fileName); */
		File file = new File(uploadPath + fileName);
		
		System.out.println("display File to String ------------------> " + file.toString());
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type",	Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

}

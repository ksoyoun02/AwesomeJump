package shop.awesomejump.controller;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.awesomejump.domain.AddressDTO;
import shop.awesomejump.domain.CartDTO;
import shop.awesomejump.domain.CartOptionDTO;
import shop.awesomejump.domain.CategoryDTO;
import shop.awesomejump.domain.CheckoutDTO;
import shop.awesomejump.domain.CouponMemDTO;
import shop.awesomejump.domain.MemberDTO;
import shop.awesomejump.domain.ProImageDTO;
import shop.awesomejump.domain.ProInterestDTO;
import shop.awesomejump.domain.ProductDTO;
import shop.awesomejump.domain.ProductOptionDTO;
import shop.awesomejump.domain.ReviewDTO;
import shop.awesomejump.domain.ReviewImageDTO;
import shop.awesomejump.mapper.MemProductMapper;
import shop.awesomejump.service.IAddressDAO;
import shop.awesomejump.service.ICartDAO;
import shop.awesomejump.service.ICategoryDAO;
import shop.awesomejump.service.ICategoryProductDAO;
import shop.awesomejump.service.IMemDetailProductDAO;
import shop.awesomejump.service.IMemberDAO;
import shop.awesomejump.service.IOptionDAO;
import shop.awesomejump.service.IProductDAO;
import shop.awesomejump.service.IReviewDAO;
import shop.awesomejump.service.impl.memDetailProductDAOImpl;

@Controller
public class MemCategoryController {

	@Inject
	private ICategoryDAO categoryDao;
	
	@Autowired
	private ICategoryProductDAO categoryproductDao;
	
	@Autowired
	private IMemDetailProductDAO memdetailproductDao;
	
	@Autowired
	private IOptionDAO optionDao;
	 
	@Autowired
	private ICartDAO cartDao;
	 
	@Autowired
	private MemProductMapper memproductmapper;

	@Autowired
	private IProductDAO productDao;
	
	@Autowired
	private IMemberDAO memberDao;
	
	@Autowired
	private IAddressDAO addressDao;
	
	@Autowired
	private IReviewDAO reviewDao;
	
	
	/*
	 * @GetMapping("/category") public String categoryList(Model model) {
	 * 
	 * return "/awesomejump/category"; }
	 */
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@GetMapping("/category")
	public String categoryProductList(@RequestParam(name="category_main", defaultValue = "-1") int category_main, 
			@RequestParam(name="category_mid", defaultValue = "-1") int category_mid,
			@RequestParam(name="category_sub", defaultValue = "-1" ) int category_sub, 
			@RequestParam(name="keyword", required=false) String keyword,
			@RequestParam(name="sort_option", defaultValue="1", required=false) int sort_option ,
			@AuthenticationPrincipal MemberDTO member,
			Model model) throws Exception {
	   
		System.out.println("keyword ===> "+ keyword);
		System.out.println("sort_option(value) ===> "+ sort_option);
		System.out.println(category_main);
		List<ProductDTO> productList = null;
		
		String cateCode = null;
		
		int mem_no = member != null ? member.getMem_no() : 0 ;
		
		// 검색 또는 카테고리에 따라 획득한 상품 목록
		if (keyword != null && !"".equals(keyword)) {
			productList = categoryproductDao.searchProduct(keyword, mem_no, sort_option);
		} else if (category_sub > 0) {
		   productList = categoryproductDao.categorySubProduct(category_sub, mem_no, sort_option);
		   cateCode = String.valueOf(category_sub);
	   } else if (category_mid > 0) {
		   productList = categoryproductDao.categoryMidProduct(category_mid, mem_no, sort_option);
		   cateCode = String.valueOf(category_mid);
	   } else if (category_main > 0) {
		   productList = categoryproductDao.categoryMainProduct(category_main, mem_no, sort_option);
		   cateCode = String.valueOf(category_main);
	   } else {
		   productList = categoryproductDao.categoryAndProductWithInterest(mem_no, sort_option);
	   } 
	   
	   
	   List<CategoryDTO> category = null;
       category = categoryDao.category();
       
       List<CategoryDTO> categoryBrunch = null;
       
       
       if (cateCode != null) {
    	   categoryBrunch = categoryDao.categoryBrunch(cateCode);
    	}
       
       // 카테고리에 해당하는 상품 목록만 추출
	   System.out.println("categoryProductList(product) ===> 모델에 담기 전"+ productList);
	   System.out.println("categoryProductList(categoryBrunch) ===> 모델에 담기 전"+ categoryBrunch);
	   
	   // 총 상품 건수
	   int selectAllCntPro = productList.size();
	   
	   model.addAttribute("category", category);
       model.addAttribute("product", productList);
       model.addAttribute("selectAllCntPro", selectAllCntPro);
       // Transfered Parameters:
	   model.addAttribute("old_" + "category_main", category_main);
	   model.addAttribute("old_" + "category_mid", category_mid);
	   model.addAttribute("old_" + "category_sub", category_sub);
	   model.addAttribute("old_" + "keyword", keyword);
	   model.addAttribute("old_" + "sort_option", sort_option);
	   model.addAttribute("categoryBrunch", categoryBrunch);
       System.out.println(category);	
       System.out.println("categoryProductList(product) ===> 모델에 담은 후"+productList);
       System.out.println("categoryProductList(categoryBrunch) ===> 모델에 담은 후"+categoryBrunch);
       return "/awesomejump/category";
   }
 
	@GetMapping("/memDetailProduct")
	public String memDetailProduct(Model model, @RequestParam("product_no") int product_no) throws Exception {
		
		List<CategoryDTO> category = null;
		category = categoryDao.category();
		
		System.out.println("--------------memdetailproduct product_no ===>>" + product_no);
		
		ProductDTO mainProduct = memdetailproductDao.memDetail(product_no);
		double avgReviewGrade = memdetailproductDao.avgReviewGrade(product_no);
		mainProduct.setReview_grade(avgReviewGrade);
		
		List<ProductOptionDTO> productOption = null;
		productOption = productDao.selectProductOption(product_no);
		
		List<ProductDTO> productOptionList = null;
		productOptionList = optionDao.productOption(product_no);
		
		List<ProductDTO> recommendedList = null;
		int category_mid = Integer.valueOf(mainProduct.getCategory_mid());
		/*
		 * List<ReviewImageDTO> reviewImg = null; reviewImg =
		 * memproductmapper.selectProductReviewImg(review_no);
		 */
		
		// 현 정책: 추천 상품은 '중분류' 일치하는 상품 목록 보여줌.
		// (sort_option 5 ==> 별점 순)
		recommendedList = categoryproductDao.categoryMidProduct(category_mid, /* mem_no */ 0, /* sort_option */ 5);
		for (ProductDTO prod : recommendedList) {
			prod.setImageList(memdetailproductDao.getMemImageList(prod.getProduct_no()));
		}
		
		List<ReviewDTO> reviewList = reviewDao.getReviewList(product_no);
		
		System.out.println("memDetailProduct( productOption) 모델에 담기 전  ===> " + productOption);
		System.out.println("memDetailProduct( mainProduct) 모델에 담기 전  ===> " + mainProduct);
		model.addAttribute("category", category);
		model.addAttribute("mainProduct", mainProduct); 
		model.addAttribute("productOption", productOption);
		model.addAttribute("selectProductOption", productOptionList);
		model.addAttribute("selectRecommendProduct", recommendedList);
		model.addAttribute("reviewCount", memdetailproductDao.cntReviewGrade(product_no));
		model.addAttribute("reviewList", reviewList);
		
		System.out.println(category);
		System.out.println("Main Product Category_mid ==> " + mainProduct.getCategory_mid());
		System.out.println("selectRecommendProduct ===> " + recommendedList);
		System.out.println("memDetailProduct (productOption)  ===> 모델에 담은 후" + productOption);
		System.out.println("memDetailProduct (mainProduct)  ===> 모델에 담은 후" + mainProduct);
		
		return "/awesomejump/memDetailProduct";
	}
   

	// 주영 / 상세상품 이미지 정보 반환
	@GetMapping(value="/getMemImageList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<ProImageDTO>> getMemImageList(int product_no) throws Exception {
		
		logger.info("MemCategoryController (getMemImageList) 호출 => " + product_no);
		List<ProImageDTO> list = memproductmapper.getMemImageList(product_no);
		System.out.println("The number of product image: "  + list.size());
		
		System.out.println("이미지 정보" + memproductmapper.getMemImageList(product_no));
		
		for(int a = 0; a > list.size(); a++ ) {
			System.out.println(list);
		}
		return new ResponseEntity<List<ProImageDTO>>(memproductmapper.getMemImageList(product_no), HttpStatus.OK);
	}
	
	// 주영 / 여러상품 이미지 정보 반환
	@GetMapping(value="/getAllMemImageList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<ProImageDTO>> getAllMemImageList(@RequestParam Map<String, Object> paramMap) throws Exception {
		Iterator<String> keys = paramMap.keySet().iterator();
		
		while (keys.hasNext()) {
			String key = keys.next();
			System.out.println( "키: " + key + ", 밸류: " + paramMap.get(key) ); 
		}
		
		String[] product_no_str = ((String) paramMap.get("product_no_str")).split(",");
		
		List<Integer> productNoList = new ArrayList<Integer>();
		
		for(int b=0; b < product_no_str.length; b++) {
			productNoList.add( Integer.valueOf (product_no_str[b] ) );
		}
		List<ProImageDTO> list = memproductmapper.getAllMemImageList(productNoList);
		System.out.println("The number of product image 여러상품: "  + list.size());
		
		for(int a = 0; a > list.size(); a++ ) {
			System.out.println("이미지 정보" + list.get(a));
		}
		
		return new ResponseEntity<List<ProImageDTO>>(list, HttpStatus.OK);
	}

	// 주영 / 상품 장바구니에 담기
	@RequestMapping(value="/cartAdd", method=RequestMethod.POST)
	@ResponseBody
	public String cartAdd(@RequestBody CartDTO cart, @AuthenticationPrincipal MemberDTO member) {
		System.out.println("Login User: " + member);
		int memNo = member.getMem_no(); 
		cart.setMem_no(memNo);
		
		System.out.println("[/cartAdd] Recepted cart ==> " + cart);
		
		int resultStateCode = 0;
		
		// enum 열거형을 대체할 상수 문자열
		final String OPTION_INVALID		= "OPTION_INVALID";
		final String CART_INSERTED 		= "CART_INSERTED";
		final String CART_UPDATED 		= "CART_UPDATED";
		final String UNEXPECTED_RESULT 	= "UNEXPECTED_RESULT";
		
		try {
			// Check if option is valid.
			// 옵션 유효성(해당 상품의 옵션이어야 함.)
			System.out.println("memdetailproductDao.optionExistsOnProduct(cart.getProduct_no(), cart.getProduct_option_no()): "
					+ memdetailproductDao.optionExistsOnProduct(cart.getProduct_no(), cart.getProduct_option_no()));
			if (!memdetailproductDao.optionExistsOnProduct(cart.getProduct_no(), cart.getProduct_option_no())) {
				System.out.println("OPTION_INVALID 도착");
				resultStateCode = -1;
			} else {
				// 중복 확인(상품, 옵션)
				boolean alreadyExists = cartDao.countCart(cart) > 0;
				
				if (alreadyExists) {	// The product and option already exists at CART table.
					// UPDATE amount, code: 2
					resultStateCode = cartDao.updateCart(cart) << 1;
				} else {
					// INSERT, code: 1
					resultStateCode = memdetailproductDao.insertProductCart(cart);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("[/cartAdd] resultStateCode ==> " + resultStateCode);
		
		String resultState;
		// -1: 비정상적 옵션
		// 0: (안 떠야 정상) 예외라도 뜬 건 듯.
		// 1: 상품/옵션이 장바구니에 새로 추가됨.
		// 2: 상품 중복되어 수량이 업데이트됨.
		switch(resultStateCode) {
		case -1:
			resultState = OPTION_INVALID;
			break;
		case 1:
			resultState = CART_INSERTED;
			break;
		case 2:
			resultState = CART_UPDATED;
			break;
		default:
			resultState = UNEXPECTED_RESULT;
			break;
		}
		
		System.out.println("[/cartAdd] resultState ==> " + resultState);
		return resultState;
	}
	
	// 주영 / 관심상품 1개 등록
	@RequestMapping(value="/interestInsertMember", method=RequestMethod.POST)
	@ResponseBody
	public boolean interestInsertMember(@RequestBody ProInterestDTO interest, 
			@AuthenticationPrincipal MemberDTO member,
			Model model) throws Exception {

		System.out.println("Login User: " + member);
		int memNo = member.getMem_no();
		interest.setMem_no(memNo);
		System.out.println("interestInsertMember ===> setMem_no" + interest.toString());

		int product = interest.getProduct_no();
		interest.setProduct_no(product);
		System.out.println("interestInsertMember ===> setProduct_no" + interest.toString());

		int productInsert = 0;
		try {
			// 관심상품에 상품이있는지
			productInsert = memdetailproductDao.interestInsertMember(interest);
			System.out.println("MemCategoryController productInsert (Try 안) : " + productInsert);

			return productInsert > 0;
		} catch (DuplicateKeyException | SQLIntegrityConstraintViolationException e) {
			// 관심 상품이 있으면 delete
			productInsert = memdetailproductDao.interestDeleteMember(interest);
			System.out.println("MemCategoryController productInsert (DuplicateKeyException 안) : " + productInsert);
			return productInsert <= 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("MemCategoryController productInsert 외부 : " + productInsert);
		return false;
	}

	// 주영 / 여러상품 이미지 정보 반환
	@GetMapping(value="/getProductAllReviewImageList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<ReviewImageDTO>> getProductAllReviewImageList(@RequestParam Map<String, Object> paramMap) throws Exception {
		Iterator<String> keys = paramMap.keySet().iterator();
		
		while (keys.hasNext()) {
			String key = keys.next();
			System.out.println( "키: " + key + ", 밸류: " + paramMap.get(key) ); 
		}
		
		String[] review_no_str = ((String) paramMap.get("review_no_str")).split(",");
		
		List<Integer> reviewNoList = new ArrayList<Integer>();
		
		for(int idx = 0; idx < review_no_str.length; idx++) {
			reviewNoList.add(Integer.valueOf(review_no_str[idx]));
		}
		
		List<ReviewImageDTO> list = memdetailproductDao.getProductAllReviewImageList(reviewNoList);
		
		System.out.println("The number of product image 여러상품: " 
				+ (list != null ? list.size() : null));
		
		if (list == null) {
			System.out.println("[/getProductAllReviewImageList] Review ==> 없음.");
			return null;
		}
		
		for(int a = 0; a > list.size(); a++ ) {
			System.out.println("이미지 정보" + list.get(a));
		}
		
		return new ResponseEntity<List<ReviewImageDTO>>(list, HttpStatus.OK);
	}
	
	// 주영 // 상품 구매 페이지로 넘기기
	@Secured("ROLE_USER")
	@RequestMapping(value="/buying", method=RequestMethod.POST)
	public String buying(@AuthenticationPrincipal MemberDTO member
			, @RequestParam("product_no") int product_no
			, @RequestParam("amount") int amount
			, @RequestParam("option_no") int option_no
			, Model model) throws Exception {
		
		System.out.println("[/buying] member ==> " + member);
		System.out.println("product_no == " + product_no);
		
		// 비회원
		if (member == null) {
			member = new MemberDTO();
			member.setMem_email("");
		}
		
		final int mem_no = member.getMem_no(); // 0
		
		//주문한 상품 정보
		List<CheckoutDTO> checkoutList = new ArrayList<CheckoutDTO>();
		
		ProductDTO prod = productDao.getProduct(product_no);
		CartOptionDTO option = cartDao.getOption(option_no);
		
		// VALID CHECK: product_stock >= amount
		if (prod.getProduct_stock() < amount) {
			// 상품의 현재 재고보다 많을 때 구매 Deny 됨.
			// (redirect -> 원래 보고 있던 상품 상세 페이지로)
			System.out.println("[/buying] stock ==> " + prod.getProduct_stock());
			System.out.println("[/buying] amount ==> " + amount);
			System.out.println("[/buying] === 구매 Denied === ");
			return "redirect:/memDetailProduct?product_no=" + product_no;
			// 너희는 view를 JSP로 사용하고 있잖아. suffix에 애초에 .jsp 고정해 놓음.
			// 그러니까 forward 방식은
			// FORWARD: JSP로 가는 거.(모델 들고)
			// REDIRECT: JSP로 바로 가는 게 아니라 다시 컨트롤러 메서드(주로 다른 메서드)로 가는 것.
		}
		
		// VALID CHECK: option product_no == product_no from detail page.
		// 	만약 프론트에서 없는 옵션 넘버를 보낸다면 option이 null
		// 	있는 옵션 넘버를 보내더라도 다른 product의 옵션이면?? option.getProduct_no() != product_no
		if (option == null || option.getProduct_no() != product_no) {
			System.out.println("[/buying] Option's Product No. ==> " + (option == null ? null : option.getProduct_no()));
			System.out.println("[/buying] Requested Product No. ==> " + product_no);
			System.out.println("[/buying] === 구매 Denied ===\n\tREASON: 구매 상품 번호와 옵션의 상품 번호 불일치");
			return "redirect:/memDetailProduct?product_no=" + product_no;
		}
		
		CheckoutDTO checkout = CheckoutDTO.builder()
								.cart_no(product_no)
								.cart_quantity(amount)
								.product_name(prod.getProduct_name())
								.product_price(prod.getProduct_price())
								.product_option_no(option.getProduct_option_no())
								.product_option_size(option.getProduct_option_size())
								.product_option_color(option.getProduct_option_color())
								.build();
		checkoutList.add(checkout);
		
		model.addAttribute("checkout", checkoutList);
		
		model.addAttribute("totalPrice", prod.getProduct_price());
		model.addAttribute("totalPoint", prod.getProduct_price() * 0.01);
		
		//주문자 이메일 받아오기
		model.addAttribute("email", member);
		
		//회원 주소 받아오기
		List<AddressDTO> addr;
		if(mem_no != 0) {
			addr = addressDao.selectAddressList(mem_no);
		} else {
			addr = new ArrayList<>();
		}
		
		model.addAttribute("addressList", addr);
		
		//회원의 포인트 받아오기
		int point = mem_no != 0 ? memberDao.selPoint(mem_no) : 0;
		model.addAttribute("point", point);
		
		//회원의 쿠폰 받아오기
		List<CouponMemDTO> cpDto = mem_no != 0 ? memberDao.orderCoupon(mem_no) : new ArrayList<>();
		
		model.addAttribute("coupon", cpDto);
		
		// forward: .jsp 파일로 바로 이어지는 거(model 등이랑)
		// redirect: 다른 컨트롤러 메서드로 토스하는 거
		return "/awesomejump/checkout";	// forward: prefix + "/awesomejump/checkout" + suffix
		// (ServletConfig.java 또는 Servlet 설정 XML 파일 => ) prefix는 "/WEB-INF/views/", suffix는 ".jsp"
	}
	
	// 완료 (중) category.jsp > Bread Crumb 클릭 시 해당 카테고리로 페이지 이동
	// 완료 (상) memDetailProduct.jsp > (프론트) 구매하기 클릭 시 유효성 검사
	// 완료 (하) 구매하기 -> (백) 백단 왔을 때 상품 개수, 옵션 재검토
	// 완료 (중) XSS 방어 review 콘텐츠 c:out
	// TODO (중) XSS 방어 문의 콘텐츠 c:out
	// FIXME (하) 상세페이지 진입 시: 관심상품 등록되어 있을 때 하트로 떠 있어야 함.
	
	/* CART */
	// FIXME (상) 장바구니 -> (백) 이상한 옵션이 선택되어 왔을 때 장바구니 등록 안 됨.
	// FIXME (상) memDetailProduct.jsp > (프론트) 옵션 선택 안 됐을 때 장바구니 등록 안 됨.
	
	/* review */
	// FIXME (하) 상세 페이지에 Review 목록 출력/페이징(임시로 1페이지만 해둠)  -> 이거 할라면 (지금 JSTL로 했는데 JSTL 부분 지우고) ajax로 해야 해서 (하)로 둠. 시연 때 리뷰 많이 안 중요함.
	// 완료 (중) 상세 페이지에 총 Review 건수
	// 완료 (상) 상세 페이지에 각 Review 이미지(각 0~3개) 출력
	// FIXME (중) 상세 페이지 각 Reivew 이미지 정렬(부모 div에)
}
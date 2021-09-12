package shop.awesomejump.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import shop.awesomejump.domain.Paging;
import shop.awesomejump.domain.ProductQnaDTO;
import shop.awesomejump.service.IProQnaDAO;

@Controller
@RequestMapping("/awesomejump")
@AllArgsConstructor
public class ProQnaController {

private static final Logger log = LoggerFactory.getLogger(ProQnaController.class);
	
	@Autowired
	private IProQnaDAO pDao;
	
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ProductQnaDTO pDto) {
		
		log.info("ProductQna : " + pDto);
		
		int insertCount = pDao.register(pDto);
		
		log.info("Qna Insert Count : " + insertCount);
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/pages/{product_no}/{page}", produces = {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ProductQnaDTO>> getList(@PathVariable("page") int page, @PathVariable("product_no") int product_no) {
		
		log.info("getList.....");
		
		Paging cri = new Paging(page,10);
		
		log.info("" + cri);
		
		return new ResponseEntity<>(pDao.getList(cri, product_no), HttpStatus.OK);
	}
	
	@GetMapping(value = "/{pro_qna_no}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ProductQnaDTO> get(@PathVariable("pro_qna_no") int pro_qna_no) {
		
		log.info("get : " + pro_qna_no);
		
		return new ResponseEntity<>(pDao.get(pro_qna_no), HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/{pro_qna_no}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("pro_qna_no") int pro_qna_no) {
		
		log.info("remove : " + pro_qna_no);
		
		return pDao.remove(pro_qna_no) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value = "/{pro_qna_no}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ProductQnaDTO pDto, @PathVariable("pro_qna_no") int pro_qna_no) {
		
		pDto.setPro_qna_no(pro_qna_no);
		
		log.info("pro_qna_no : " + pro_qna_no);
		
		log.info("modify : " + pDto);
		
		return pDao.modify(pDto) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
//	@PostMapping(value = "/newReply", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
//	public ResponseEntity<String> createReply(@RequestBody ProductQnaDTO pDto) {
//		
//		log.info("ProductQna Reply : " + pDto);
//		
//		int insertCount = pDao.registerReply(pDto);
//		
//		log.info("Qna Insert Reply Count : " + insertCount);
//		
//		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
}

package shop.awesomejump.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.awesomejump.domain.Paging;
import shop.awesomejump.domain.ProductQnaDTO;
import shop.awesomejump.mapper.ProQnaMapper;
import shop.awesomejump.service.IProQnaDAO;

@Service
public class ProQnaDAOImpl implements IProQnaDAO{

	private static final Logger log = LoggerFactory.getLogger(ProQnaDAOImpl.class);
	
	@Autowired
	private ProQnaMapper mapper;
	
	@Override
	public int register(ProductQnaDTO pDto) {
		log.info("register ....." + pDto);
		return mapper.insert(pDto);
	}

	@Override
	public ProductQnaDTO get(int pro_qna_no) {
		log.info("get....." + pro_qna_no);
		return mapper.read(pro_qna_no);
	}

	@Override
	public int modify(ProductQnaDTO pDto) {
		log.info("modify....." + pDto);
		return mapper.update(pDto);
	}

	@Override
	public int remove(int pro_qna_no) {
		log.info("remove....." + pro_qna_no);
		return mapper.delete(pro_qna_no);
	}

	@Override
	public List<ProductQnaDTO> getList(Paging page, int product_no) {
		log.info("get Qna List of a Product" + product_no);
		return mapper.getListWithPaging(page, product_no);
	}

	@Transactional
	@Override
	public void registerReply(ProductQnaDTO pDto) {
		log.info("register Reply....." + pDto);
		mapper.insertReply(pDto);
		mapper.updateReplyYN(pDto);
	}

	@Override
	public ProductQnaDTO getReply(int pro_qna_no) {
		log.info("getReply : " + pro_qna_no);
		return mapper.readReply(pro_qna_no);
	}

	@Override
	public boolean modifyReply(ProductQnaDTO pDto) {
		log.info("modify : " + pDto);
		return mapper.updateReply(pDto)  == 1;
	}

	@Override
	public boolean removeReply(int pro_qna_no) {
		log.info("remove : " + pro_qna_no);
		return mapper.deleteReply(pro_qna_no) == 1;
	}

	@Override
	public List<ProductQnaDTO> getListReply() {
		log.info("getList........");
		return mapper.getListReply();
	}

	@Override
	public ProductQnaDTO getReply(ProductQnaDTO pDto) {
		log.info("getReply : " + pDto);
		return (ProductQnaDTO) mapper.readReply(pDto);
	}

}

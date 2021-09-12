package shop.awesomejump.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.awesomejump.domain.Paging;
import shop.awesomejump.domain.QnaDTO;
import shop.awesomejump.mapper.QnaMapper;
import shop.awesomejump.service.IQnaDAO;

@Service
public class QnaDAOImpl implements IQnaDAO{

	private static final Logger log = LoggerFactory.getLogger(QnaDAOImpl.class);
	
	@Autowired
	private QnaMapper mapper;
	
	@Override
	public int register(QnaDTO qDto) {
		log.info("register..... " + qDto);
		int result = 0;
		result = mapper.insert(qDto);
		
		return result;
	}

	@Override
	public QnaDTO get(int qna_no) {
		
		log.info("get....." + qna_no);
		
		return mapper.read(qna_no);
	}

	@Override
	public boolean modify(QnaDTO qDto) {
		
		log.info("modify....." + qDto);
		
		return mapper.update(qDto) == 1;
	}

	@Override
	public boolean remove(int qna_no) {
		
		log.info("remove....." + qna_no);
		
		return mapper.delete(qna_no) == 1;
	}

	@Override
	public List<QnaDTO> getList(Paging page) {
		
		log.info("get list" + page);
		
		return mapper.listPaging(page);
	}

	@Override
	public int getTotalCnt(Paging page) {
		
		return mapper.getTotalCount(page);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public void registerReply(QnaDTO qDto) {
		
		log.info("replyRegister....." + qDto);
		
		mapper.insertReply(qDto);
		mapper.updateReplyYN(qDto);
	}
	

	@Override
	public QnaDTO getReply(int qna_ref) {
		
		log.info("getReply ..... " +  qna_ref);
		
		return mapper.readReply( qna_ref);
	}

	@Override
	public boolean modifyReply(QnaDTO qDto) {

		log.info("modifyReply ....." + qDto);
		
		return mapper.updateReply(qDto) == 1;
	}

	@Override
	public boolean removeReply(int qna_ref) {
		
		log.info("removeReply ..... " + qna_ref);
		
		return mapper.deleteReply(qna_ref) == 1;
	}

	@Override
	public int qnaPwCheck(QnaDTO qDto) {
		int result = mapper.pwCheck(qDto);
		return result;
	}
	
//	@Override
//	public QnaDTO qnaPwCheck(int qna_no) {
//		return mapper.pwCheck(qna_no);
//	}



//	@Override
//	public int replyQna(QnaDTO qDto) {
//		mapper.selparents(qDto.getQna_no());
//		mapper.updatelevel(qDto);
		
//		qDto.setQna_ref(qDto.getQna_ref());
//		qDto.setQna_restep(qDto.getQna_restep()+1);
//		qDto.setQna_relevel(qDto.getQna_relevel()+1);
//		return this.mapper.replyInsert(qDto);
//	}

}

package shop.awesomejump.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import shop.awesomejump.domain.Paging;
import shop.awesomejump.domain.QnaDTO;

public interface QnaMapper {
	
	public int insert(QnaDTO qDto);
	
	public List<QnaDTO> getList();
	
	public List<QnaDTO> listPaging(Paging page);
	
	public QnaDTO read(int qna_no);
	
//	public QnaDTO pwCheck(int qna_no);

	public int pwCheck(QnaDTO qDto);
	
	public int delete(int qna_no);
	
	public int update(QnaDTO qDto);
	
	public int getTotalCount(Paging page);
	
	public int insertReply(QnaDTO qDto);
	
	public int updateReplyYN(QnaDTO qDto);
	
	public QnaDTO readReply(int qna_ref);
	
	public int deleteReply(int qna_no);
	
	public int updateReply(QnaDTO qDto);
	
}

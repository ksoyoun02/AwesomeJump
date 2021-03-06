package shop.awesomejump.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import shop.awesomejump.domain.Paging;
import shop.awesomejump.domain.QnaDTO;

public interface IQnaDAO {
	public int register(QnaDTO qDto); //글 등록
	
	public QnaDTO get(int qna_no); //읽기
	
	public int qnaPwCheck(QnaDTO qDto); //비밀번호 확인
	
	public boolean modify(QnaDTO qDto); //수정
	
	public boolean remove(int qna_no); //삭제
	
	public List<QnaDTO> getList(Paging page);
	
	public int getTotalCnt(Paging page);
	
	public void registerReply(QnaDTO qDto);
	
	public QnaDTO getReply(int qna_ref);
	
	public boolean modifyReply(QnaDTO qDto);
	
	public boolean removeReply(int qna_ref);
}

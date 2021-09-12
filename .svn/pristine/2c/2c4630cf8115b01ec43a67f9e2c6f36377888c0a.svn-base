package shop.awesomejump.service;

import java.util.List;

import shop.awesomejump.domain.Paging;
import shop.awesomejump.domain.ProductQnaDTO;

public interface IProQnaDAO {

	public int register(ProductQnaDTO pDto);
	public void registerReply(ProductQnaDTO pDto);// 답글 등록
	public ProductQnaDTO getReply(int pro_qna_no);// 답글 조회
	public boolean modifyReply(ProductQnaDTO pDto);
	public boolean removeReply(int pro_qna_no);
	public List<ProductQnaDTO> getListReply();
	public ProductQnaDTO get(int pro_qna_no);
	public int modify(ProductQnaDTO pDto);
	public int remove(int pro_qna_no);
	public List<ProductQnaDTO> getList(Paging page, int product_no);
	public Object getReply(ProductQnaDTO pDto);
}

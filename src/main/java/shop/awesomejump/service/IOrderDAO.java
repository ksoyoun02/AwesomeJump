package shop.awesomejump.service;

import java.util.List;


import shop.awesomejump.domain.MemberOrderDetailDTO;
import shop.awesomejump.domain.OrderDetailDTO;
import shop.awesomejump.domain.OrderInfoDTO;

public interface IOrderDAO {

	public List<OrderInfoDTO> selectOrderInfoList(int mem_no);
	
	public List<MemberOrderDetailDTO> selectMemberOrderDetailList(String order_info_uid);
	
	public boolean updateReviewStatus(String order_detail_review_yn, int order_detail_no);
	
	
	
	public void insertOrderDetail(MemberOrderDetailDTO modDTO);
	
	public boolean registerOrder(OrderInfoDTO order);
	
	public OrderInfoDTO getOrderByUid(String order_info_uid);
	
	public List<OrderInfoDTO> getOrderByCustNo(int mem_no);
	
	public List<MemberOrderDetailDTO> selectOrderDetailByUid(String order_info_uid);
}

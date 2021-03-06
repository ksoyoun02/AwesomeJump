package shop.awesomejump.service;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.javassist.NotFoundException;

import shop.awesomejump.domain.CouponMemDTO;
import shop.awesomejump.domain.Criteria;
import shop.awesomejump.domain.MemberDTO;
import shop.awesomejump.domain.PointListDTO;
import shop.awesomejump.domain.ProInterestDTO;
import shop.awesomejump.domain.ProductDTO;

public interface IMemberDAO {
	
	public int insertMember(MemberDTO mDto);
	public int confirmEmail(String userEmail) throws Exception;
	public int confirmNickname(String userNickname) throws Exception;
	public void updateCode(MemberDTO mDto);
	public MemberDTO selectMember(String userEmail) throws Exception;
	public MemberDTO getMemberByEmail(String mem_email);
	public int updateLastLogin(MemberDTO mDto);
	public ProductDTO recentView(String product_no) throws Exception;
	//public List<ProductDTO> interest(int mem_no) throws Exception;
	public List<ProductDTO> interest(int mem_no, Criteria cri) throws Exception;
	public MemberDTO modifyNickname(Map<String, Object> nicknameAndEmail) throws NotFoundException;
	public MemberDTO updateProfileImagePath(Map<String, Object> profileImgAndEmail) throws NotFoundException;
	public int deleteInter(ProInterestDTO interDto);
	public int registerCoupon(MemberDTO mDto);
	public boolean modifyPassword(Map<String, Object> passwordAndEmail);
	public boolean modifyMemberEnabledYN(String mem_email, int mem_enabled_yn);
	public int interestTotalCount(int mem_no);
	
	public int couponTotal(int mem_no) throws Exception;
	public List<CouponMemDTO> couponN(CouponMemDTO cDto) throws Exception;
	public List<CouponMemDTO> couponY(CouponMemDTO cDto) throws Exception;
	
	public int selPoint(int mem_no) throws Exception;
	public List<PointListDTO> selPointList(int mem_no) throws Exception;
	public List<PointListDTO> selAddPointList(int mem_no, int startNum, int cnt);
	public int updatePassword(String email, String password);
	public MemberDTO selectProfile(String user);
	public int getCoupon(int coupon_no, int mem_no);
	
	public CouponMemDTO couponList(int coupon_no, int mem_no);
	
	//?????? ???????????? ????????? ????????????
	public MemberDTO getEmail(int mem_no);
	public List<CouponMemDTO> orderCoupon(int mem_no);
	public void updateCoupon(CouponMemDTO cmDto);
	public void updatePoint(MemberDTO mDto);
	public void insertPoint(PointListDTO plDto);
}

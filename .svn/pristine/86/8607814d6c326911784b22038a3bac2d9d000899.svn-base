package shop.awesomejump.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import shop.awesomejump.domain.CouponMemDTO;
import shop.awesomejump.domain.Criteria;
import shop.awesomejump.domain.MemberDTO;
import shop.awesomejump.domain.PointListDTO;
import shop.awesomejump.domain.ProInterestDTO;
import shop.awesomejump.domain.ProductDTO;

public interface MemberMapper {

	public MemberDTO selectMemberByEmail(String mem_email);
	public int insertMember(MemberDTO memDto);
	public MemberDTO confirmEmail(String userEmail);
	public MemberDTO confirmNickname(String userNickname);
	public void updateCode(MemberDTO mDto);
	public int updateLastLogin(MemberDTO mDto);
	public ProductDTO recentView(String product_no);
	//public List<ProductDTO> interest(int mem_no);
	public List<ProductDTO> interestWithPaging(@Param("mem_no") int mem_no, @Param("criteria") Criteria cri);
	public int interestTotalCount(@Param("mem_no") int mem_no);
	public int updateNickname(Map<String, Object> nicknameAndEmail);
	public int updateProfileImagePath(Map<String, Object> profileImgAndEmail);
	public int deleteInter(ProInterestDTO interDto);
	//public List<ProductDTO> interestWithPaging(@Param("mem_no") int mem_no, @Param("pageNum") int pageNum);
	public int registerCoupon(MemberDTO memDto);
	public int updatePassword(Map<String, Object> passwordAndEmail);
	public int updateEnabled(@Param(value = "mem_email") String mem_email, 
							 @Param(value = "mem_enabled_yn") int mem_enabled_yn);
	public int couponTotal(int mem_no);
	public List<CouponMemDTO> couponN(CouponMemDTO cDto);
	public List<CouponMemDTO> couponY(CouponMemDTO cDto);
	public int selPoint(int mem_no);
	public List<PointListDTO> selPointList(int mem_no);
	public List<PointListDTO> selAddPointList(@Param("mem_no") int mem_no, @Param("startNum") int startNum, @Param("cnt") int cnt);
	public int updateForgotPassword(@Param("email") String email, @Param("password") String sb);
	public Integer oldCoupon();
	public Integer todayOldCoupon();
	public MemberDTO selProfile(String user);
	public int getCoupon(@Param("coupon_no") int coupon_no, @Param("mem_no") int mem_no);
	public CouponMemDTO couponList(@Param("coupon_no") int coupon_no, @Param("mem_no") int mem_no);

	
	//결제 페이지에 이메일 자동입력
	public MemberDTO getEmail(int mem_no);
	public List<CouponMemDTO> orderCoupon(int mem_no);
	public void updateCoupon(CouponMemDTO cmDto);
	public void updatePoint(MemberDTO mDto);
	public void insertPoint(PointListDTO plDto);
}
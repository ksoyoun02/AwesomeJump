package shop.awesomejump.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.awesomejump.domain.CouponMemDTO;
import shop.awesomejump.domain.Criteria;
import shop.awesomejump.domain.MemberDTO;
import shop.awesomejump.domain.PointListDTO;
import shop.awesomejump.domain.ProInterestDTO;
import shop.awesomejump.domain.ProductDTO;
import shop.awesomejump.mapper.MemberMapper;
import shop.awesomejump.service.IMemberDAO;
import shop.awesomejump.util.FileUtils;

@Repository
public class MemberDAOImpl implements IMemberDAO{

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public int insertMember(MemberDTO mDto) {
		
		int result = 0;
		result = memberMapper.insertMember(mDto);
		
		return result;
	}

	@Override
	public int confirmEmail(String userEmail) throws Exception {
		MemberDTO mDto = null;
		int result = -1;
		//mDto = session.selectOne("MemberMapper.selJoinId", userId);
		mDto = memberMapper.confirmEmail(userEmail);
		if (mDto != null) {
			result = 1;
		}else {
			result = -1;
		}
		return result;
	}

	@Override
	public int confirmNickname(String userNickname) throws Exception {
		MemberDTO mDto = null;
		int result = -1;
		//mDto = session.selectOne("MemberMapper.selJoinId", userId);
		mDto = memberMapper.confirmNickname(userNickname);
		if (mDto != null) {
			result = 1;
		}else {
			result = -1;
		}
		return result;
	}

	@Override
	public void updateCode(MemberDTO mDto) {
		memberMapper.updateCode(mDto);
		
	}

	@Override
	public MemberDTO selectMember(String userEmail) throws Exception {
		MemberDTO mDto = new MemberDTO();
		mDto = memberMapper.confirmEmail(userEmail);
		
		return mDto;
	}
	
	@Override
	public MemberDTO getMemberByEmail(String mem_email) {
		return memberMapper.selectMemberByEmail(mem_email);
	}
	
	@Override
	public int updateLastLogin(MemberDTO mDto) {
		return memberMapper.updateLastLogin(mDto);
	}


	@Override
	public ProductDTO recentView(String product_no) throws Exception {
		return memberMapper.recentView(product_no);
	}

//	@Override
//	public List<ProductDTO> interest(int mem_no) throws Exception {
//		return memberMapper.interest(mem_no);
//	}

	@Override
	@Transactional
	public MemberDTO modifyNickname(Map<String, Object> nicknameAndEmail) throws NotFoundException {
		
		MemberDTO member = null;

		int result = memberMapper.updateNickname(nicknameAndEmail);
		if (result == 1) {
			member = memberMapper.selectMemberByEmail((String) nicknameAndEmail.get("mem_email"));
		}
		if (member == null) throw new NotFoundException("MemberDaoImpl modifyNickname() member == null");
		
		return member;
	}

	@Override
	public MemberDTO updateProfileImagePath(Map<String, Object> profileImgAndEmail) throws NotFoundException {
		
		MemberDTO member = null;
		
		int result = memberMapper.updateProfileImagePath(profileImgAndEmail);
		if (result == 1) {
			member = memberMapper.selectMemberByEmail((String) profileImgAndEmail.get("mem_email"));
		}
		if (member == null) throw new NotFoundException("MemberDaoImpl updateProfileImagePath() member == null");
		
		return new FileUtils().setMemberProfileImagePath(member);
	}

	@Override
	public int deleteInter(ProInterestDTO interDto) {
		int result = 0;
		
		result = memberMapper.deleteInter(interDto);
		return result;
	}

	@Override
	public List<ProductDTO> interest(int mem_no, Criteria cri) throws Exception {
		return memberMapper.interestWithPaging(mem_no, cri);
	}

	@Override
	public int registerCoupon(MemberDTO mDto) {
		int result = 0;
		result = memberMapper.registerCoupon(mDto);
		return result;
	}

	@Override
	public boolean modifyPassword(Map<String, Object> passwordAndEmail) {
		return memberMapper.updatePassword(passwordAndEmail) == 1;
	}

	@Override
	public boolean modifyMemberEnabledYN(String mem_email, int mem_enabled_yn) {
		return memberMapper.updateEnabled(mem_email, mem_enabled_yn) == 1;
	}

	@Override
	public int interestTotalCount(int mem_no) {
		
		return memberMapper.interestTotalCount(mem_no);
	}

	@Override
	public int couponTotal(int mem_no) throws Exception {
		int result = 0;
		
		result = memberMapper.couponTotal(mem_no);
		
		return result;
	}

	@Override
	public List<CouponMemDTO> couponN(CouponMemDTO cDto) throws Exception {
		
		//System.out.println(cDto +" dto...");
		return memberMapper.couponN(cDto);
	}
	
	@Override
	public List<CouponMemDTO> couponY(CouponMemDTO cDto) throws Exception {
		
		//System.out.println(cDto +" dto...");
		return memberMapper.couponY(cDto);
	}

	@Override
	public int selPoint(int mem_no) throws Exception {
		
		return memberMapper.selPoint(mem_no);
	}

	@Override
	public List<PointListDTO> selPointList(int mem_no) throws Exception {
	
		return memberMapper.selPointList(mem_no);
	}

	@Override
	public List<PointListDTO> selAddPointList(int mem_no, int startNum, int cnt) {
		
		return memberMapper.selAddPointList(mem_no, startNum, cnt);
	}
	
	@Override
	public int updatePassword(String email, String sb) {
		int result = 0;
		result = memberMapper.updateForgotPassword(email,sb);
		return result;
		
	}

	@Override
	public MemberDTO selectProfile(String user) {
		
		return memberMapper.selProfile(user);
	}

	@Override
	public int getCoupon(int coupon_no, int mem_no) {
		int result = 0;
		
		result = memberMapper.getCoupon(coupon_no, mem_no);
		return result;
	}

	@Override
	public CouponMemDTO couponList(int coupon_no, int mem_no) {
		
		return memberMapper.couponList(coupon_no, mem_no);
	}

	@Override
	public MemberDTO getEmail(int mem_no) {
		return memberMapper.getEmail(mem_no);
	}

	@Override
	public List<CouponMemDTO> orderCoupon(int mem_no) {
		
		return memberMapper.orderCoupon(mem_no);
	}

	@Override
	public void updateCoupon(CouponMemDTO cmDto) {
		
	 memberMapper.updateCoupon(cmDto);
	}

	@Override
	public void updatePoint(MemberDTO mDto) {
		memberMapper.updatePoint(mDto);
	}

	@Override
	public void insertPoint(PointListDTO plDto) {
		 memberMapper.insertPoint(plDto);
		
	}

}
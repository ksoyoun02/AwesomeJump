package shop.awesomejump.service;

import java.util.List;

import shop.awesomejump.domain.MemberDTO;
import shop.awesomejump.domain.paging.MembersCriteria;
import shop.awesomejump.domain.paging.MembersPageDTO;

public interface IAdminMembersDAO {

	public List<MemberDTO> selectMemberList(MembersPageDTO pageParam);
	
	public int selectMemberListCount(MembersCriteria criteria);
	public MemberDTO selMember(int mem_no);
}

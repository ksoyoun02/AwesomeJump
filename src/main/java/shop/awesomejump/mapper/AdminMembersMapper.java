package shop.awesomejump.mapper;

import java.util.List;

import shop.awesomejump.domain.MemberDTO;
import shop.awesomejump.domain.paging.MembersCriteria;
import shop.awesomejump.domain.paging.MembersPageDTO;

public interface AdminMembersMapper {

	public List<MemberDTO> selectMemberList(MembersPageDTO pageParam);
	
	public int selectMemberListCount(MembersCriteria criteria);

	public MemberDTO selectMember(int mem_no);
}

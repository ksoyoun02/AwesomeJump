package shop.awesomejump.domain.paging;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder
@AllArgsConstructor
@NoArgsConstructor
public class MembersCriteria {
	
	public MembersCriteria(int listCount, int memberCount) {
		this.lCount = listCount; 
		this.pCount = memberCount;
	}
	
	private int page;
	private int lCount;
	private int pCount;
	private String email;
	private String nickname;
	private String lastLoginBegin;
	private String lastLoginEnd;
	private String status;
}
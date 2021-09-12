package shop.awesomejump.domain;
//문의 게시판 페이징
import lombok.Data;

@Data
public class Paging {

	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	public Paging() {
		this(1,10);
	}

	public Paging(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		
		return type == null? new String[] {}: type.split("");
		}
	
}

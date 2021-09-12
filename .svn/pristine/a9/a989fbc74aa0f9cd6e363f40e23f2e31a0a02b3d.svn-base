package shop.awesomejump.domain;



import lombok.Data;

@Data
public class Criteria {
	private int pageNum;
	private int amount;

	// pageNum, amount 값이 default일때 1, 10이 기본값으로 넘어감
	public Criteria() {
		this(1, 10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}


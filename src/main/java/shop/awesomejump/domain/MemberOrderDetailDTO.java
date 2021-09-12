package shop.awesomejump.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MemberOrderDetailDTO {

	private int order_detail_no;
	private String order_info_uid;
	private int product_no;
	private int order_detail_quantity;
	private String order_detail_shipping;
	private int product_option_no;
	private String order_detail_review_yn;
	
	private String product_name;
	private int product_price;
	
	private String product_option_color;
	private String product_option_size;
	
	private String imagePath;
}

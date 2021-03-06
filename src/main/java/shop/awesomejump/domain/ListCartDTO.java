package shop.awesomejump.domain;

import java.util.List;

import lombok.Data;

@Data
public class ListCartDTO {
	private int cart_no;
	private int product_no;
	
	private int mem_no;
	
	private String product_image_path;
	private String product_name;
	private String product_texture;
	private int cart_amount;
	private int product_price;
	private int product_point;
	private String product_option_size;
	private String product_option_color;
	private int product_option_no;
	
	private List<CartOptionDTO> option;
}

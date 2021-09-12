package shop.awesomejump.domain;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ReviewImageDTO {

	private int review_no; //리뷰번호
	private String review_image_path; //이미지 경로
	private String review_image_name; //이미지 이름
	private String review_image_type; //이미지 형식
	private int review_image_no; //이미지 번호
}

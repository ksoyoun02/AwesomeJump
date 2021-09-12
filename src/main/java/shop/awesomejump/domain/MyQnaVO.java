package shop.awesomejump.domain;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class MyQnaVO {

	private String qnaCategory;
	private String qnaTitle;
	private Date qnaRegisterDate;
	private String qnaAnswerStatus;
}

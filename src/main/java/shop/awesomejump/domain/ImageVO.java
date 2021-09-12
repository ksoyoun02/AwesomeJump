package shop.awesomejump.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ImageVO {

	private String imagePath;
	private String imageName;
	private String imageType;
	private String imageUuid;
}

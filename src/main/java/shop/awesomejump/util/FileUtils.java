package shop.awesomejump.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;
import shop.awesomejump.domain.ImageVO;
import shop.awesomejump.domain.MemberDTO;

@Slf4j
public class FileUtils {

	public String getCurrentDatePath() {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		return dateFormat.format(new Date());
	}

	public String getDatePath(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		return dateFormat.format(date);
	}

	public MemberDTO setMemberProfileImagePath(MemberDTO member) {
		String datePath = new FileUtils().getDatePath(member.getMem_date());

		if (member.getMem_profile_img().equals("profile.jpg")) {
			return member;

		} else {
			String uploadPath = Paths.get(File.separator + "members", datePath, member.getMem_profile_img()).toString();

			member.setMem_profile_img(uploadPath);
			return member;
		}

	}

	public List<String> uploadImagesToPath(MultipartFile[] uploadedImage, Path imageUploadPath)
			throws IllegalStateException, IOException {

		List<String> imageNameList = new ArrayList<>();
		for (MultipartFile image : uploadedImage) {

			UUID uuid = UUID.randomUUID();
			String imageName = uuid.toString() + "_" + image.getOriginalFilename();

			File uploadImageFolder = imageUploadPath.toFile();
			File uploadImageFile = new File(imageUploadPath + File.separator + imageName);

			if (!uploadImageFolder.exists()) {
				uploadImageFolder.mkdirs();
			}
			log.debug(imageName);

			image.transferTo(uploadImageFile);
			imageNameList.add(imageName);
		}
		return imageNameList;
	}

	public List<ImageVO> uploadImagesToPath(MultipartFile[] uploadedImage, String uploadPath, 
											Path imagePath, boolean thumbnails) 
			throws IllegalStateException, IOException {

		List<ImageVO> imageList = new ArrayList<>();
		for (MultipartFile image : uploadedImage) {

			UUID uuid = UUID.randomUUID();
			String imageName = uuid.toString() + "_" + image.getOriginalFilename();
			Path imageUploadPath = Paths.get(uploadPath, imagePath.toString());

			File uploadImageFolder = imageUploadPath.toFile();
			File uploadImageFile = new File(imageUploadPath + File.separator + imageName);

			if (!uploadImageFolder.exists()) {
				uploadImageFolder.mkdirs();
			}

			image.transferTo(uploadImageFile);

			ImageVO imageVO = ImageVO.builder()
					.imageName(image.getOriginalFilename())
					.imagePath(imagePath.toString())
					.imageType(image.getContentType())
					.imageUuid(uuid.toString())
					.build();
			imageList.add(imageVO);

			if (thumbnails) {
				File thumbnailImage = new File(imageUploadPath + File.separator + "s_" + imageName);
				Thumbnails.of(uploadImageFile).height(100).toFile(thumbnailImage);
			}
		}
		return imageList;
	}
}

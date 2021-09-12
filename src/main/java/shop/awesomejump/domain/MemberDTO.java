package shop.awesomejump.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {

	private int mem_no;
	private String mem_pw;
	private String mem_nickname;
	private String mem_email;
	private Date mem_date;
	private Date mem_last_login;
	private String mem_enabled_yn;
	private String mem_email_yn;
	private String mem_profile_img;
	private String mem_register_path;
	private int mem_point;
}

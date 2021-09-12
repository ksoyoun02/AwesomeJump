package shop.awesomejump.domain;

import java.io.Serializable;
import java.util.Collections;

import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class CustomAdapter extends User implements Serializable {
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;
	private MemberDTO member; 
	
	public CustomAdapter(MemberDTO member) {
		super(member.getMem_email(), member.getMem_pw(), Collections.singletonList(new SimpleGrantedAuthority("ROLE_USER")));
		this.member = member;
	}

	
}

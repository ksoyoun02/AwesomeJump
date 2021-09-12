package shop.awesomejump.config.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.extern.slf4j.Slf4j;
import shop.awesomejump.domain.CustomAdapter;
import shop.awesomejump.domain.MemberDTO;
import shop.awesomejump.mapper.MemberMapper;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberDTO member = mapper.selectMemberByEmail(username);
		log.trace("mapper.selectMemberByEmail(username) = {}", member);
		
		if (member == null) {
			throw new UsernameNotFoundException("UsernameNotFoundException");
		}

		return new CustomAdapter(member);
	}
	
}
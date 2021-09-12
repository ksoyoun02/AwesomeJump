package shop.awesomejump.mapper;

import java.util.List;

import shop.awesomejump.domain.AddressDTO;

public interface AddressMapper {

	public int insertAddress(AddressDTO address);
	
	public int updateAddress(AddressDTO address);
	
	public int deleteAddress(int address_no);
	
	public List<AddressDTO> selectAddressList(int mem_no);
	
	public AddressDTO selectAddress(int address_no);
}

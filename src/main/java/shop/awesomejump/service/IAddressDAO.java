package shop.awesomejump.service;

import java.util.List;

import shop.awesomejump.domain.AddressDTO;

public interface IAddressDAO {
	
	public boolean insertAddress(AddressDTO address);
	
	public boolean updateAddress(AddressDTO address);
	
	public boolean deleteAddress(int address_no);
	
	public List<AddressDTO> selectAddressList(int mem_no);
	
	public AddressDTO selectAddress(int address_no);
}

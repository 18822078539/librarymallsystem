package com.library.mall.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.library.mall.entity.Address;

@Repository
public interface AddressMapper {
	Integer addAddress(Address addr);
	Integer deleteAddr(Integer addrId);
	Integer updateAddr(Address addr);
	Address findAddrById(Integer id);
	List<Address> findAddrByUserId(Integer userId);
}

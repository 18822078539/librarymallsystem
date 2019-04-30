package com.library.mall.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.library.mall.entity.Address;
import com.library.mall.entity.Areas;
import com.library.mall.entity.Cities;
import com.library.mall.entity.Provinces;

public interface IAddressService {
	List<Address> findAddressByUserId(Integer userId);
	Address findAddresById(Integer id);
	Provinces findProByProByName(String name);
	Cities findCityByCityName(String name, String provinceId);
	Areas findAreaByAreaName(String name, String cityId);
	Integer addAddress(Address addr);
	Integer updateAddress(Address addr);
	Integer deleteAddress(Integer addrId);
}

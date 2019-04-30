package com.library.mall.service;

import com.library.mall.entity.Admins;

public interface IAdminService {
	Admins login(String name, String pass);
	Integer updateAdmin(Admins admin);
	Admins findAdminById(Integer id);
}

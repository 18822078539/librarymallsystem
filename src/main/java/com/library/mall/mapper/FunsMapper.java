package com.library.mall.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.library.mall.entity.Funs;

@Repository
public interface FunsMapper {
	Funs findFunsById(Integer id);
	List<Funs> findFunsByPid(Integer id);
	List<Funs> findAllFuns();
	List<Funs> findFunsByRoleId(Integer roleId);
}

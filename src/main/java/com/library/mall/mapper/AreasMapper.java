package com.library.mall.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.library.mall.entity.Areas;

@Repository
public interface AreasMapper {
	List<Areas> findAreasByCityId(String cityId);
	Areas findAreaByAreaName(String name, String cityId);
	Areas findAreaById(String id);
}

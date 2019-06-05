package com.library.mall.mapper;

import com.library.mall.entity.BaseConfig;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BaseConfigMapper {
	Integer addBaseConfig(BaseConfig baseConfig);
	Integer deleteBaseConfig(Integer id);
	Integer updateBaseConfig(BaseConfig baseConfig);
	BaseConfig findBaseConfigById(Integer id);
	List<BaseConfig> findAllBaseConfig();
	List<BaseConfig> findAllBaseConfigByLikeName(String name);
}

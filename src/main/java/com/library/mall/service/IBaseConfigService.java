package com.library.mall.service;

import com.github.pagehelper.PageInfo;
import com.library.mall.entity.BaseConfig;

import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 14:38 2019/6/5
 * @Modified By:
 */
public interface IBaseConfigService {
    Integer addBaseConfig(BaseConfig baseConfig);
    Integer deleteBaseConfig(Integer id);
    Integer updateBaseConfig(BaseConfig baseConfig);
    BaseConfig findBaseConfigById(Integer id);
    List<BaseConfig> findAllBaseConfig();
    List<BaseConfig> findAllBaseConfigByLikeName(String name);

    PageInfo<BaseConfig> findAllBaseConfigBySplitePage(Integer page, Integer limit, String keyword);
}

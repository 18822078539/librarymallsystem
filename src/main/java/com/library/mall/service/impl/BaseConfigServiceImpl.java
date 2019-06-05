package com.library.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.library.mall.entity.Banner;
import com.library.mall.entity.BaseConfig;
import com.library.mall.mapper.BaseConfigMapper;
import com.library.mall.service.IBaseConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 14:38 2019/6/5
 * @Modified By:
 */
@Service
public class BaseConfigServiceImpl implements IBaseConfigService{

    @Autowired
    private BaseConfigMapper baseConfigMapper;
    @Transactional(propagation= Propagation.REQUIRED,readOnly=true)
    @Override
    public Integer addBaseConfig(BaseConfig baseConfig) {
        return baseConfigMapper.addBaseConfig(baseConfig);
    }
    @Transactional(propagation=Propagation.REQUIRED,readOnly=true)
    @Override
    public Integer deleteBaseConfig(Integer id) {
        return baseConfigMapper.deleteBaseConfig(id);
    }
    @Transactional(propagation=Propagation.REQUIRED,readOnly=true)
    @Override
    public Integer updateBaseConfig(BaseConfig baseConfig) {
        return baseConfigMapper.updateBaseConfig(baseConfig);
    }
    @Transactional(propagation=Propagation.REQUIRED,readOnly=true)
    @Override
    public BaseConfig findBaseConfigById(Integer id) {
        return baseConfigMapper.findBaseConfigById(id);
    }
    @Transactional(propagation=Propagation.REQUIRED,readOnly=true)
    @Override
    public List<BaseConfig> findAllBaseConfig() {
        return baseConfigMapper.findAllBaseConfig();
    }
    @Transactional(propagation=Propagation.REQUIRED,readOnly=true)
    @Override
    public List<BaseConfig> findAllBaseConfigByLikeName(String name) {
        return baseConfigMapper.findAllBaseConfigByLikeName(name);
    }
    @Transactional(propagation=Propagation.REQUIRED,readOnly=true)
    @Override
    public PageInfo<BaseConfig> findAllBaseConfigBySplitePage(Integer page, Integer limit, String keyword) {
        PageHelper.startPage(page,limit);
        List<BaseConfig> list=new ArrayList<BaseConfig>();
        if(keyword!=null&&!keyword.trim().equals("")){
            list=baseConfigMapper.findAllBaseConfigByLikeName(keyword);
        }else{
            list=baseConfigMapper.findAllBaseConfig();
        }
        PageInfo<BaseConfig> info=new PageInfo<BaseConfig>(list);
        return info;
    }
}

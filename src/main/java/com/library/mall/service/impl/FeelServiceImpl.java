package com.library.mall.service.impl;

import com.google.common.base.Strings;
import com.library.mall.entity.Feel;
import com.library.mall.service.IFeelService;
import com.library.mall.util.service.impl.BaseService;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 17:23 2019/5/22
 * @Modified By:
 */
@Service
public class FeelServiceImpl extends BaseService<Feel> implements IFeelService{
    @Override
    public List<Feel> searchFeel(Feel feel) {
        Example example = new Example(Feel.class);
        Example.Criteria criteria = example.createCriteria();
        if(feel.getFeelcontent()!=null && !feel.getFeelcontent().equals("")){
            criteria.andCondition("feelcontent like","%"+feel.getFeelcontent()+"%");
        }
        return this.selectByExample(example);
    }
}

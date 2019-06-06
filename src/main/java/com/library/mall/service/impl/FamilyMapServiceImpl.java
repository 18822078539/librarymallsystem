package com.library.mall.service.impl;

import com.library.mall.entity.FamilyMap;
import com.library.mall.service.IFamilyMapService;
import com.library.mall.util.service.impl.BaseService;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 17:51 2019/6/6
 * @Modified By:
 */
public class FamilyMapServiceImpl extends BaseService<FamilyMap> implements IFamilyMapService{
    @Override
    public List<FamilyMap> searchFamilys(FamilyMap familyMap) {
        Example example = new Example(FamilyMap.class);
        Example.Criteria criteria = example.createCriteria();
        if(familyMap.getUserid()!=null && familyMap.getUserid()!=0){
            criteria.andCondition("userid = ",familyMap.getUserid());
        }
        if(familyMap.getFamilyid()!=null && familyMap.getFamilyid()!=0){
            criteria.andCondition("familyid = ",familyMap.getFamilyid());
        }
        if(familyMap.getState()!=null){
            criteria.andCondition("state = ",familyMap.getState());
        }
        return this.selectByExample(example);
    }
}

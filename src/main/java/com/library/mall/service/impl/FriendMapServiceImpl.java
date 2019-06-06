package com.library.mall.service.impl;

import com.library.mall.entity.FriendMap;
import com.library.mall.service.IFriendMapService;
import com.library.mall.util.service.impl.BaseService;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 11:29 2019/5/24
 * @Modified By:
 */
@Service
public class FriendMapServiceImpl extends BaseService<FriendMap> implements IFriendMapService{
    @Override
    public List<FriendMap> searchFriends(FriendMap friendMap) {
        Example example = new Example(FriendMap.class);
        Example.Criteria criteria = example.createCriteria();
        if(friendMap.getUserid()!=null && friendMap.getUserid()!=0){
            criteria.andCondition("userid = ",friendMap.getUserid());
        }
        if(friendMap.getFriendid()!=null && friendMap.getFriendid()!=0){
            criteria.andCondition("friendid = ",friendMap.getFriendid());
        }
        if(friendMap.getState()!=null){
            criteria.andCondition("state = ",friendMap.getState());
        }else{
            criteria.andCondition("state != 2");
        }
        return this.selectByExample(example);
    }

}

package com.library.mall.service.impl;

import com.library.mall.entity.Subscribe;
import com.library.mall.mapper.SubscribeMapper;
import com.library.mall.service.ISubscribeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 9:02 2019/5/29
 * @Modified By:
 */
@Service
public class SubscribeServiceImpl implements ISubscribeService{

    @Autowired
    private SubscribeMapper subscribeMapper;
    @Override
    public Integer saveSubscribe(Subscribe g) {
        return subscribeMapper.saveSubscribe(g);
    }

    @Override
    public Integer deleteSubscribe(Integer id) {
        return subscribeMapper.deleteSubscribe(id);
    }

    @Override
    public List<Subscribe> findAllSubscribeByUserId(Integer userId) {
        return subscribeMapper.findAllSubscribeByUserId(userId);
    }

    @Override
    public List<Subscribe> findAllSubscribeByUserIdAndGoodsId(Integer subscribe_user, Integer subscribe_goods) {
        return subscribeMapper.findAllSubscribeByUserIdAndGoodsId(subscribe_user,subscribe_goods);
    }
}

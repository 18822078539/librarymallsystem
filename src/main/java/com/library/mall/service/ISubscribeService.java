package com.library.mall.service;

import com.library.mall.entity.Subscribe;

import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 9:02 2019/5/29
 * @Modified By:
 */
public interface ISubscribeService {
    Integer saveSubscribe(Subscribe g);
    Integer deleteSubscribe(Integer id);
    List<Subscribe> findAllSubscribeByUserId(Integer userId);
    List<Subscribe> findAllSubscribeByUserIdAndGoodsId(Integer subscribe_user,Integer subscribe_goods);

}

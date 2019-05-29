package com.library.mall.mapper;

import com.library.mall.entity.Subscribe;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SubscribeMapper {
	Integer saveSubscribe(Subscribe g);
	Integer deleteSubscribe(Integer id);
	List<Subscribe> findAllSubscribeByUserId(Integer userId);
	List<Subscribe> findAllSubscribeByUserIdAndGoodsId(Integer subscribe_user,Integer subscribe_goods);
}

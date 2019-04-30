package com.library.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.library.mall.entity.Evaluate;
import com.library.mall.entity.Goods;
import com.library.mall.service.IEvaluateService;
import com.library.mall.service.IGoodsService;
import com.library.mall.service.IRedisEvaluateService;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Service
public class RedisEvaluateServiceImpl implements IRedisEvaluateService {
	@Autowired
	private IGoodsService goodsService;
	@Autowired
	private IEvaluateService evaService;
	@Autowired
	private JedisPool jedisPool;

	@Override
	public void RefreshEvaluate(Integer goodsId) {
		Goods goods = goodsService.findById(goodsId);
		List<Evaluate> evaList = evaService.findEvaluateByGoodsId(goodsId);
		goods.setEvaList(evaList);
		Jedis jedis = jedisPool.getResource();
		jedis.set(goodsId+"", JSON.toJSONString(goods));
		jedis.close();
	}
}

package com.library.mall.entity;

import java.io.Serializable;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 8:43 2019/5/29
 * @Modified By:
 */
public class Subscribe implements Serializable {
    private Integer subscribeId;
    private Goods subscribeGoods;
    private Users subscribeUser;

    public Integer getSubscribeId() {
        return subscribeId;
    }

    public void setSubscribeId(Integer subscribeId) {
        this.subscribeId = subscribeId;
    }

    public Goods getSubscribeGoods() {
        return subscribeGoods;
    }

    public void setSubscribeGoods(Goods subscribeGoods) {
        this.subscribeGoods = subscribeGoods;
    }

    public Users getSubscribeUser() {
        return subscribeUser;
    }

    public void setSubscribeUser(Users subscribeUser) {
        this.subscribeUser = subscribeUser;
    }

    public Subscribe() {
    }

    public Subscribe(Integer subscribeId, Goods subscribeGoods, Users subscribeUser) {
        this.subscribeId = subscribeId;
        this.subscribeGoods = subscribeGoods;
        this.subscribeUser = subscribeUser;
    }

    public Subscribe(Goods subscribeGoods, Users subscribeUser) {
        this.subscribeGoods = subscribeGoods;
        this.subscribeUser = subscribeUser;
    }
}

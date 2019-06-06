package com.library.mall.entity;

import java.io.Serializable;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 16:37 2019/5/31
 * @Modified By:
 */
public class ShareBook implements Serializable {

    private Integer shareBookId;

    private String shareBookName;

    private Users shareBookUser;

    private Integer shareBookOrder;

    public ShareBook() {
    }

    public ShareBook(String shareBookName, Users shareBookUser,Integer shareBookOrder) {
        this.shareBookName = shareBookName;
        this.shareBookUser = shareBookUser;
        this.shareBookOrder = shareBookOrder;
    }

    public ShareBook(Integer shareBookId, String shareBookName, Users shareBookUser,Integer shareBookOrder) {
        this.shareBookId = shareBookId;
        this.shareBookName = shareBookName;
        this.shareBookUser = shareBookUser;
        this.shareBookOrder = shareBookOrder;
    }

    public Integer getShareBookOrder() {
        return shareBookOrder;
    }

    public void setShareBookOrder(Integer shareBookOrder) {
        this.shareBookOrder = shareBookOrder;
    }

    public Integer getShareBookId() {
        return shareBookId;
    }

    public void setShareBookId(Integer shareBookId) {
        this.shareBookId = shareBookId;
    }

    public String getShareBookName() {
        return shareBookName;
    }

    public void setShareBookName(String shareBookName) {
        this.shareBookName = shareBookName;
    }

    public Users getShareBookUser() {
        return shareBookUser;
    }

    public void setShareBookUser(Users shareBookUser) {
        this.shareBookUser = shareBookUser;
    }
}

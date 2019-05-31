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

    public ShareBook() {
    }

    public ShareBook(String shareBookName, Users shareBookUser) {
        this.shareBookName = shareBookName;
        this.shareBookUser = shareBookUser;
    }

    public ShareBook(Integer shareBookId, String shareBookName, Users shareBookUser) {
        this.shareBookId = shareBookId;
        this.shareBookName = shareBookName;
        this.shareBookUser = shareBookUser;
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

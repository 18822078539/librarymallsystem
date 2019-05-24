package com.library.mall.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import javax.persistence.*;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "friendmap")
public class FriendMap {
    /**
     * 好友对id
     */
    @Id
    private Integer friendmapid;

    /**
     * 请求者id
     */
    private Integer userid;

    /**
     * 接受请求者id
     */
    private Integer friendid;

    /**
     * 好友状态,0:等待 1：接受
     */
    private Integer state;

    /**
     * 成为好友的时间
     */
    private Date addtime;
    @Transient
    private Users users;

    @Transient
    private String ctime;

}
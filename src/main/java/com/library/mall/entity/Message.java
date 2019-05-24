package com.library.mall.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import javax.persistence.*;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Message {
    /**
     * 留言信息id
     */
    @Id
    private Integer messageid;

    /**
     * 留言者id
     */
    private Integer receiveid;

    /**
     * 被留言者id
     */
    private Integer senderid;

    /**
     * 留言时间
     */
    private Date messagetime;

    /**
     * 回复留言时的父留言id
     */
    private Integer parentmessageid;

    private String pic;

    private String content;

    @Transient
    private Users sendUsers;

    @Transient
    private String ctime;

   }
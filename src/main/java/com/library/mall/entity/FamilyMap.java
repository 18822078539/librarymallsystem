package com.library.mall.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "familymap")
public class FamilyMap {
    /**
     * 好友对id
     */
    @Id
    private Integer familymapid;

    /**
     * 请求者id
     */
    private Integer userid;

    /**
     * 接受请求者id
     */
    private Integer familyid;

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
package com.library.mall.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import javax.persistence.*;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Feel {
    /**
     * 说说id
     */
    @Id
    private Integer feelid;

    /**
     * 发表说说的用户id
     */
    private Integer userid;

    /**
     * 发表说说的日期
     */
    private Date feeltime;

    private String pic;

    /**
     * 说说的内容
     */
    private String feelcontent;

}
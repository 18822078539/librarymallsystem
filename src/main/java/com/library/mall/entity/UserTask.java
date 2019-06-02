package com.library.mall.entity;

import java.io.Serializable;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 14:48 2019/5/31
 * @Modified By:
 */
public class UserTask implements Serializable {

    private Integer userTaskId;

    private DevoteTask userTaskTask;

    private Users userTaskUser;

    //任务类型
    private Integer type;

    public UserTask() {
    }

    public UserTask(Integer userTaskId, DevoteTask userTaskTask, Users userTaskUser,Integer type) {
        this.userTaskId = userTaskId;
        this.userTaskTask = userTaskTask;
        this.userTaskUser = userTaskUser;
        this.type = type;
    }

    public UserTask(DevoteTask userTaskTask, Users userTaskUser,Integer type) {
        this.userTaskTask = userTaskTask;
        this.userTaskUser = userTaskUser;
        this.type = type;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getUserTaskId() {
        return userTaskId;
    }

    public void setUserTaskId(Integer userTaskId) {
        this.userTaskId = userTaskId;
    }

    public DevoteTask getUserTaskTask() {
        return userTaskTask;
    }

    public void setUserTaskTask(DevoteTask userTaskTask) {
        this.userTaskTask = userTaskTask;
    }

    public Users getUserTaskUser() {
        return userTaskUser;
    }

    public void setUserTaskUser(Users userTaskUser) {
        this.userTaskUser = userTaskUser;
    }
}

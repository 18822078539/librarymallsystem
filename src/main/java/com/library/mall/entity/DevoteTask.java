package com.library.mall.entity;

import java.io.Serializable;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 8:09 2019/5/31
 * @Modified By:
 */
public class DevoteTask implements Serializable {
    private Integer taskId;

    private String taskTitle;

    private Integer taskScore;

    private Integer taskState;

    public DevoteTask() {
    }

    public DevoteTask(Integer taskId, String taskTitle, Integer taskScore, Integer taskState) {
        this.taskId = taskId;
        this.taskTitle = taskTitle;
        this.taskScore = taskScore;
        this.taskState = taskState;
    }

    public Integer getTaskId() {
        return taskId;
    }

    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    public String getTaskTitle() {
        return taskTitle;
    }

    public void setTaskTitle(String taskTitle) {
        this.taskTitle = taskTitle;
    }

    public Integer getTaskScore() {
        return taskScore;
    }

    public void setTaskScore(Integer taskScore) {
        this.taskScore = taskScore;
    }

    public Integer getTaskState() {
        return taskState;
    }

    public void setTaskState(Integer taskState) {
        this.taskState = taskState;
    }
}

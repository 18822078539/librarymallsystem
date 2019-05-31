package com.library.mall.service;

import com.library.mall.entity.UserTask;

import java.util.List;

public interface IUserTaskService {
	Integer saveUserTask(UserTask g);
	Integer deleteUserTask(Integer id);
	List<UserTask> findAllUserTaskByUserId(Integer userId);
	List<UserTask> findAllUserTaskByUserIdAndTaskId(Integer usertask_user, Integer usertask_task);
}

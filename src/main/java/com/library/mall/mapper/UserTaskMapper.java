package com.library.mall.mapper;

import com.library.mall.entity.UserTask;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserTaskMapper {
	Integer saveUserTask(UserTask g);
	Integer deleteUserTask(Integer id);
	List<UserTask> findAllUserTaskByUserId(Integer userId);
	List<UserTask> findAllUserTaskByUserIdAndTaskId(Integer usertask_user, Integer usertask_task);
}

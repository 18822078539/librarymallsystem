package com.library.mall.service.impl;

import com.library.mall.entity.UserTask;
import com.library.mall.mapper.UserTaskMapper;
import com.library.mall.service.IUserTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 15:35 2019/5/31
 * @Modified By:
 */
@Service
public class UserTaskServiceImpl implements IUserTaskService{

    @Autowired
    private UserTaskMapper userTaskMapper;

    @Override
    public Integer saveUserTask(UserTask g) {
        return userTaskMapper.saveUserTask(g);
    }

    @Override
    public Integer deleteUserTask(Integer id) {
        return userTaskMapper.deleteUserTask(id);
    }

    @Override
    public List<UserTask> findAllUserTaskByUserId(Integer userId) {
        return userTaskMapper.findAllUserTaskByUserId(userId);
    }

    @Override
    public List<UserTask> findAllUserTaskByUserIdAndTaskId(Integer usertask_user, Integer usertask_task) {
        return userTaskMapper.findAllUserTaskByUserIdAndTaskId(usertask_user,usertask_task);
    }
}

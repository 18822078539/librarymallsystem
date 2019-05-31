package com.library.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.library.mall.entity.DevoteTask;
import com.library.mall.mapper.DevoteTaskMapper;
import com.library.mall.service.IDevoteTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 10:44 2019/5/31
 * @Modified By:
 */
@Service
public class DevoteTaskServiceImpl implements IDevoteTaskService{

    @Autowired
    private DevoteTaskMapper devoteTaskMapper;

    @Override
    public List<DevoteTask> findDevoteTasks() {
        return devoteTaskMapper.findDevoteTasks();
    }

    @Override
    public DevoteTask findDevoteTaskById(Integer id) {
        return devoteTaskMapper.findDevoteTaskById(id);
    }

    @Override
    public Integer addDevoteTask(DevoteTask devoteTask) {
        return devoteTaskMapper.addDevoteTask(devoteTask);
    }

    @Override
    public Integer updateDevoteTask(DevoteTask devoteTask) {
        return devoteTaskMapper.updateDevoteTask(devoteTask);
    }

    @Override
    public Integer deleteDevoteTask(Integer devoteTaskId) {
        return devoteTaskMapper.deleteDevoteTask(devoteTaskId);
    }
    @Transactional(propagation= Propagation.REQUIRED,readOnly=true)
    @Override
    public PageInfo<DevoteTask> findDevoteTaskBySplitPage(Integer page, Integer limit, String keyword) {
        PageHelper.startPage(page, limit);
        List<DevoteTask> list=new ArrayList<DevoteTask>();
        if(keyword!=null&&!keyword.trim().equals("")){
            list=devoteTaskMapper.findAllDevoteTaskByLikeName(keyword);
        }else{
            list=devoteTaskMapper.findAllBySplitPage();
        }
        PageInfo<DevoteTask> info=new PageInfo<DevoteTask>(list);
        return info;
    }

    @Override
    public Integer changeTaskState(Integer state, Integer typeId) {
        return devoteTaskMapper.changeTaskState(state,typeId);
    }
}

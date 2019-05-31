package com.library.mall.service;

import com.github.pagehelper.PageInfo;
import com.library.mall.entity.*;

import java.util.List;

public interface IDevoteTaskService {
	List<DevoteTask> findDevoteTasks();
	DevoteTask findDevoteTaskById(Integer id);
	Integer addDevoteTask(DevoteTask devoteTask);
	Integer updateDevoteTask(DevoteTask devoteTask);
	Integer deleteDevoteTask(Integer devoteTaskId);

	PageInfo<DevoteTask> findDevoteTaskBySplitPage(Integer page, Integer limit, String keyword);

	Integer changeTaskState(Integer state, Integer typeId);
}

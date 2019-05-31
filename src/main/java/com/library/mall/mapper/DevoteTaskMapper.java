package com.library.mall.mapper;

import com.library.mall.entity.DevoteTask;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DevoteTaskMapper {
	Integer addDevoteTask(DevoteTask devoteTask);
	Integer deleteDevoteTask(Integer devoteTaskId);
	Integer updateDevoteTask(DevoteTask devoteTask);
	DevoteTask findDevoteTaskById(Integer id);
	List<DevoteTask> findDevoteTasks();

	List<DevoteTask> findAllDevoteTaskByLikeName(String keyword);

	List<DevoteTask> findAllBySplitPage();

	Integer changeTaskState(Integer state, Integer typeId);
}

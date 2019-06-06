package com.library.mall.mapper;

import com.library.mall.entity.ShareBook;
import com.library.mall.entity.UserTask;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShareBookMapper {
	Integer saveShareBook(ShareBook g);
	Integer deleteShareBook(Integer id);
	List<ShareBook> findAllShareBookByUserId(Integer userId);
	void updateAllStatus();
	void updateStatus(Integer id);
	List<UserTask> findBookByUserIdAndName(@Param("userId") Integer userId, @Param("shareName") String bookName);
//	List<ShareBook> findAllShareBookByUserIdAndTaskId(Integer usertask_user, Integer usertask_task);
}

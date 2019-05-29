package com.library.mall.mapper;

import com.library.mall.entity.SysMsg;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SysMsgMapper {
	Integer saveSysMsg(SysMsg sysMsg);
	Integer deleteSysMsg(Integer id);
	List<SysMsg> findAllSysMsgByUserId(Integer id);

    List<SysMsg> findAllSysMsg();

	List<SysMsg> findAllSysMsgByLikeName(String keyword);

	List<SysMsg> findAllBySplitPage();

    Integer updateSysMsg(SysMsg sysMsg);
}

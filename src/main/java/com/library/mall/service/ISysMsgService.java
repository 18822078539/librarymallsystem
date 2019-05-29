package com.library.mall.service;

import com.github.pagehelper.PageInfo;
import com.library.mall.entity.SysMsg;

import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 9:02 2019/5/29
 * @Modified By:
 */
public interface ISysMsgService {
    Integer saveSysMsg(SysMsg sysMsg);
    Integer deleteSysMsg(Integer id);
    List<SysMsg> findAllSysMsgByUserId(Integer userId);

    List<SysMsg> findAllSysMsg();

    PageInfo<SysMsg> findSysMsgBySplitPage(Integer page, Integer limit, String keyword);

    Integer updateSysMsg(SysMsg sysMsg);
}

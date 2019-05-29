package com.library.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.library.mall.entity.GoodsType;
import com.library.mall.entity.SysMsg;
import com.library.mall.mapper.SysMsgMapper;
import com.library.mall.service.ISysMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 10:55 2019/5/29
 * @Modified By:
 */
@Service
public class SysMsgServiceImpl implements ISysMsgService{
    @Autowired
    private SysMsgMapper sysMsgMapper;
    @Override
    public Integer saveSysMsg(SysMsg sysMsg) {
        return sysMsgMapper.saveSysMsg(sysMsg);
    }

    @Override
    public Integer deleteSysMsg(Integer id) {
        return sysMsgMapper.deleteSysMsg(id);
    }

    @Override
    public List<SysMsg> findAllSysMsgByUserId(Integer userId) {
        return sysMsgMapper.findAllSysMsgByUserId(userId);
    }

    @Override
    public List<SysMsg> findAllSysMsg() {
        return sysMsgMapper.findAllSysMsg();
    }

    @Transactional(propagation= Propagation.REQUIRED,readOnly=true)
    @Override
    public PageInfo<SysMsg> findSysMsgBySplitPage(Integer page, Integer limit, String keyword) {
        PageHelper.startPage(page, limit);
        List<SysMsg> list=new ArrayList<SysMsg>();
        if(keyword!=null&&!keyword.trim().equals("")){
            list=sysMsgMapper.findAllSysMsgByLikeName(keyword);
        }else{
            list=sysMsgMapper.findAllBySplitPage();
        }
        PageInfo<SysMsg> info=new PageInfo<SysMsg>(list);
        return info;
    }

    @Override
    public Integer updateSysMsg(SysMsg sysMsg) {
        return sysMsgMapper.updateSysMsg(sysMsg);
    }
}

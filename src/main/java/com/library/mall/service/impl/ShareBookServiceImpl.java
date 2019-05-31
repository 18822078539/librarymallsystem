package com.library.mall.service.impl;

import com.library.mall.entity.ShareBook;
import com.library.mall.entity.UserTask;
import com.library.mall.mapper.ShareBookMapper;
import com.library.mall.service.IShareBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 16:53 2019/5/31
 * @Modified By:
 */
@Service
public class ShareBookServiceImpl implements IShareBookService{

    @Autowired
    private ShareBookMapper shareBookMapper;
    @Override
    public Integer saveShareBook(ShareBook g) {
        return shareBookMapper.saveShareBook(g);
    }

    @Override
    public Integer deleteShareBook(Integer id) {
        return shareBookMapper.deleteShareBook(id);
    }

    @Override
    public List<ShareBook> findAllShareBookByUserId(Integer userId) {
        return shareBookMapper.findAllShareBookByUserId(userId);
    }

    @Override
    public List<UserTask> findBookByUserIdAndName(Integer userId, String bookName) {
        return shareBookMapper.findBookByUserIdAndName(userId,bookName);
    }
}

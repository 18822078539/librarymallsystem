package com.library.mall.service;

import com.library.mall.entity.ShareBook;
import com.library.mall.entity.UserTask;

import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 16:53 2019/5/31
 * @Modified By:
 */
public interface IShareBookService {

    Integer saveShareBook(ShareBook g);
    Integer deleteShareBook(Integer id);
    List<ShareBook> findAllShareBookByUserId(Integer userId);

    List<UserTask> findBookByUserIdAndName(Integer userId, String bookName);

    void updateAllShareBook();

    void updateStatus(Integer id);
}

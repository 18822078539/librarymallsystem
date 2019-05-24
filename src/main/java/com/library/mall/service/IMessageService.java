package com.library.mall.service;

import com.library.mall.entity.Message;
import com.library.mall.util.service.IService;

import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 10:26 2019/5/24
 * @Modified By:
 */
public interface IMessageService extends IService<Message>{
    List<Message> searchMessage(Message message);
}

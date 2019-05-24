package com.library.mall.service.impl;

import com.library.mall.entity.Message;
import com.library.mall.service.IMessageService;
import com.library.mall.util.service.impl.BaseService;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 10:26 2019/5/24
 * @Modified By:
 */
@Service
public class MessageServiceImpl extends BaseService<Message> implements IMessageService{
    @Override
    public List<Message> searchMessage(Message message) {
        Example example = new Example(Message.class);
        Example.Criteria criteria = example.createCriteria();
        if(message.getReceiveid()!=null && message.getReceiveid()!=0){
            criteria.andCondition("receiveid = ",message.getReceiveid());
        }
        return this.selectByExample(example);
    }
}

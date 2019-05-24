package com.library.mall.controller;

import com.github.pagehelper.PageHelper;
import com.library.mall.entity.Feel;
import com.library.mall.entity.Message;
import com.library.mall.entity.Users;
import com.library.mall.service.IMessageService;
import com.library.mall.service.IUserService;
import com.library.mall.util.domain.QueryRequest;
import com.library.mall.util.domain.ResponseBo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 10:29 2019/5/24
 * @Modified By:
 */
@Controller
@RequestMapping("/messages")
public class MessageController {
    //日志类
    public Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IMessageService messageService;
    @Autowired
    private IUserService userService;

    /**
     * 分页查询留言板信息
     *
     * @param queryRequest
     * @param message
     * @return
     */
    @RequestMapping("findBySplitPage")
    @ResponseBody
    public ResponseBo findBySplitPage(QueryRequest queryRequest, Message message, HttpServletRequest request) {
        logger.info("开始进行留言板信息查询");
        HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("user");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            PageHelper.startPage(queryRequest.getPageNum(), queryRequest.getPageSize());
            message.setReceiveid(users.getUserId());
            List<Message> messages = messageService.searchMessage(message);
            for (Message item : messages) {
                Users sendUsers = userService.findUserById(item.getSenderid());
                item.setSendUsers(sendUsers);
                item.setCtime(simpleDateFormat.format(item.getMessagetime()));
            }
            return ResponseBo.ok(messages);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseBo.error("查询失败，请联系管理员");
        }

    }


    @RequestMapping("saveMessage")
    @ResponseBody
    public ResponseBo saveMessage(Message message, HttpServletRequest request){
        logger.info("开始进行留言信息保存");
        HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("user");
        message.setSenderid(users.getUserId());
        message.setMessagetime(new Date());
        message.setParentmessageid(0);
        messageService.save(message);
        return ResponseBo.ok("留言成功");
    }
}

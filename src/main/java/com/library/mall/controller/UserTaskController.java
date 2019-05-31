package com.library.mall.controller;

import com.library.mall.entity.*;
import com.library.mall.service.IUserService;
import com.library.mall.service.IUserTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 15:41 2019/5/31
 * @Modified By:
 */
@Controller
@RequestMapping("/userTask")
public class UserTaskController {

    @Autowired
    private IUserTaskService userTaskService;
    @Autowired
    private IUserService userService;

    @RequestMapping("finishTask")
    @ResponseBody
    public String finishTask(Integer taskId,Integer taskScore,HttpServletRequest request){
        HttpSession session = request.getSession();
        Users user=(Users) session.getAttribute("user");
        List<UserTask> taskList = userTaskService.findAllUserTaskByUserIdAndTaskId(user.getUserId(),taskId);
        if(taskList.size()==0){
            DevoteTask devoteTask = new DevoteTask();
            devoteTask.setTaskId(taskId);
            UserTask userTask = new UserTask(devoteTask,user);
            Integer rs = userTaskService.saveUserTask(userTask);
            if(rs>0){
                //同时需要更新用户的贡献值
                user.setUserDevote(user.getUserDevote()+taskScore);
                userService.updateUserInfo(user);
                return "success";
            }else{
                return "fail";
            }
        }else{
            return "success";
        }

    }
}

package com.library.mall.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.library.mall.entity.DevoteTask;
import com.library.mall.entity.Message;
import com.library.mall.entity.Users;
import com.library.mall.service.IDevoteTaskService;
import com.library.mall.util.domain.QueryRequest;
import com.library.mall.util.domain.ResponseBo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 11:08 2019/5/31
 * @Modified By:
 */
@Controller
@RequestMapping("/devoteTask")
public class DevoteTaskController {
    @Autowired
    private IDevoteTaskService devoteTaskService;

    @RequestMapping("findTypeBySplitPage")
    @ResponseBody
    public JSONObject findTypeBySplitPage(Integer page, Integer limit, String keyword){
        PageInfo<DevoteTask> info = devoteTaskService.findDevoteTaskBySplitPage(page, limit, keyword);
        JSONObject obj=new JSONObject();
        obj.put("code", 0);
        obj.put("msg", "");
        obj.put("count", info.getTotal());
        obj.put("data", info.getList());
        return obj;
    }
    @RequestMapping("deleteDevoteTask")
    @ResponseBody
    public String deleteDevoteTask(Integer typeId){
        Integer rs = devoteTaskService.deleteDevoteTask(typeId);
        if(rs>0){
            return "success";
        }else{
            return "fail";
        }
    }
    @RequestMapping("updateDevoteTask")
    @ResponseBody
    public String updateDevoteTask(DevoteTask devoteTask){
        Integer rs = devoteTaskService.updateDevoteTask(devoteTask);
        if(rs>0){
            return "success";
        }else{
            return "fail";
        }
    }
    @RequestMapping("batchDelete")
    @ResponseBody
    public String batchDelete(String batchId){
        String[] list = batchId.split(",");
        boolean flag=true;
        for (String s : list) {
            Integer typeId = Integer.valueOf(s);
            Integer rs = devoteTaskService.deleteDevoteTask(typeId);
            if(rs<0){
                flag=false;
            }
        }
        if(flag){
            return "success";
        }else{
            return "fail";
        }
    }
    @RequestMapping("addDevoteTask")
    @ResponseBody
    public String addDevoteTask(DevoteTask devoteTask){
        Integer rs = devoteTaskService.addDevoteTask(devoteTask);
        if(rs>0){
            return "success";
        }else{
            return "fail";
        }
    }

    @RequestMapping("changeTaskState")
    @ResponseBody
    public String changeTaskState(Integer typeId,Integer state){
        System.out.println(state+"state");
        System.out.println(typeId+"typeId");
        Integer rs = devoteTaskService.changeTaskState(state, typeId);
        if(rs>0){
            return "success";
        }else{
            return "fail";
        }
    }

    /**
     * 分页查询贡献任务信息
     *
     * @param queryRequest
     *
     * @return
     */
    @RequestMapping("findBySplitPage")
    @ResponseBody
    public ResponseBo findBySplitPage(QueryRequest queryRequest) {
        try {
            PageHelper.startPage(queryRequest.getPageNum(), queryRequest.getPageSize());
            List<DevoteTask> devoteTasks = devoteTaskService.findDevoteTasks();
            return ResponseBo.ok(devoteTasks);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseBo.error("查询失败，请联系管理员");
        }

    }
}

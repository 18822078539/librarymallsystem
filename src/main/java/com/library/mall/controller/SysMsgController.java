package com.library.mall.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.library.mall.entity.SysMsg;
import com.library.mall.entity.Users;
import com.library.mall.service.ISysMsgService;
import com.library.mall.util.domain.QueryRequest;
import com.library.mall.util.domain.ResponseBo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 11:14 2019/5/29
 * @Modified By:
 */
@Controller
@RequestMapping("/sysmsg")
public class SysMsgController {
    //日志类
    public Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ISysMsgService sysMsgService;

    @RequestMapping("saveSysMsg")
    public String saveSysMsg(SysMsg sysMsg, HttpServletRequest request){
        logger.info("开始进行客服信息保存");
        HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("user");
        sysMsg.setSendUser(users);
        sysMsgService.saveSysMsg(sysMsg);
        return "forward:/view/usercenter";
    }


    /**
     * 分页查询读客服信息
     * @param
     * @return
     */
    @RequestMapping(value = "findAll")
    @ResponseBody
    public JSONObject findAllBy(Integer page,Integer limit,String keyword){
        logger.info("开始进行客服信息查询");
        PageInfo<SysMsg> info = sysMsgService.findSysMsgBySplitPage(page, limit, keyword);
        JSONObject obj=new JSONObject();
        obj.put("code", 0);
        obj.put("msg", "");
        obj.put("count", info.getTotal());
        obj.put("data", info.getList());
        return obj;

    }
    /**
     * 分页查询读客服信息
     * @param queryRequest
     * @return
     */
    @RequestMapping(value = "findAllByUser")
    @ResponseBody
    public ResponseBo findAllByUser(QueryRequest queryRequest,HttpServletRequest request){
        logger.info("开始进行客服信息查询");
        HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("user");
        try {
            PageHelper.startPage(queryRequest.getPageNum(),queryRequest.getPageSize());
            List<SysMsg> sysMsgs = sysMsgService.findAllSysMsgByUserId(users.getUserId());

            return ResponseBo.ok(sysMsgs);
        }catch (Exception e){
            e.printStackTrace();
            return ResponseBo.error("查询失败，请联系管理员");
        }

    }

    @RequestMapping("updateSysMsg")
    @ResponseBody
    public String updateSysMsg(SysMsg sysMsg){
        Integer rs = sysMsgService.updateSysMsg(sysMsg);
        if(rs>0){
            return "success";
        }else{
            return "fail";
        }
    }
}

package com.library.mall.controller;

import com.github.pagehelper.PageHelper;
import com.library.mall.entity.Feel;
import com.library.mall.entity.Users;
import com.library.mall.service.IFeelService;
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
 * @Description: 说说信息管理
 * @Date:Created in 15:32 2019/5/23
 * @Modified By:
 */
@Controller
@RequestMapping("/feels")
public class FeelController {

    //日志类
    public Logger logger = LoggerFactory.getLogger(this.getClass());

    //读书感想相关服务
    @Autowired
    private IFeelService feelService;

    @Autowired
    private IUserService userService;

    @RequestMapping("saveFeel")
    public String saveFeel(Feel feel, HttpServletRequest request){
        logger.info("开始进行读书感想信息保存");
        HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("user");
        feel.setUserid(users.getUserId());
        feel.setFeeltime(new Date());
        feelService.save(feel);
        return "forward:/view/usercenter";
    }

    /**
     * 分页查询读书感想信息
     * @param queryRequest
     * @param feel
     * @return
     */
    @RequestMapping("findBySplitPage")
    @ResponseBody
    public ResponseBo findBySplitPage(QueryRequest queryRequest, Feel feel){
        logger.info("开始进行读书感想信息查询");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            PageHelper.startPage(queryRequest.getPageNum(),queryRequest.getPageSize());
            List<Feel> feels = feelService.searchFeel(feel);
            for(Feel item:feels){
                Users users = userService.findUserById(item.getUserid());
                item.setUsers(users);
                item.setCtime(simpleDateFormat.format(item.getFeeltime()));
            }
            return ResponseBo.ok(feels);
        }catch (Exception e){
            e.printStackTrace();
            return ResponseBo.error("查询失败，请联系管理员");
        }

    }
}

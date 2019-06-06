package com.library.mall.controller;

import com.github.pagehelper.PageHelper;
import com.library.mall.entity.FriendMap;
import com.library.mall.entity.Users;
import com.library.mall.service.IFriendMapService;
import com.library.mall.service.IUserService;
import com.library.mall.util.domain.QueryRequest;
import com.library.mall.util.domain.ResponseBo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 11:32 2019/5/24
 * @Modified By:
 */
@Controller
@RequestMapping("/friendMap")
public class FriendMapController {

    //日志类
    public Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IFriendMapService friendMapService;

    @Autowired
    private IUserService userService;

    /**
     * 查询我的所有好友
     * @param queryRequest
     * @param friendMap
     * @return
     */
    @RequestMapping("findBySplitPage")
    @ResponseBody
    public ResponseBo findBySplitPage(QueryRequest queryRequest, FriendMap friendMap, HttpServletRequest request){
        logger.info("开始进行好友信息查询");
        HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("user");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            PageHelper.startPage(queryRequest.getPageNum(),queryRequest.getPageSize());
            friendMap.setUserid(users.getUserId());
            List<FriendMap> friendMaps = friendMapService.searchFriends(friendMap);
            for(FriendMap item:friendMaps){
                Users fr = userService.findUserById(item.getFriendid());
                item.setUsers(fr);
                item.setCtime(simpleDateFormat.format(item.getAddtime()));
            }
            return ResponseBo.ok(friendMaps);
        }catch (Exception e){
            e.printStackTrace();
            return ResponseBo.error("查询失败，请联系管理员");
        }

    }
    @RequestMapping("addFriend")
    @ResponseBody
    public ResponseBo addFriend(FriendMap friendMap, HttpServletRequest request){
        logger.info("开始进行加好友申请");
        try{
            HttpSession session = request.getSession();
            Users users = (Users) session.getAttribute("user");
            if(users.getUserId()==friendMap.getFriendid()){
                return ResponseBo.error("不可以添加自己为好友");
            }
            friendMap.setFriendid(users.getUserId());
            List<FriendMap> friendMaps = friendMapService.searchFriends(friendMap);
            if(friendMaps.size()>0){
                FriendMap it = friendMaps.get(0);
                if(it.getState()==0){
                    return ResponseBo.error("好友申请已发送，请勿重复申请");
                }else{
                    return ResponseBo.error("你们已是好友");
                }
            }
            friendMap.setState(0);
            friendMap.setAddtime(new Date());
            friendMapService.save(friendMap);
            return ResponseBo.ok("发送成功");
        }catch (Exception e){
            return ResponseBo.error("发送失败");
        }

    }

    @RequestMapping("pingbi")
    @ResponseBody
    public ResponseBo PingBi(Integer fId, HttpServletRequest request){
        logger.info("开始进行好友屏蔽");
        try{
            FriendMap friendMap = new FriendMap();
            friendMap.setFriendmapid(fId);
            friendMap.setState(2);
            friendMapService.updateNotNull(friendMap);
            return ResponseBo.ok("屏蔽成功");
        }catch (Exception e){
            return ResponseBo.error("屏蔽失败");
        }

    }

    @RequestMapping("delete")
    @ResponseBody
    public ResponseBo delete(Integer fId, HttpServletRequest request){
        logger.info("开始进行好友删除");
        try{

            friendMapService.delete(fId);
            return ResponseBo.ok("删除成功");
        }catch (Exception e){
            return ResponseBo.error("删除失败");
        }

    }

    @RequestMapping("agree")
    @ResponseBody
    public ResponseBo addFriend(Integer friendmapid, HttpServletRequest request){
        try {
            HttpSession session = request.getSession();
            Users users = (Users) session.getAttribute("user");
            users.setApplyNum(users.getApplyNum()-1);
            session.setAttribute("user",users);
            FriendMap friendMap = friendMapService.selectByKey(friendmapid);
            friendMap.setState(1);
            friendMapService.updateNotNull(friendMap);
            return ResponseBo.ok("验证通过");
        }catch (Exception e){
            return ResponseBo.error("验证失败");
        }

    }
}

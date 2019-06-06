package com.library.mall.controller;

import com.github.pagehelper.PageHelper;
import com.library.mall.entity.FamilyMap;
import com.library.mall.entity.Users;
import com.library.mall.service.IFamilyMapService;
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
 * @Date:Created in 11:32 2019/5/24
 * @Modified By:
 */
@Controller
@RequestMapping("/familyMap")
public class FamilyMapController {

    //日志类
    public Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IFamilyMapService familyMapService;

    @Autowired
    private IUserService userService;

    /**
     * 查询我的所有亲情账号
     * @param queryRequest
     * @param familyMap
     * @return
     */
    @RequestMapping("findBySplitPage")
    @ResponseBody
    public ResponseBo findBySplitPage(QueryRequest queryRequest, FamilyMap familyMap, HttpServletRequest request){
        logger.info("开始进行好友信息查询");
        HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("user");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            PageHelper.startPage(queryRequest.getPageNum(),queryRequest.getPageSize());
            familyMap.setUserid(users.getUserId());
            List<FamilyMap> familyMaps = familyMapService.searchFamilys(familyMap);
            for(FamilyMap item:familyMaps){
                Users fr = userService.findUserById(item.getFamilyid());
                item.setUsers(fr);
                item.setCtime(simpleDateFormat.format(item.getAddtime()));
            }
            return ResponseBo.ok(familyMaps);
        }catch (Exception e){
            e.printStackTrace();
            return ResponseBo.error("查询失败，请联系管理员");
        }

    }
    @RequestMapping("addFamily")
    @ResponseBody
    public ResponseBo addFamily(FamilyMap familyMap, HttpServletRequest request){
        logger.info("开始进行加亲情账号申请");
        try{
            HttpSession session = request.getSession();
            Users users = (Users) session.getAttribute("user");
            if(users.getUserId()==familyMap.getFamilyid()){
                return ResponseBo.error("不可以添加自己为亲情账号");
            }
            familyMap.setFamilyid(users.getUserId());
            List<FamilyMap> familyMaps = familyMapService.searchFamilys(familyMap);
            if(familyMaps.size()>0){
                FamilyMap it = familyMaps.get(0);
                if(it.getState()==0){
                    return ResponseBo.error("亲情互联申请已发送，请勿重复申请");
                }else{
                    return ResponseBo.error("你们已是亲情账号");
                }
            }
            familyMap.setState(0);
            familyMap.setAddtime(new Date());
            familyMapService.save(familyMap);
            return ResponseBo.ok("发送成功");
        }catch (Exception e){
            return ResponseBo.error("发送失败");
        }

    }


    @RequestMapping("agree")
    @ResponseBody
    public ResponseBo addFamily(Integer familymapid, HttpServletRequest request){
        try {
            HttpSession session = request.getSession();
            Users users = (Users) session.getAttribute("user");
            users.setApplyNum(users.getApplyNum()-1);
            session.setAttribute("user",users);
            FamilyMap familyMap = familyMapService.selectByKey(familymapid);
            familyMap.setState(1);
            familyMapService.updateNotNull(familyMap);
            return ResponseBo.ok("验证通过");
        }catch (Exception e){
            return ResponseBo.error("验证失败");
        }

    }
}

package com.library.mall.controller;

import com.library.mall.entity.Goods;
import com.library.mall.entity.Guess;
import com.library.mall.entity.Subscribe;
import com.library.mall.entity.Users;
import com.library.mall.service.ISubscribeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 9:04 2019/5/29
 * @Modified By:
 */
@Controller
@RequestMapping("/subscribe")
public class SubscribeController {
    @Autowired
    private ISubscribeService subscribeService;

    /**
     * 根据登录用户获取其预约的所有图书
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("findSubscribes")
    @ResponseBody
    public List<Subscribe> findFavoriteGoods(Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        List<Subscribe> subscribeList = subscribeService.findAllSubscribeByUserId(user.getUserId());
        return subscribeList;
    }

    @RequestMapping("addToSubscribe")
    @ResponseBody
    public String addToSubscribe(Integer goodsId,HttpServletRequest request){
        HttpSession session = request.getSession();
        Users user=(Users) session.getAttribute("user");
        List<Subscribe> subscribeList = subscribeService.findAllSubscribeByUserIdAndGoodsId(user.getUserId(),goodsId);
        if(subscribeList.size()==0){
            Goods goods = new Goods();
            goods.setGoodsId(goodsId);
            Subscribe subscribe = new Subscribe(goods,user);
            Integer rs = subscribeService.saveSubscribe(subscribe);
            if(rs>0){
                return "success";
            }else{
                return "fail";
            }
        }else{
            return "success";
        }

    }
}

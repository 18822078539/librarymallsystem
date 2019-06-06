package com.library.mall.controller;

import com.github.pagehelper.PageHelper;
import com.library.mall.entity.*;
import com.library.mall.service.IShareBookService;
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
 * @Date:Created in 16:54 2019/5/31
 * @Modified By:
 */
@Controller
@RequestMapping("/shareBook")
public class ShareBookController {

    @Autowired
    private IShareBookService shareBookService;

    @RequestMapping("share")
    public String share(String bookName,HttpServletRequest request){
        HttpSession session = request.getSession();
        Users user=(Users) session.getAttribute("user");
        List<UserTask> taskList = shareBookService.findBookByUserIdAndName(user.getUserId(),bookName);
        if(taskList.size()==0){
            ShareBook shareBook = new ShareBook(bookName,user,2);
            Integer rs = shareBookService.saveShareBook(shareBook);
        }
        return "forward:/view/usercenter";

    }

    @RequestMapping("zhiding")
    @ResponseBody
    public String updateOrder(Integer shareBookId){
        try {
            shareBookService.updateAllShareBook();
            shareBookService.updateStatus(shareBookId);
            return "success";
        }catch (Exception e){
            return "fail";
        }
    }

    /**
     * 分页查询当前用户的分享图书
     * @param queryRequest
     * @return
     */
    @RequestMapping("findBySplitPage")
    @ResponseBody
    public ResponseBo findBySplitPage(QueryRequest queryRequest, HttpServletRequest request){
        HttpSession session = request.getSession();
        Users user=(Users) session.getAttribute("user");
        try {
            PageHelper.startPage(queryRequest.getPageNum(),queryRequest.getPageSize());
            List<ShareBook> shareBooks = shareBookService.findAllShareBookByUserId(user.getUserId());

            return ResponseBo.ok(shareBooks);
        }catch (Exception e){
            e.printStackTrace();
            return ResponseBo.error("查询失败，请联系管理员");
        }

    }

}

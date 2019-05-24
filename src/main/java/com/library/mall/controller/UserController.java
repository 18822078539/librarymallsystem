package com.library.mall.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.library.mall.entity.FriendMap;
import com.library.mall.service.IFriendMapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.library.mall.entity.Cart;
import com.library.mall.entity.Users;
import com.library.mall.service.ICartService;
import com.library.mall.service.IUserService;
import com.library.mall.util.MD5Utils;
import com.library.mall.util.RedisUtil;
import com.library.mall.util.UUIDUtil;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Controller
@RequestMapping("/user")
public class UserController {
	private static final String String = null;
	@Autowired
	private IUserService userService;

	@Autowired
	private IFriendMapService friendMapService;
	
	@RequestMapping("login")
	@ResponseBody
	public String login(String userName,String userPass,HttpServletRequest request){
		Users user = userService.login(userName, MD5Utils.passToMD5(userPass));
		if(user!=null){
			HttpSession session = request.getSession();
			//查询一下当前用户申请加好友人数
			FriendMap friendMap = new FriendMap();
			friendMap.setUserid(user.getUserId());
			friendMap.setState(0);
			List<FriendMap> applyNums = friendMapService.searchFriends(friendMap);
			user.setApplyNum(applyNums.size());
			session.setAttribute("user", user);
			return "success";
		}
		return "fail";
	}

	@RequestMapping("logout")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return "index";
	}
	
	@RequestMapping("amendinfo")
	public String preModifyInfo(HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		model.addAttribute("user", user);
		return "userview/amend_info";
	}
	@RequestMapping(value="upload",method={RequestMethod.POST})
	@ResponseBody
	public JSONObject uploadHeaderPic(@PathVariable(value="file")MultipartFile file,HttpServletRequest request){
		String str = file.getOriginalFilename();
		String name=UUIDUtil.getUUID()+str.substring(str.lastIndexOf("."));
		String path=request.getServletContext().getRealPath("/upload")+"/"+name;
		try {
			file.transferTo(new File(path));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		JSONObject obj=new JSONObject();
		obj.put("userImg", name);
		return obj;
	}
	@RequestMapping("updateUserInfo")
	public String updateUserInfo(Users user,Model model,HttpServletRequest request){
		Integer rs = userService.updateUserInfo(user);
		Users u = userService.findUserById(user.getUserId());
		HttpSession session = request.getSession();
		session.setAttribute("user", u);
		model.addAttribute("user", u);
		return "userview/amend_info";
	}
	@RequestMapping("modifyUserPass")
	@ResponseBody
	public String modifyUserPass(String oldPass,String newPass,String rePass,HttpServletRequest request){
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		if(MD5Utils.passToMD5(oldPass).equals(user.getUserPass()) && newPass.equals(rePass)){
			user.setUserPass(MD5Utils.passToMD5(newPass));
			userService.updateUserInfo(user);
			session.removeAttribute("user");
			return "success";
		}else{
			return "fail";
		}
	}
	@RequestMapping("findAllUser")
	@ResponseBody
	public JSONObject findAllUser(Integer page,Integer limit,String keyword){
		PageInfo<Users> info = userService.findAllUsersBySplitPage(page,limit,keyword);
		JSONObject obj=new JSONObject();
		obj.put("msg", "");
		obj.put("code", 0);
		obj.put("count",info.getTotal());
		obj.put("data", info.getList());
		return obj;
	}
	@RequestMapping("changeUserState")
	@ResponseBody
	public String changeUserState(Integer userId,Integer state){
		Integer rs = userService.changeUserState(state, userId);
		if(rs>0){
			return "success";
		}else{
			return "fail";
		}
	}
	@RequestMapping("updateUser")
	@ResponseBody
	public String updateUser(Users user){
		Integer rs = userService.updateUserInfo(user);
		if(rs>0){
			return "success";
		}else{
			return "fail";
		}
	}
	@RequestMapping("deleteUser")
	@ResponseBody
	public String deleteUser(Integer userId){
		Integer rs = userService.deleteUser(userId);
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
		for (String id : list) {
			Integer userId = Integer.valueOf(id);
			Integer rs = userService.deleteUser(userId);
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
	@RequestMapping("register")
	@ResponseBody
	public String register(Users user){
		user.setUserPass(MD5Utils.passToMD5(user.getUserPass()));
		Integer rs = userService.addUser(user);
		if(rs>0){
			return "success";
		}else{
			return "fail";
		}
	}
}

package com.library.mall.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.library.mall.entity.BaseConfig;
import com.library.mall.service.IBaseConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/baseconfig")
public class BaseConfigController {
	@Autowired
	private IBaseConfigService baseConfigService;
	
	@RequestMapping("findAllBaseConfigBySplitPage")
	@ResponseBody
	public JSONObject findAllBaseConfigBySplitPage(Integer page,Integer limit,String keyword){
		PageInfo<BaseConfig> info = baseConfigService.findAllBaseConfigBySplitePage(page, limit,keyword);
		JSONObject obj=new JSONObject();
		obj.put("code", 0);
		obj.put("msg", "");
		obj.put("data", info.getList());
		obj.put("count",info.getTotal());
		return obj;
	}
	@RequestMapping("updateBaseConfig")
	@ResponseBody
	public String updateBaseConfig(BaseConfig baseConfig){
		Integer rs = baseConfigService.updateBaseConfig(baseConfig);
		if(rs>0){
			return "success";
		}else{
			return "fail";
		}
	}

	@RequestMapping("deleteBaseConfig")
	@ResponseBody
	public String deleteBaseConfig(Integer configId){
		Integer rs = baseConfigService.deleteBaseConfig(configId);
		if(rs>0){
			return "success";
		}else{
			return "fail";
		}
	}
	@RequestMapping("batchDelete")
	@ResponseBody
	public String batchBaseConfig(String batchId){
		String[] list = batchId.split(",");
		boolean flag=true;
		for (String id : list) {
			Integer bannerId = Integer.valueOf(id);
			Integer rs = baseConfigService.deleteBaseConfig(bannerId);
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
	@RequestMapping("addBaseConfig")
	@ResponseBody
	public String addBaseConfig(BaseConfig baseConfig){
		Integer rs = baseConfigService.addBaseConfig(baseConfig);
		if(rs>0){
			return "success";
		}else{
			return "fail";
		}
	}
}

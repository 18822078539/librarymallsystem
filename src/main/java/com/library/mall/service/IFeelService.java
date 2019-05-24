package com.library.mall.service;

import com.library.mall.entity.Feel;
import com.library.mall.util.service.IService;

import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 17:20 2019/5/22
 * @Modified By:
 */
public interface IFeelService extends IService<Feel>{

    /**
     * 条件查询说说
     * @param feel
     * @return
     */
    List<Feel> searchFeel(Feel feel);
}

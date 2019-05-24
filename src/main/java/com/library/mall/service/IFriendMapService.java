package com.library.mall.service;

import com.library.mall.entity.FriendMap;
import com.library.mall.util.service.IService;

import java.util.List;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 11:28 2019/5/24
 * @Modified By:
 */
public interface IFriendMapService extends IService<FriendMap> {
    List<FriendMap> searchFriends(FriendMap friendMap);

}

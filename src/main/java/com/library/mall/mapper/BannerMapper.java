package com.library.mall.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.library.mall.entity.Banner;

@Repository
public interface BannerMapper {
	Integer addBanner(Banner banner);
	Integer deleteBanner(Integer id);
	Integer changeBannerState(Integer state, Integer id);
	Integer updateBanner(Banner banner);
	Banner findBannerById(Integer id);
	List<Banner> findAllBanner();
	List<Banner> findAllShowBanner();
	List<Banner> findAllBannerByLikeName(String name);
}

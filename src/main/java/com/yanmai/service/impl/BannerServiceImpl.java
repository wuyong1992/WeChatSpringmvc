package com.yanmai.service.impl;

import com.yanmai.mapper.BannerMapper;
import com.yanmai.model.Banner;
import com.yanmai.service.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Banner的service层
 * Created by admin on 2017/5/8.
 */

@Service
@Transactional
public class BannerServiceImpl implements BannerService {

    @Autowired
    private BannerMapper bannerMapper;

    @Override
    public void addBanner(Banner banner) {
        bannerMapper.addBanner(banner);
    }

    @Override
    public List<Banner> selectAllBanner() {
        return bannerMapper.selectAllBanner();
    }

    @Override
    public Banner selectBannerById(Integer id) {
        return bannerMapper.selectBannerById(id);
    }

    @Override
    public void updateBanner(Banner banner) {
        bannerMapper.updateBanner(banner);
    }

    @Override
    public void updateBannerStatus(Banner banner) {
        bannerMapper.updateBannerStatus(banner);
    }

    @Override
    public void updateBannerSort(Banner banner) {
        bannerMapper.updateBannerSort(banner);
    }

    @Override
    public void updateBannerLink(Banner banner) {
        bannerMapper.updateBannerLink(banner);
    }

    @Override
    public void deleteBannerById(Integer id) {
        bannerMapper.deleteBannerById(id);
    }
}

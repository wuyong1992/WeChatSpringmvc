package com.yanmai.service;

import com.yanmai.model.Banner;

import java.util.List;

/**
 *
 * Created by admin on 2017/5/8.
 */


public interface BannerService {

    //添加banner
    public void addBanner(Banner banner);

    //查看所有banner
    public List<Banner> selectAllBanner();

    //根据ID查找Banner
    public Banner selectBannerById(Integer id);

    //更新banner
    public void updateBanner(Banner banner);

    //更新banner的状态
    public void updateBannerStatus(Banner banner);

    //更新banner的排序
    public void updateBannerSort(Banner banner);

    //更新banner的连接
    public void updateBannerLink(Banner banner);

    //根据ID删除banner
    public void deleteBannerById(Integer id);

}

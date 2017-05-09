package com.yanmai.controller.adminController;

import com.yanmai.model.Banner;
import com.yanmai.service.BannerService;
import com.yanmai.util.StringUtil;
import com.yanmai.util.UploadUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Banner的控制层
 * Created by admin on 2017/5/8.
 */

@Controller
@RequestMapping(value = "admin")
public class BannerController {

    @Autowired
    private Banner banner;
    @Autowired
    private BannerService bannerService;


    //进入banner图列表
    @RequestMapping(value = "bannerList")
    public ModelAndView bannerList(){
        ModelAndView modelAndView =new ModelAndView();
        modelAndView.setViewName("admin/banner-list");

        List<Banner> banners =  bannerService.selectAllBanner();
        //一共有多少条记录
        Integer count = banners.size();
        modelAndView.addObject("banners",banners);
        modelAndView.addObject("count",count);

        return modelAndView;
    }

    //进入添加banner页面
    @RequestMapping(value = "goAddBanner")
    public String goAddBanner(){
        return "/admin/banner-add";
    }



    //添加banner
    @RequestMapping("addBanner")
    public String addBanner(Banner banner , MultipartFile file, HttpServletRequest request){

        String path = "C:\\apache-tomcat-8.0.14\\webapps\\bannerUpload\\";
        String fileName = UploadUtil.saveFile(file,request,path);
        String bannerPath = "http://localhost:8080/bannerUpload/"+fileName;    //本次测试

        //String bannerPath = "http://b.wujixuanyi.com/bannerUpload/"+fileName;     //服务器地址

        banner.setBannerPath(bannerPath);
        bannerService.addBanner(banner);

        return "redirect:/admin/bannerList";
    }

    //根据ID删除banner
    //@ResponseBody
    @RequestMapping(value = "deleteBannerById")
    public void deleteBannerById(@RequestParam(value = "id") Integer id, HttpServletResponse response) throws IOException {
        //System.out.println("ajax进入");

        //找出banner图所在位置，并删除该图
        banner = bannerService.selectBannerById(id);
        String bannerPath = banner.getBannerPath();
        String bannerName = StringUtil.getImgName(bannerPath);
        FileUtils.deleteQuietly(new File("C:\\apache-tomcat-8.0.14\\webapps\\bannerUpload\\"+bannerName));


        bannerService.deleteBannerById(id);

        //response.setContentType("text/html;charset=UTF-8");
        //response.getWriter().print("success");
        //return "redirect:/admin/bannerList";
    }


    //进入编辑banner页面Restful风格
    @RequestMapping(value = "bannerEditor/{id}")
    public ModelAndView goBannerEditor(@PathVariable("id") Integer id){
        ModelAndView modelAndView =new ModelAndView();
        modelAndView.setViewName("/admin/banner-editor");

        banner = bannerService.selectBannerById(id);
        modelAndView.addObject("banner",banner);
        return modelAndView;
    }


    //编辑后更新banner
    @RequestMapping(value = "bannerUpdate/{id}")
    public String editorBanner(@PathVariable("id") Integer id,Banner banner , MultipartFile file, HttpServletRequest request){
        //判断有没有更新图片
        if (!file.isEmpty()){
            //上传了新banner，删除原banner
            banner = bannerService.selectBannerById(id);
            String oldBannerPath = banner.getBannerPath();
            String bannerName = StringUtil.getImgName(oldBannerPath);
            FileUtils.deleteQuietly(new File("C:\\apache-tomcat-8.0.14\\webapps\\bannerUpload\\"+bannerName));
            //添加新的banner
            String path = "C:\\apache-tomcat-8.0.14\\webapps\\bannerUpload\\";
            String fileName = UploadUtil.saveFile(file,request,path);
            String newBannerPath = "http://localhost:8080/bannerUpload/"+fileName;    //本次测试

            //String newBannerPath = "http://b.wujixuanyi.com/bannerUpload/"+fileName;     //服务器地址

            banner.setBannerPath(newBannerPath);
        }

        //如果没上传新banner，则直接更新
        bannerService.updateBanner(banner);


        return "redirect:/admin/bannerList";
    }


    //banner图片发布与禁用
    @RequestMapping(value = "updateBannerStatus")
    public void updateStatus(@RequestParam(value = "id") Integer id){
        banner = bannerService.selectBannerById(id);
        if (banner.getStatus() == 0){
            banner.setStatus(1);
        }else {
            banner.setStatus(0);
        }
        bannerService.updateBannerStatus(banner);
    }



}

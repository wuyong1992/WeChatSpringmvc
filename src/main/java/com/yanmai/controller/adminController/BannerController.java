package com.yanmai.controller.adminController;

import com.yanmai.model.Banner;
import com.yanmai.service.BannerService;
import com.yanmai.util.StringUtil;
import com.yanmai.util.UploadUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

        modelAndView.addObject("banners",banners);

        return modelAndView;
    }

    //添加bannaer
    @RequestMapping("addBanner")
    public String addBanner(Banner banner , MultipartFile file, HttpServletRequest request){
        String path = "C:\\apache-tomcat-8.0.14\\webapps\\bannerUpload\\";
        String fileName = UploadUtil.saveFile(file,request,path);
        String bannerPath = "localhost:8080/bannerUpload/"+fileName;    //本次测试

        //String bannerPath = "http://b.wujixuanyi.com/bannerUpload/"+fileName;     //服务器地址

        banner.setBannerPath(bannerPath);
        bannerService.addBanner(banner);

        return "redirect:/admin/banner-list";
    }

    //根据ID删除banner
    @ResponseBody
    @RequestMapping(value = "deleteBannerById")
    public String deleteBannerById(@RequestParam(value = "id") Integer id, HttpServletResponse response) throws IOException {
        System.out.println("ajax进入");

        //找出banner图所在位置，并删除该图
        banner = bannerService.selectBannerById(id);
        String bannerPath = banner.getBannerPath();
        String bannerName = StringUtil.getImgName(bannerPath);
        FileUtils.deleteQuietly(new File("C:\\apache-tomcat-8.0.14\\webapps\\bannerUpload\\"+bannerName));


        bannerService.deleteBannerById(id);

        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print("success");
        return "redirect:/admin/banner-list";
    }



    //编辑banner图
    @RequestMapping(value = "bannerEditor")
    public String editorBanner(){
        bannerService.updateBanner(banner);
        return "redirect:/admin/banner-list";
    }



    //添加banner处理controller（暂无）
    @RequestMapping(value = "bannerHandle")
    public String bannerHandle(){
        System.out.println("banner图已收到");
        return "redirect:/admin/banner-list";
    }


}

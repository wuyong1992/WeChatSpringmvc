package com.yanmai.controller.adminController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

/**
 * Created by admin on 2017/5/6.
 */

@Controller
@RequestMapping(value = "admin")
public class ArticleController {

    //文章列表
    @RequestMapping(value = "article-list")
    public String articleList(){
        System.out.println("文章列表");
        return "admin/article-list";
    }

    //添加文章页面
    @RequestMapping(value = "article-add")
    public String articleAdd(){
        return "admin/article-add";
    }

    //添加文章处理controller
    @RequestMapping(value = "articleHandle")
    public String articleHandle(){
        System.out.println("文章已收到");
        return "redirect:/admin/article-list";
    }

    //查看编辑文章
    @RequestMapping(value = "article-editor")
    public String articleEditor(){
        return "admin/article-editor";
    }

    //文章上传
    @RequestMapping(value = "articleUpload")
    public String articleUpload(@RequestParam("file") MultipartFile[] files, HttpServletRequest request){

        System.out.println("进入文章上传");

        String upaloadUrl = "C:\\apache-tomcat-8.0.14\\webapps\\articleUpload\\";

        //UploadUtil.uploadImg(request,upaloadUrl);

        /*MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());

        MultipartHttpServletRequest multipartRequest = resolver.resolveMultipart(request);

        MultipartFile file = multipartRequest.getFile("fileList");*/

        if(files!=null&&files.length>0){
            //循环获取file数组中得文件
            for(int i = 0;i<files.length;i++){
                MultipartFile file = files[i];
                //保存文件
                saveFile(file,request);
            }
        }

        String text = request.getParameter("editorValue");
        System.out.println(text);

        return "redirect:/admin/article-list";

    }

    //富文本编辑器中的内容
    @RequestMapping(value = "editorHTML")
    public String editorValue(HttpServletRequest request, HttpServletResponse response){

        //接收文本内容
        String text = request.getParameter("editorValue");
        System.out.println(text);

        return "redirect:/admin/admin-list";
    }

    //富文本编辑器中的图片上传


    private boolean saveFile(MultipartFile file ,HttpServletRequest request) {
        // 判断文件是否为空
        if (!file.isEmpty()) {
            try {
                // 文件保存路径
                String filePath = "C:\\apache-tomcat-8.0.14\\webapps\\articleUpload\\" + file.getOriginalFilename();
                // 转存文件
                file.transferTo(new File(filePath));
                return true;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }
    @RequestMapping("filesUpload")
    public String filesUpload(@RequestParam("files") MultipartFile[] files,HttpServletRequest request) {
        //判断file数组不能为空并且长度大于0
        if(files!=null&&files.length>0){
            //循环获取file数组中得文件
            for(int i = 0;i<files.length;i++){
                MultipartFile file = files[i];
                //保存文件
                saveFile(file,request);
            }
        }
        // 重定向
        return "redirect:/list.html";
    }


}

package com.yanmai.controller.adminController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.UUID;

/**
 * 富文本编辑器上传
 * TODO jsp页面原先引用ueditor的修改为wangEditor
 * Created by wuyong on 2017/5/5.
 */


@Controller
@RequestMapping(value = "admin")
public class EditorUploadController {


    //@ResponseBody
    @RequestMapping(value = "uploadImg")
    public void editorUploadImg(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        System.out.println("请求收到");

        //处理图片
        MultipartHttpServletRequest Murequest = (MultipartHttpServletRequest)request;
        Map<String, MultipartFile> files = Murequest.getFileMap();//得到文件map对象

        //String upaloadUrl = "E:\\uploadTemp\\";//本地文件存放位置
        String upaloadUrl = "C:\\apache-tomcat-8.0.14\\webapps\\editorUpload\\";//本地文件存放位置
        File dir = new File(upaloadUrl);
        if(!dir.exists())//目录不存在则创建
            dir.mkdirs();
        for(MultipartFile file :files.values()){
            String fileName=file.getOriginalFilename();
            //使用随机字符串生产新的文件名
            String newFileName = UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
            File tagetFile = new File(upaloadUrl+newFileName);//创建文件对象
            if(!tagetFile.exists()){//文件名不存在 则新建文件，并将文件复制到新建文件中
                try {
                    tagetFile.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                try {
                    file.transferTo(tagetFile);
                } catch (IllegalStateException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            System.out.println("ok!");
            //response.getWriter().write("/files/" + newFileName); //返回本地
            response.getWriter().write("http://b.wujixuanyi.com/editorUpload/" + newFileName); //返回服务器

        }
    }


    @RequestMapping(value = "editorHTML")
    public String editorValue(HttpServletRequest request, HttpServletResponse response){

        //接收文本内容
        String text = request.getParameter("editorValue");
        System.out.println(text);

        return "redirect:/admin/admin-list";
    }




//    @RequestMapping(value = "test")

    /*public void test(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("textml;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        System.out.println("get请求");

        //接收文本内容
        String text = request.getParameter("editorValue");
        System.out.println(text);

        MultipartHttpServletRequest Murequest = (MultipartHttpServletRequest)request;
        Map<String, MultipartFile> files = Murequest.getFileMap();//得到文件map对象

        String upaloadUrl = "E:\\uploadTemp\\";//文件存放位置
        File dir = new File(upaloadUrl);
        if(!dir.exists())//目录不存在则创建
            dir.mkdirs();
        for(MultipartFile file :files.values()){
            String fileName=file.getOriginalFilename();
            //使用随机字符串生产新的文件名
            String newFileName = UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
            File tagetFile = new File(upaloadUrl+newFileName);//创建文件对象
            if(!tagetFile.exists()){//文件名不存在 则新建文件，并将文件复制到新建文件中
                try {
                    tagetFile.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                try {
                    file.transferTo(tagetFile);
                } catch (IllegalStateException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            System.out.println("ok!");
            response.getWriter().write("/files/" + newFileName);

        }
    }*/



}

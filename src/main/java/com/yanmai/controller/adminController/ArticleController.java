package com.yanmai.controller.adminController;

import com.yanmai.model.Article;
import com.yanmai.service.ArticleService;
import com.yanmai.util.DateUtils;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 文章处理器
 * Created by admin on 2017/5/6.
 */

@Controller
@RequestMapping(value = "admin")
public class ArticleController {

    @Autowired
    private Article article;
    @Autowired
    private ArticleService articleService;

    //文章列表
    @RequestMapping(value = "articleList")
    public ModelAndView articleList() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/article-list");

        List<Article> articles = articleService.selectAllArticle();
        modelAndView.addObject("articles", articles);
        modelAndView.addObject("size", articles.size());
        return modelAndView;
    }

    //添加文章页面
    @RequestMapping(value = "articleAdd")
    public String articleAdd() {
        return "admin/article-add";
    }

   /* //添加文章处理controller
    @RequestMapping(value = "articleHandle")
    public String articleHandle() {
        System.out.println("文章已收到");
        return "redirect:/admin/articleList";
    }*/

    //进入查看编辑文章
    @RequestMapping(value = "goArticleEditor/{id}")
    public String goArticleEditor(@PathVariable("id") Integer id) {


        return "admin/article-editor";
    }

    //查看编辑文章
    /*@RequestMapping(value = "articleEditor")
    public String articleEditor() {
        return "admin/article-editor";
    }*/

    //文章上传
    @RequestMapping(value = "articleUpload")
    public String articleUpload(@RequestParam("file") MultipartFile[] files, HttpServletRequest request, Article article) {
        System.out.println("进入文章上传");

        if(article.getImgType() == null){
            article.setImgType(2);
        }

        //设置文章的操作时间
        article.setUpdateTime(DateUtils.format(new Date(), "yyyy-MM-dd hh:mm:ss"));

        ArrayList temp = new ArrayList();
        //设置文章图片的上传路劲
        String upaloadUrl = "C:\\apache-tomcat-8.0.14\\webapps\\articleUpload\\";

        //循环上传图片
        if (files != null && files.length > 0) {
            //循环获取file数组中得文件
            for (int i = 0; i < files.length; i++) {
                MultipartFile file = files[i];
                //保存文件
                String imgName = UploadUtil.saveFile(file, request, upaloadUrl);
                if (imgName != null && !"".equals(imgName)){
                    temp.add("http://b.wujixuanyi.com/articleUpload/" + imgName);
                }
            }
        }

        String imgPath = (String) temp.get(0);
        if (article.getImgType() == 3){
            for (int i = 1; i < temp.size(); i++) {
                imgPath += ("," + temp.get(i));
            }
        }

        article.setImgPath(imgPath);
        System.out.println(imgPath);

        articleService.addArticle(article);
        return "redirect:/admin/articleList";

    }





    //更新文章的状态
    @RequestMapping(value = "updateArticleStatus")
    public void updateArticleStatus(@RequestParam(value = "id") Integer id) {
        article = articleService.selectArticleById(id);
        if (article.getStatus() == 0) {
            article.setStatus(1);
        } else {
            article.setStatus(0);
        }
        articleService.updateArticleStatus(article);
    }

    //删除文章
    @RequestMapping(value = "deleteArticleById")
    public void deleteArticleById(@RequestParam(value = "id") Integer id, HttpServletResponse response) throws IOException {

        //找出该文章图所在位置，并删除该图
        article = articleService.selectArticleById(id);

        //判断该图片类型
        if (article.getImgType() == 3) {
            //如果是类型3，有三张图
            String[] imgPaths = article.getImgPath().split(",");
            for (String imgPath : imgPaths) {
                String imgName = StringUtil.getImgName(imgPath);
                FileUtils.deleteQuietly(new File("C:\\apache-tomcat-8.0.14\\webapps\\articleUpload\\" + imgName));
            }
        } else {
            String imgPath = article.getImgPath();
            String imgName = StringUtil.getImgName(imgPath);
            FileUtils.deleteQuietly(new File("C:\\apache-tomcat-8.0.14\\webapps\\articleUpload\\" + imgName));
        }

        articleService.deleteArticleById(id);
    }

    //富文本编辑器中的图片上传
    @RequestMapping("filesUpload")
    public String filesUpload(@RequestParam("files") MultipartFile[] files, HttpServletRequest request) {
        String upaloadUrl = "C:\\apache-tomcat-8.0.14\\webapps\\articleUpload\\";
        //判断file数组不能为空并且长度大于0
        if (files != null && files.length > 0) {
            //循环获取file数组中得文件
            for (int i = 0; i < files.length; i++) {
                MultipartFile file = files[i];
                //保存文件
                UploadUtil.saveFile(file, request, upaloadUrl);
            }
        }
        // 重定向
        return "redirect:/list.html";
    }

    /*//富文本编辑器中的内容
    @RequestMapping(value = "editorHTML")
    public String editorValue(HttpServletRequest request, HttpServletResponse response) {

        //接收文本内容
        String text = request.getParameter("content");
        System.out.println(text);

        return "redirect:/admin/admin-list";
    }*/




}

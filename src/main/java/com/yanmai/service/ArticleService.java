package com.yanmai.service;

import com.yanmai.model.Article;

import java.util.List;

/**
 * 文章service接口
 * Created by admin on 2017/5/9.
 */

public interface ArticleService {

    //查找所有文章
    public List<Article> selectAllArticle();

    //查找所有分类为1（首页）的文章
    public List<Article> selectArticleType1();

    //查找所有分类为2（每日动态）的文章
    public List<Article> selectArticleType2();

    //查找所有分类为3（产品介绍）的文章
    public List<Article> selectArticleType3();

    //查找所有分类为4（玄灸图谱）的文章
    public List<Article> selectArticleType4();

    //根据ID查找该文章
    public Article selectArticleById(Integer id);

    //添加文章
    public void addArticle(Article article);

    //更新文章
    public void updateArticle(Article article);

    //更新文章状态
    public void updateArticleStatus(Article article);

}

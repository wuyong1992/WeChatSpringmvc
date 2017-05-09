package com.yanmai.service.impl;

import com.yanmai.mapper.ArticleMapper;
import com.yanmai.model.Article;
import com.yanmai.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 文章实现类
 * Created by admin on 2017/5/9.
 */
@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public List<Article> selectAllArticle() {
        return articleMapper.selectAllArticle();
    }

    @Override
    public List<Article> selectArticleType1() {
        return articleMapper.selectArticleType1();
    }

    @Override
    public List<Article> selectArticleType2() {
        return articleMapper.selectArticleType2();
    }

    @Override
    public List<Article> selectArticleType3() {
        return articleMapper.selectArticleType3();
    }

    @Override
    public List<Article> selectArticleType4() {
        return articleMapper.selectArticleType4();
    }

    @Override
    public Article selectArticleById(Integer id) {
        return articleMapper.selectArticleById(id);
    }

    @Override
    public void addArticle(Article article) {
        articleMapper.addArticle(article);
    }

    @Override
    public void updateArticle(Article article) {
        articleMapper.updateArticle(article);
    }

    @Override
    public void updateArticleStatus(Article article) {
        articleMapper.updateArticleStatus(article);
    }
}

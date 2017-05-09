package com.yanmai.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

/**
 * 文章类
 * Created by admin on 2017/5/9.
 */
@Component
@Getter@Setter
public class Article {

    private Integer id;
    private String title;           //标题
    private String intro;           //简介
    private Integer counts;           //文章转载次数
    private Integer articleType;    //文章分类  1.首页  2.每日动态  3.产品介绍  4.玄灸图谱
    private Integer imgType;        //图片排版类型    1.大图    2.  侧位单图    3.下方三图
    private String imgPath;         //图片地址
    private Integer sort;           //文章排序
    private String content;         //文章内容
    private String updateTime;       //操作时间
    private Integer status;       //文章状态

}

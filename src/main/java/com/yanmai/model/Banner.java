package com.yanmai.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

/**
 * Banner图实体类
 * Created by admin on 2017/5/8.
 */
@Component
@Getter@Setter
public class Banner {

    private Integer id;              //id
    private String bannerPath;      //banner图地址
    private Integer status;         //banner图状态，0表示禁用，1表示使用
    private String link;            //链接地址
    private Integer sort;           //banner排序

}

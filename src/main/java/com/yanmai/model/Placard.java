package com.yanmai.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

/**
 * 海报类
 * Created by admin on 2017/4/25.
 */

@Component
@Getter
@Setter
public class Placard {

    private Integer id;     //海报id
    private String address;     //海报地址
    private String scaleAddress;     //海报缩略地址

    private Integer pressWidth;     //水印图片的宽度
    private Integer pressHeight;    //水印图片的高度

    private Integer imgX;       //头像水印的X距离
    private Integer imgY;       //头像水印的Y距离

    private Integer QRcodeX;    //二维码水印的X距离
    private Integer QRcodeY;    //二维码水印的Y距离

}

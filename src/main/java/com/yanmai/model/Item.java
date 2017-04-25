package com.yanmai.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

/**
 * 商品类
 * Created by admin on 2017/4/21.
 */
@Component
@Getter@Setter
public class Item {

    private String id;               //商品id
    private String body;            //商品信息
    private float totalFee;            //标价金额（现价，优惠价）
    private float originalTotalFee;            //原价

}

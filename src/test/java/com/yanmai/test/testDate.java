package com.yanmai.test;


import com.yanmai.util.DateUtils;

import java.util.Date;

/**
 * Created by admin on 2017/4/24.
 */
public class testDate {

    public static void main(String[] args) {

        System.out.println(DateUtils.format(new Date() ,"yyyy-MM-dd HH:mm:ss"));
//        System.out.println(new Date(2143131231056L));
//        System.out.println(DateUtils.smartFormat("20141030133525"));
//        System.out.println(DateUtils.getShortYMDDiffDay("20141030",365));
//        System.out.println(DateUtils.addDate(new Date(),365));

//        System.out.println(DateUtils.getShortYMD());
    }
}

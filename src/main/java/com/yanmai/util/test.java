package com.yanmai.util;

import java.util.Date;

/**
 * Created by admin on 2017/3/31.
 */
public class test {

    public static void main(String[] args) {
        Date date = new Date();

        String now = DateUtils.formatDateTime(date);
        System.out.print(now);
    }
}

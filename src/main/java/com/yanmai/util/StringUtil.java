package com.yanmai.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by admin on 2017/4/19.
 */
public class StringUtil {

    public static Boolean endWithNum(String str) {
        Boolean flag = true;

        Pattern pattern = Pattern.compile("\\d+$");
        Matcher matcher = pattern.matcher(str);

        if (matcher.find()) {
            flag = true;
        } else {
            flag = false;
        }
        return flag;
    }

    //以"/"分割字符串，获取图片路径的图片名
    public static String getImgName(String str){
        String[] strings = str.split("/");
        int i = strings.length-1;
        String s = strings[i];
        return s;
    }
}

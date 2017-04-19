package com.yanmai.test;

import com.yanmai.util.StringUtil;

/**
 * Created by admin on 2017/4/19.
 */
public class testString {
    public static void main(String[] args){
        String sa = new String("http://wx.qlogo.cn/mmopen/77GShSOXQAicAZIdzx6pHFlk4b9HiaicCaiaWUoibE61HcuNFYmOkvX3XnWgw2Z95lrBroY4WMl41YsYGvrGMKV4SAmLNLzamh7g1/0");
        String sb = new String("http://b.wujixuanyi.com/img/vCB0x1OrQRKSRmHdmIcVySJJiIvw6HUaKy617a8Bv0AtCOkOsdmpFo-N0Wt6ckvD7304859614062679177.jpg");

        if (StringUtil.endWithNum(sa)){
            System.out.println("sa is yes");
        }else {
            System.out.println("sa is not");
        }
        if (StringUtil.endWithNum(sb)){
            System.out.println("sb is yes");
        }else {
            System.out.println("sb is not");
        }

        /*String[] strings = sb.split("/");
        int i = strings.length-1;
        String s = strings[i];
        System.out.println(s);
        for (String string : strings){
            System.out.println(string);
        }*/
        String s = StringUtil.getImgName(sb);
        System.out.println(s);

        /*File file = new File("E:\\test\\"+s);
        FileUtils.deleteQuietly(file);*/

    }
}

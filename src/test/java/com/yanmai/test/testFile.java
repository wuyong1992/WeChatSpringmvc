package com.yanmai.test;

import java.io.File;
import java.io.IOException;

/**
 * Created by admin on 2017/4/19.
 */
public class testFile {
    public static void main(String[] args) throws IOException {
        File file = new File("E:\\test\\banner_01.jpg");
        if (file.exists()){
            System.out.println("存在");
        }else {
            System.out.println("no");
        }


       /* System.out.println(file.getPath());
        System.out.print(file.getName());*/

       /* //复制文件
        FileUtils.copyFile(file,new File("D:\\test\\"+file.getName()));
        //删除文件或文件夹
        FileUtils.deleteQuietly(new File("D:\\test\\testFile.txt"));*/

       //copy & delete src
       /* FileUtil.copyFileAndDelSrcFile(file,"D:\\test");*/

    }
}

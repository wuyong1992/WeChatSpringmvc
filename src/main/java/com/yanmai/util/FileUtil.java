package com.yanmai.util;

import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;

/**
 * Created by admin on 2017/4/19.
 */
public class FileUtil {

    public static void copyFileAndDelSrcFile(File file,String destFilPath) throws IOException {
        //获取名称
        String fileName = file.getName();
        //copy文件
        FileUtils.copyFile(file,new File(destFilPath+"\\"+fileName));
        //删除源文件
        FileUtils.deleteQuietly(file);

    }

}

package com.yanmai.util;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

/**
 * Created by admin on 2017/5/6.
 */
public class UploadUtil {

    public static String uploadImg(HttpServletRequest request,String uploadUrl){

        Integer count = 0;  //用来计数，上传了几张图片
        MultipartHttpServletRequest Murequest = (MultipartHttpServletRequest)request;
        Map<String, MultipartFile> files = Murequest.getFileMap();//得到文件map对象

        //文件存放位置
        File dir = new File(uploadUrl);
        if(!dir.exists())//目录不存在则创建
            dir.mkdirs();
        for(MultipartFile file :files.values()){
            count++;
            String fileName=file.getOriginalFilename();
            //使用随机字符串生产新的文件名
            String newFileName = UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
            File tagetFile = new File(uploadUrl+newFileName);//创建文件对象
            if(!tagetFile.exists()){//文件名不存在 则新建文件，并将文件复制到新建文件中
                try {
                    tagetFile.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                try {
                    file.transferTo(tagetFile);         //将文件写入
                    return newFileName;
                } catch (IllegalStateException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }


}

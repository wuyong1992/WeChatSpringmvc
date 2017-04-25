package com.yanmai.test;

import org.junit.Test;

/**
 * Created by admin on 2017/4/25.
 */
public class testQRcodeImg {

    @Test
    public void scaleImg(){
        /*ImageUtils.scale("E:\\testImg\\placard1.jpg","E:\\testImg\\placard_scale1.jpg",10,false);
        ImageUtils.scale("E:\\testImg\\placard2.jpg","E:\\testImg\\placard_scale2.jpg",10,false);
        ImageUtils.scale("E:\\testImg\\placard3.jpg","E:\\testImg\\placard_scale3.jpg",10,false);
        ImageUtils.scale("E:\\testImg\\placard4.jpg","E:\\testImg\\placard_scale4.jpg",10,false);
        ImageUtils.scale("E:\\testImg\\placard5.jpg","E:\\testImg\\placard_scale5.jpg",10,false);
        ImageUtils.scale("E:\\testImg\\placard6.jpg","E:\\testImg\\placard_scale6.jpg",10,false);
        ImageUtils.scale("E:\\testImg\\placard7.jpg","E:\\testImg\\placard_scale7.jpg",10,false);
        ImageUtils.scale("E:\\testImg\\placard8.jpg","E:\\testImg\\placard_scale8.jpg",10,false);
        ImageUtils.scale("E:\\testImg\\placard9.jpg","E:\\testImg\\placard_scale9.jpg",10,false);
        ImageUtils.scale("E:\\testImg\\placard10.jpg","E:\\testImg\\placard_scale10.jpg",10,false);*/
    }


    /*public static void main(String[] args) {

        //将头像改成700*700一样大
        ImageUtils.scale2("E:\\test\\img.jpg","E:\\test\\img_res.jpg",700,700,true);

        //将二维码改成700*700一样大
        ImageUtils.scale2("E:\\test\\QRcode.png","E:\\test\\QRcode_res.png",700,700,true);

        //先将二维码做成水印1
        ImageUtils.pressImage("E:\\test\\QRcode_res.png","E:\\test\\placard.jpg","E:\\test\\placard_dest.jpg",2700,4000,1);

        //将水印1与头像组成水印2
        ImageUtils.pressImage("E:\\test\\img_res.jpg","E:\\test\\placard_dest.jpg","E:\\test\\placard_dest.jpg",100,4000,1);

        //将文字添加在水印2上
        ImageUtils.pressText("吴勇",
                "E:\\test\\placard_dest.jpg",
                "E:\\test\\placard_dest.jpg",
                "黑体",
                Font.BOLD,
                Color.BLACK,
                80,
                100,
                4800,
                1
        );
        ImageUtils.pressText("13365731570",
                "E:\\test\\placard_dest.jpg",
                "E:\\test\\placard_dest.jpg",
                "黑体",
                Font.BOLD,
                Color.BLACK,
                80,
                100,
                4900,
                1
        );
        ImageUtils.pressText("长按二维码识别添加好友",
                "E:\\test\\placard_dest.jpg",
                "E:\\test\\placard_dest.jpg",
                "黑体",
                Font.BOLD,
                Color.BLACK,
                80,
                2600,
                4900,
                1
        );

    }*/
}

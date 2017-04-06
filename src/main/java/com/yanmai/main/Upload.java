package com.yanmai.main;

import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 上传素材
 * Created by admin on 2017/3/31.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class Upload {

    @Autowired
    private WxMpService wxMpService;

    /**
     * 上传客服图片，并获取media_id
     * @throws WxErrorException
     */
   /* @Test
    public void uploadMaterial() throws WxErrorException {
        WxMpMaterial wxMaterial = new WxMpMaterial();
        File file = new File("C:\\Users\\admin\\Desktop\\工作\\wechatImages\\kf.jpg");
        wxMaterial.setFile(file);
        wxMaterial.setName("kefu");
        WxMpMaterialUploadResult res = wxMpService.getMaterialService().materialFileUpload(WxConsts.MEDIA_IMAGE, wxMaterial);

        System.out.println("kf.jpg的media_id:"+res.getMediaId());
    }*/
    /*@Test
    public void uploadMaterial() throws WxErrorException {
        WxMpMaterial wxMaterial = new WxMpMaterial();
        File file = new File("E:\\github\\WeChatDemoSpringMVC\\src\\main\\webapp\\images\\banner_01.jpg");
        wxMaterial.setFile(file);
        wxMaterial.setName("banner_01");
        WxMpMaterialUploadResult res = wxMpService.getMaterialService().materialFileUpload(WxConsts.MEDIA_IMAGE, wxMaterial);

        System.out.println("banner_01的url:"+res.getUrl());
    }*/

}

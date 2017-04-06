package com.yanmai.main;

import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.bean.menu.WxMenu;
import me.chanjar.weixin.common.bean.menu.WxMenuButton;
import me.chanjar.weixin.mp.api.WxMpService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by admin on 2017/3/30.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MenuConfig {

    @Autowired
    private WxMpService wxMpService;

    //运行该单元测试，可以建立菜单
    /*@Test
    public void menuSetUp() throws WxErrorException {
        wxMpService.getMenuService().menuCreate(creatMenu());
    }*/


    public WxMenu creatMenu (){

        //第一个菜单
        WxMenuButton wxMenuButton1 = new WxMenuButton();
        wxMenuButton1.setName("我的微站");
        wxMenuButton1.setType(WxConsts.BUTTON_VIEW);
        wxMenuButton1.setUrl("http://yanmai.wechat.com.ngrok.cc/main");

        //第二个菜单
        WxMenuButton wxMenuButton2 = new WxMenuButton();
        wxMenuButton2.setName("升级开通");
        wxMenuButton2.setType(WxConsts.BUTTON_VIEW);
        wxMenuButton2.setUrl("https://www.baidu.com/");

        //第三个菜单，分5个二级自菜单
        WxMenuButton wxMenuButton3 = new WxMenuButton();
        wxMenuButton3.setName("用户中心");

        //二级菜单
        WxMenuButton wxMenuButton3_1 = new WxMenuButton();
        wxMenuButton3_1.setName("我的海报");
        wxMenuButton3_1.setType(WxConsts.BUTTON_VIEW);
        wxMenuButton3_1.setUrl("https://www.baidu.com/");
        WxMenuButton wxMenuButton3_2 = new WxMenuButton();
        wxMenuButton3_2.setName("个人中心");
        wxMenuButton3_2.setType(WxConsts.BUTTON_VIEW);
        wxMenuButton3_2.setUrl("http://yanmai.wechat.com.ngrok.cc/userInfo");
        WxMenuButton wxMenuButton3_3 = new WxMenuButton();
        wxMenuButton3_3.setName("我的订单");
        wxMenuButton3_3.setType(WxConsts.BUTTON_VIEW);
        wxMenuButton3_3.setUrl("https://www.baidu.com/");
        WxMenuButton wxMenuButton3_4 = new WxMenuButton();
        wxMenuButton3_4.setName("人工客服");
        wxMenuButton3_4.setType(WxConsts.BUTTON_CLICK);
        wxMenuButton3_4.setKey("key4_4");
        WxMenuButton wxMenuButton3_5 = new WxMenuButton();
        wxMenuButton3_5.setName("使用帮助");
        wxMenuButton3_5.setType(WxConsts.BUTTON_VIEW);
        wxMenuButton3_5.setUrl("https://www.baidu.com/");

        //整合第三个菜单
        List<WxMenuButton> subButtons = new ArrayList();
        subButtons.add(wxMenuButton3_1);
        subButtons.add(wxMenuButton3_2);
        subButtons.add(wxMenuButton3_3);
        subButtons.add(wxMenuButton3_4);
        subButtons.add(wxMenuButton3_5);
        wxMenuButton3.setSubButtons(subButtons);

        //整合所有菜单
        WxMenu wxMenu = new WxMenu();
        List<WxMenuButton> buttons = new ArrayList();
        buttons.add(wxMenuButton1);
        buttons.add(wxMenuButton2);
        buttons.add(wxMenuButton3);
        wxMenu.setButtons(buttons);

        return wxMenu;
    }

}

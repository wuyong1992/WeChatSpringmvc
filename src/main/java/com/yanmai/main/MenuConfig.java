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
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class MenuConfig {

    @Autowired
    private WxMpService wxMpService;

    //运行该单元测试，可以建立菜单
    /*@Test
    public void menuSetUp() throws WxErrorException {
        wxMpService.getMenuService().menuCreate(creatMenu());
    }*/


    public WxMenu creatMenu() {

        //第一个菜单
        WxMenuButton wxMenuButton1 = new WxMenuButton();
        wxMenuButton1.setName("我的微站");
        wxMenuButton1.setType(WxConsts.BUTTON_VIEW);
        wxMenuButton1.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxd94942f3d437c924&redirect_uri=http%3A%2F%2Fb.wujixuanyi.com%2FgetMainAccessToken&response_type=code&scope=snsapi_base#wechat_redirect四月 14, 2017 10:37:41 下午 org.springframework.context.support.GenericApplicationContext doClose");

        //第二个菜单
        WxMenuButton wxMenuButton2 = new WxMenuButton();
        wxMenuButton2.setName("升级开通");
        wxMenuButton2.setType(WxConsts.BUTTON_VIEW);
        wxMenuButton2.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxd94942f3d437c924&redirect_uri=http%3A%2F%2Fb.wujixuanyi.com%2FgoOpen&response_type=code&scope=snsapi_base#wechat_redirect16:52:37.543 [Thread-2] INFO com.alibaba.druid.pool.DruidDataSource - {dataSource-1} closed");

        //第三个菜单，分5个二级自菜单
        WxMenuButton wxMenuButton3 = new WxMenuButton();
        wxMenuButton3.setName("用户中心");

        //二级菜单
        WxMenuButton wxMenuButton3_1 = new WxMenuButton();
        wxMenuButton3_1.setName("我的海报");
        wxMenuButton3_1.setType(WxConsts.BUTTON_VIEW);
        wxMenuButton3_1.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxd94942f3d437c924&redirect_uri=http%3A%2F%2Fb.wujixuanyi.com%2FgoPlacard&response_type=code&scope=snsapi_base#wechat_redirect15:02:54.340 [Thread-2] INFO com.alibaba.druid.pool.DruidDataSource - {dataSource-1} closed");
        WxMenuButton wxMenuButton3_2 = new WxMenuButton();
        wxMenuButton3_2.setName("个人中心");
        wxMenuButton3_2.setType(WxConsts.BUTTON_VIEW);
        wxMenuButton3_2.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxd94942f3d437c924&redirect_uri=http%3A%2F%2Fb.wujixuanyi.com%2FuserInfo&response_type=code&scope=snsapi_base#wechat_redirect");
        WxMenuButton wxMenuButton3_3 = new WxMenuButton();
        wxMenuButton3_3.setName("我的订单");
        wxMenuButton3_3.setType(WxConsts.BUTTON_VIEW);
        wxMenuButton3_3.setUrl("https://www.baidu.com/");
        WxMenuButton wxMenuButton3_4 = new WxMenuButton();
        wxMenuButton3_4.setName("人工客服");
        wxMenuButton3_4.setType(WxConsts.BUTTON_CLICK);
        wxMenuButton3_4.setKey("key4_4");
        WxMenuButton wxMenuButton3_5 = new WxMenuButton();
        wxMenuButton3_5.setName("联系我们");
        wxMenuButton3_5.setType(WxConsts.BUTTON_VIEW);
        wxMenuButton3_5.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxd94942f3d437c924&redirect_uri=http%3A%2F%2Fb.wujixuanyi.com%2FgoContactUs&response_type=code&scope=snsapi_base#wechat_redirect14:10:31.479 [Thread-2] INFO com.alibaba.druid.pool.DruidDataSource - {dataSource-1} closed");

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

    //运行获取 网页授权url

    /*@Test
    public void getUrl() throws WxErrorException {
        String url = wxMpService.oauth2buildAuthorizationUrl("http://b.wujixuanyi.com/goPlacard", WxConsts.OAUTH2_SCOPE_BASE, null);
        System.out.print(url);
    }*/


}

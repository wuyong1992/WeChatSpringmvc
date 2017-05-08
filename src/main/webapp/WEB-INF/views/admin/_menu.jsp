<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/5/3
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="Hui-aside">

    <div class="menu_dropdown bk_2">
        <dl id="menu-user">
            <dt><i class="Hui-iconfont">&#xe62c;</i> 用户管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a href="/admin/userList" title="用户管理">用户管理</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-article">
            <dt><i class="Hui-iconfont">&#xe720;</i> 文章管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a href="/admin/article-list" title="文章管理">文章管理</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-bill">
            <dt><i class="Hui-iconfont">&#xe719;</i> 财务管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a href="/admin/bill-list" title="财务管理">财务管理</a></li>

                </ul>
            </dd>
        </dl>
        <dl id="menu-banner">
            <dt><i class="Hui-iconfont">&#xe613;</i> banner图<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            <dd>
                <ul>
                    <li><a href="/admin/bannerList" title="banner图">banner图</a></li>
                </ul>
            </dd>
        </dl>

        <dl id="menu-system">
            <dt><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a href="/admin/system-vipBGI" title="立即开通页面背景图">立即开通页面背景图</a></li>
                    <li><a href="/admin/system-price" title="价格">价格</a></li>
                    <li><a href="/admin/system-freeDay" title="会员体验天数">会员体验天数</a></li>
                    <li><a href="/admin/system-promotion" title="无极玄推广">无极玄推广</a></li>
                    <li><a href="/admin/system-avatar" title="无极玄推广头像">无极玄推广头像</a></li>
                    <li><a href="/admin/system-QRcode" title="无极玄微信关注二维码">无极玄微信关注二维码</a></li>
                    <li><a href="/admin/system-placard" title="无极玄推广海报">无极玄推广海报</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-admin">
            <dt><i class="Hui-iconfont">&#xe62d;</i> 管理员<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a href="/admin/admin-list" title="管理员列表">管理员列表</a></li>
                </ul>
            </dd>
        </dl>
    </div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
</div>

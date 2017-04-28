<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--底部菜单栏--%>
<div class="weui-tabbar" style="position: fixed;bottom: 0;background-color:rgba(0, 0, 0, 0.8)">
    <a href="/main" class="weui-tabbar__item click">
        <div class="weui-tabbar__icon click">
            <img src="images/button01.png" alt="">
        </div>
        <p class="weui-tabbar__label">我的网站</p>
    </a>
    <a href="javascript:;" class="weui-tabbar__item click">
        <div class="weui-tabbar__icon click">
            <img src="images/button02.png" alt="">
        </div>
        <p class="weui-tabbar__label">每日动态</p>
    </a>
    <a href="javascript:;" class="weui-tabbar__item  click">
        <div class="weui-tabbar__icon">
            <img src="images/button03.png" alt="">
        </div>
        <p class="weui-tabbar__label">产品介绍</p>
    </a>
    <%----%>
    <a href="/user" class="weui-tabbar__item  click">
        <div class="weui-tabbar__icon">
            <img src="images/button04.png" alt="">
        </div>
        <p class="weui-tabbar__label">我</p>
    </a>
</div>

<%--
<div class="weui-flex"  style="position: fixed;bottom: 0;background-color:rgba(0, 0, 0, 0.8)">
    <div class="weui-flex__item click">
        <a href="/main"><img src="images/button01.png" alt="" style="width: 100%"></a>
        <p style="margin: 0 auto">我的网站</p>
    </div>

    <div class="weui-flex__item click">
        <a href="javascript:"><img src="images/button02.png" alt="" style="width: 100%"></a>
        <p style="margin: 0 auto">每日动态</p>
    </div>

    <div class="weui-flex__item click">
        <a href="javascript:"><img src="images/button03.png" alt="" style="width: 100%"></a>
        <p style="margin: 0 auto">产品介绍</p>
    </div>

    <div class="weui-flex__item click">
        <a href="/user"><img src="images/button04.png" alt="" style="width: 100%"></a>
        <p style="margin: 0 auto">我</p>
    </div>
</div>
--%>

<style>
    .click:active{
        background-color: #00c9ff;
    }
</style>
<!-- body 最后 -->
<script src="//cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="//cdn.bootcss.com/jquery-weui/1.0.1/js/jquery-weui.min.js"></script>

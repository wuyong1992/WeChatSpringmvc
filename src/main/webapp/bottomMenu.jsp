<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--底部菜单栏--%>
<%--<div class="weui-tabbar" style="position: fixed;bottom: 0">
    <a href="/main" class="weui-tabbar__item">
        <div class="weui-tabbar__icon">
            <img src="images/button01.png" alt="">
        </div>
    </a>
    <a href="javascript:;" class="weui-tabbar__item">
        <div class="weui-tabbar__icon">
            <img src="images/button02.png" alt="">
        </div>
    </a>
    <a href="javascript:;" class="weui-tabbar__item">
        <div class="weui-tabbar__icon">
            <img src="images/button03.png" alt="">
        </div>
    </a>
    &lt;%&ndash;&ndash;%&gt;
    <a href="/user" class="weui-tabbar__item">
        <div class="weui-tabbar__icon">
            <img src="images/button04.png" alt="">
        </div>
    </a>
</div>--%>

<div class="weui-flex"  style="position: fixed;bottom: 0;background-color:rgba(0, 0, 0, 0.4)">
    <div class="weui-flex__item click">
        <a href="/main"><img src="images/button01.png" alt="" style="width: 100%"></a>
    </div>

    <div class="weui-flex__item click">
        <a href="javascript:"><img src="images/button02.png" alt="" style="width: 100%"></a>
    </div>

    <div class="weui-flex__item click">
        <a href="javascript:"><img src="images/button03.png" alt="" style="width: 100%"></a>
    </div>

    <div class="weui-flex__item click">
        <a href="/user"><img src="images/button04.png" alt="" style="width: 100%"></a>
    </div>
</div>

<style>
    .click:active{
        background-color: deeppink;
    }
</style>
<!-- body 最后 -->
<script src="//cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="//cdn.bootcss.com/jquery-weui/1.0.1/js/jquery-weui.min.js"></script>

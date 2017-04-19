<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/4/1
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>主页</title>
    <jsp:include page="${pageContext.request.contextPath}/headInfo.jsp"/>

</head>
<body style="margin-bottom: 60px">

<%--滚动banner图--%>
<div class="swiper-container" data-space-between='10' data-pagination='.swiper-pagination' data-autoplay="1000"
     style="height: 180px">
    <div class="swiper-wrapper">
        <div class="swiper-slide"><img src="${pageContext.request.contextPath}/images/banner_01.jpg" style="width: 100%;height: inherit"></div>
        <div class="swiper-slide"><img src="${pageContext.request.contextPath}/images/banner_01.jpg" style="width: 100%;height: inherit"></div>
        <div class="swiper-slide"><img src="${pageContext.request.contextPath}/images/banner_01.jpg" style="width: 100%;height: inherit"></div>
    </div>

    <div style="position: absolute;bottom: 0px;z-index: 3;background-color:rgba(255,255,255,0.51);width: 100%;height: 20%">
        <p style="width: 32%;display: inline-block;text-align: center;">
            ${user.username}
        </p>
        <p style="width: 32%;display: inline-block;text-align: center">
            【个人介绍】
        </p>
        <p style="width: 32%;display: inline-block;text-align: center">
            ${user.phoneNum}
        </p>
    </div>
</div>

<%--菜单--%>
<div class="weui-flex" style="text-align: center;margin-bottom: 10px;margin-top: 10px">
    <div class="weui-flex__item"><a href="javascript:;" style="color: #3f4346"><img style="width: 80%;text-align: center;margin: 0 auto;vertical-align: middle;display: table-cell;" src="${pageContext.request.contextPath}/images/shouye.png" alt=""></a></div>
    <div class="weui-flex__item"><a href="javascript:;" style="color: #3f4346"><img style="width: 80%;text-align: center;margin: 0 auto;vertical-align: middle;display: table-cell;" src="${pageContext.request.contextPath}/images/hezuo.png" alt=""></a></div>
    <div class="weui-flex__item"><a href="javascript:;" style="color: #3f4346"><img style="width: 80%;text-align: center;margin: 0 auto;vertical-align: middle;display: table-cell;" src="${pageContext.request.contextPath}/images/chanp.png" alt=""></a></div>
    <div class="weui-flex__item"><a href="javascript:;" style="color: #3f4346"><img style="width: 80%;text-align: center;margin: 0 auto;vertical-align: middle;display: table-cell;" src="${pageContext.request.contextPath}/images/tupu.png" alt=""></a></div>
</div>

<hr>

<article class="weui-article" style="padding-top: 0;padding-bottom: 0">
    <h4>美貌与智慧并存</h4>
    <a href="javascript:"><img src="${pageContext.request.contextPath}/images/banner_01.jpg" alt=""></a>
</article>

<hr style="margin: 5px 10px">

<article class="weui-article" style="padding-top: 0;padding-bottom: 0">
    <span>“中国经济膨胀税该收场了”</span>
    <div style="float: right;width: 20%">
        <a href="javascript:"><img src="${pageContext.request.contextPath}/images/sucai.png" alt=""></a>
    </div>
</article>

<hr style="margin: 5px 10px;clear: both">

<article class="weui-article" style="padding-top: 0;padding-bottom: 0">
    <span>“中国经济膨胀税该收场了”</span>
    <div style="float: right;width: 20%">
        <a href="javascript:"><img src="${pageContext.request.contextPath}/images/sucai.png" alt=""></a>
    </div>
</article>

<hr style="margin: 5px 10px;clear: both">

<article class="weui-article" style="padding-top: 0;padding-bottom: 0">
    <span>“中国经济膨胀税该收场了”</span>
    <div style="float: right;width: 20%">
        <a href="javascript:"><img src="${pageContext.request.contextPath}/images/sucai.png" alt=""></a>
    </div>
</article>

<hr style="margin: 5px 10px;clear: both">

<article class="weui-article" style="padding-top: 0;padding-bottom: 0">
    <span>太惊讶了哇呀呀呀呀呀呀有</span>
    <div class="weui-flex" style="text-align: center">
        <div class="weui-flex__item"><a href="javascript:"><img
                src="${pageContext.request.contextPath}/images/sucai.png" width="80%"></a></div>
        <div class="weui-flex__item"><a href="javascript:"><img
                src="${pageContext.request.contextPath}/images/sucai.png" width="80%"></a></div>
        <div class="weui-flex__item"><a href="javascript:"><img
                src="${pageContext.request.contextPath}/images/sucai.png" width="80%"></a></div>
    </div>
</article>


<hr style="margin: 5px 10px;clear: both">

<article class="weui-article" style="padding-top: 0;padding-bottom: 0">
    <h4>美貌与智慧并存</h4>
    <a href="javascript:"><img src="${pageContext.request.contextPath}/images/banner_01.jpg" alt=""></a>
</article>


<%--引入底部信息--%>
<jsp:include page="${pageContext.request.contextPath}/bottomMenu.jsp"/>
<script>
    var mySwiper = new Swiper('.swiper-container', {
        loop: true,
        autoplay: 1500,
    });
</script>
</body>
</html>

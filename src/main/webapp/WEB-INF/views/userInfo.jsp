<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/4/1
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <jsp:include page="${pageContext.request.contextPath}/headInfo.jsp"/>
    <%--<script src="${pageContext.request.contextPath}/js/viewjs.js"></script>--%>
    <script>

    </script>
</head>
<body>

<%--顶部信息--%>
<div class="weui-cells" style="background-color: #3f4346;margin-top: 0">
    <div class="weui-cell">
        <div class="weui-cell__hd">
            <%--<button><span>&lt;</span></button>--%>
            <a href="javascript:history.back(-1);" class="weui-btn weui-btn_mini weui-btn_default">&lt;</a>
        </div>
        <div class="weui-cell__bd" style="text-align: center">
            <p style="color: white">我</p>
        </div>
    </div>
</div>

<%--头像简介--%>
<div class="weui-panel weui-panel_access">
    <div class="weui-panel__bd">
        <a href="/changePortrait" class="weui-media-box weui-media-box_appmsg userPortrait" >
            <div class="weui-media-box__hd">
                <img class="weui-media-box__thumb" src="${pageContext.request.contextPath}/images/bateman.jpg">
            </div>
            <div class="weui-media-box__bd">
                <h4 class="weui-media-box__title">Dennis Yang</h4>
                <p class="weui-media-box__desc">133*******</p>
                <p class="weui-media-box__desc">到期日期：YYYY-MM-dd</p>
            </div>
        </a>
    </div>
</div>

<hr>

<%--个人信息--%>
<div class="weui-cells">
    <a class="weui-cell weui-cell_access" href="javascript:;">
        <div class="weui-cell__bd">
            <p>开通VIP</p>
        </div>
        <div class="weui-cell__ft">
        </div>
    </a>
    <a class="weui-cell weui-cell_access" href="javascript:;">
        <div class="weui-cell__bd">
            <p>VIP服务价值</p>
        </div>
        <div class="weui-cell__ft">
        </div>
    </a>
    <a class="weui-cell weui-cell_access" href="javascript:;">
        <div class="weui-cell__bd">
            <p>海报中心</p>
        </div>
        <div class="weui-cell__ft">
        </div>
    </a><a class="weui-cell weui-cell_access" href="javascript:;">
    <div class="weui-cell__bd">
        <p>上传二维码</p>
    </div>
    <div class="weui-cell__ft">
    </div>
</a>
    <a class="weui-cell weui-cell_access" href="javascript:;">
        <div class="weui-cell__bd">
            <p>姓名：Dennis Yang</p>
        </div>
        <div class="weui-cell__ft">
        </div>
    </a>
    <a class="weui-cell weui-cell_access" href="javascript:;">
        <div class="weui-cell__bd">
            <p>联系方式：133********</p>
        </div>
        <div class="weui-cell__ft">
        </div>
    </a>
    <a class="weui-cell weui-cell_access" href="javascript:;">
        <div class="weui-cell__bd">
            <p>所在城市：安徽省芜湖市镜湖区</p>
        </div>
        <div class="weui-cell__ft">
        </div>
    </a>
</div>

<%--退出按钮--%>
<a href="javascript:;" class="weui-btn  weui-btn_primary" style="width: 60%;text-align: center;margin-top: 20px">退出登录</a>

<%--底部--%>
<jsp:include page="${pageContext.request.contextPath}/bottomMenu.jsp"/>
</body>
</html>

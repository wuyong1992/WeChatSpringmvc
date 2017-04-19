<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/4/19
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>联系我们</title>
    <jsp:include page="${pageContext.request.contextPath}/headInfo.jsp"/>
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
            <p style="color: white">联系我们</p>
        </div>
    </div>
</div>


<div class="weui-cells" style="margin-bottom: 100px">
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <p>雁脉文化传媒（芜湖）有限公司</p>
            <p>南阳市无极玄健康管理有限公司</p>
            <p>网址：http:www.wujixuanyi.com</p>
            <p>邮箱：wujixuan99@qq.com</p>
            <p>电话：0553-5802580</p>
            <p>地址：芜湖弋江区中央城财富街12A101室</p>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <img src="${pageContext.request.contextPath}/images/contactUs.jpg" alt="" style="width: 100%">
        </div>
    </div>
</div>



<%--版权--%>
<div class="weui-footer" style="margin: 100px auto">
    <p class="weui-footer__links">
        <a href="javascript:void(0);" class="weui-footer__link">关注无极玄服务</a>
        <a href="contactUs" class="weui-footer__link">联系我们</a>
    </p>
    <p class="weui-footer__text">Copyright © 2017 芜湖雁脉传媒文化有限公司版权所有</p>
</div>

<%--底部--%>
<jsp:include page="${pageContext.request.contextPath}/bottomMenu.jsp"/>
</body>
</html>

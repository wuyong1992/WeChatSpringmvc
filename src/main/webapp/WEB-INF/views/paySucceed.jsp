<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/4/22
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>支付成功</title>
    <jsp:include page="${pageContext.request.contextPath}/headInfo.jsp"/>
</head>
<body>

<%--支付成功页面--%>
<div class="weui-msg">
    <div class="weui-msg__icon-area"><i class="weui-icon-success weui-icon_msg"></i></div>
    <div class="weui-msg__text-area">
        <h2 class="weui-msg__title">操作成功</h2>
        <p class="weui-msg__desc">您以成功支付购买无极玄VIP服务，现在您可以享受到VIP各项服务！<br>
            <a href="/goVipServeValue">点击查看VIP服务价值</a>
        </p>
    </div>
    <div class="weui-msg__opr-area">
        <p class="weui-btn-area">
            <a href="javascript:;" class="weui-btn weui-btn_primary">确定</a>
            <a href="javascript:;" class="weui-btn weui-btn_default">去看看海报</a>
        </p>
    </div>
</div>

<div class="weui-footer weui-footer_fixed-bottom" style="bottom: 50px">
    <p class="weui-footer__links">
        <a href="javascript:void(0);" class="weui-footer__link">关注无极玄服务</a>
        <a href="contactUs" class="weui-footer__link">联系我们</a>
    </p>
    <p class="weui-footer__text">Copyright © 2017 芜湖雁脉传媒文化有限公司版权所有</p>
</div>

<jsp:include page="${pageContext.request.contextPath}/bottomMenu.jsp"/>
</body>
</html>

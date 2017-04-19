<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/4/19
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>VIP服务价值</title>
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
            <p style="color: white">VIP服务价值</p>
        </div>
    </div>
</div>

<div class="weui-cells">
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <p>
                无极玄服务是南阳无极玄健康管理有限公司官方微信公众号，是传播伏羲文化、龙魂天书、无极玄医、无极玄学、无极玄灸的学习平台。
            </p>
            <p>
                关注我们的公众号，成为VIP会员，您可以接收公司各类业务讯息，尊享专属私人微站定制，祝您拓展市场等多项特色服务。
            </p>
        </div>
    </div>
</div>

<%--版权--%>
<div class="weui-footer weui-footer_fixed-bottom" style="bottom: 50px">
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

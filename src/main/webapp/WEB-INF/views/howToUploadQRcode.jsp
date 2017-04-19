<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/4/19
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>如何上传二维码</title>
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
            <p style="color: white">如何上传二维码</p>
        </div>
    </div>
</div>


<%--图片--%>
<div style="width: 100%;margin: 20px auto">
    <img src="${pageContext.request.contextPath}/images/uploadQRcode.jpg" alt=""  style="width: 80%;text-align: center;margin: 0 auto;vertical-align: middle;display: table-cell;">
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

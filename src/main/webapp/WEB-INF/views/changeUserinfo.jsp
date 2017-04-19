<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/4/17
  Time: 13:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改个人资料</title>
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
            <p style="color: white">修改个人资料</p>
        </div>
    </div>
</div>

<form action="/updateUserinfo">
    <div class="weui-cells weui-cells_form">
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" type="text" name="username" placeholder="${user.username}">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">联系方式：</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" type="number" name="phoneNum" pattern="[0-9]*" placeholder="${user.phoneNum}">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">所在城市：</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" type="text" name="city" placeholder="${user.city}">
            </div>
            <br>
        </div>
    </div>
    <input type="submit" value="提交" class="weui-btn  weui-btn_primary" style="width: 60%;text-align: center;margin-top: 20px;margin-bottom: 50px">

</form>

<%--版权--%>
<div class="weui-footer" style="margin: 100px auto">
    <p class="weui-footer__links">
        <a href="javascript:void(0);" class="weui-footer__link">关注无极玄服务</a>
        <a href="/contactUs" class="weui-footer__link">联系我们</a>
    </p>
    <p class="weui-footer__text">Copyright © 2017 芜湖雁脉传媒文化有限公司版权所有</p>
</div>


<%--底部--%>
<jsp:include page="${pageContext.request.contextPath}/bottomMenu.jsp"/>
</body>
</html>

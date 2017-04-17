<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/4/5
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传头像</title>
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
            <p style="color: white">上传头像</p>
        </div>
    </div>
</div>

<%--TODO 实现头像更换--%>
<div style="margin: 0 auto">
    <%--<form action="/goUserinfoByChangeImg" method="post">--%>
        <div class="weui-flex">
            <div class="weui-flex__item">
                <img src="${user.userPortrait}" alt="">
            </div>
        </div>
        <%--<div class="weui-flex">--%>
            <%--<div class="weui-flex__item">--%>
                <%--<input type="file" name="file" value="选择头像">--%>
            <%--</div>--%>
            <%--<div class="weui-flex__item">--%>
                <%--<input type="submit" value="确认">--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</form>--%>
</div>


<%--底部--%>
<jsp:include page="${pageContext.request.contextPath}/bottomMenu.jsp"/>

</body>
</html>

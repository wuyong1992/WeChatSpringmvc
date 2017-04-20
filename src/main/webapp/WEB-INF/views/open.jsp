<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/4/20
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>升级开通</title>
    <jsp:include page="${pageContext.request.contextPath}/headInfo.jsp"/>
    <%--<style>
        #open {
            position: fixed;
            bottom: 50px;
        }
    </style>--%>
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
            <p style="color: white">升级开通</p>
        </div>
    </div>
</div>

<%--图片--%>
<div>
    <img src="${pageContext.request.contextPath}/images/kaitong.jpg" alt="" style="width: 100%;margin-bottom: 50px">
</div>

<%--<div id="open">
    <a href="javascript:" class="weui-btn weui-btn_warn" style="margin:0 auto;">马上开通</a>
</div>--%>

<button href="javascript:" class="weui-btn weui-btn_warn" style="position: fixed;bottom: 60px;left: 15%;width: 70%;height: 50px">
    马&nbsp;上&nbsp;开&nbsp;通
</button>


<jsp:include page="${pageContext.request.contextPath}/bottomMenu.jsp"/>
</body>
</html>

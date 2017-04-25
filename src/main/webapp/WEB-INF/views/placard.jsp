<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/4/25
  Time: 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>海报中心</title>
    <jsp:include page="${pageContext.request.contextPath}/headInfo.jsp"/>
    <%--<style>
        strong,s{
            color: red;
        }
    </style>
    <script>
        $(document).ready(function () {
            var vip = ${user.isMember};

            if (vip != 1) {
                $.confirm({
                    title: '会员到期提醒',
                    text: "亲，您的会员免费体验期还有<strong>${betweenTime}</strong>天！开通微站，让文章带上您的名片，让客户自动找上门！，原价<s>${item.originalTotalFee}</s>元/年,本月活动惊喜价仅<strong>${item.totalFee}</strong>元！名额有限，先抢先得，随时涨价！立即支付，避免错失重要客户！",
                    onOK: function () {
                        //点击确认
                        window.location.href = "http://b.wujixuanyi.com/open";
                    },
                    onCancel: function () {
                        //点击取消
                    }
                });
            }

        })
    </script>--%>
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
            <p style="color: white">海报中心</p>
        </div>
    </div>
</div>


<%--TODO 海报排版 如何排出四个一行--%>
<div class="weui-flex">
    <c:forEach items="${placards}" var="placard" varStatus="status">

        <div class="weui-flex__item"><img src="${placard.scaleAddress}" style="width: 100%;margin: 10px"></div>

        <%--<img src="${placard.scaleAddress}" style="width: 100%">--%>

        <c:if test="${status.count % 4 == 0}">
            </div>
            <div class="weui-flex">
        </c:if>
    </c:forEach>
</div>

<%--底部--%>
<jsp:include page="${pageContext.request.contextPath}/bottomMenu.jsp"/>
</body>
</html>

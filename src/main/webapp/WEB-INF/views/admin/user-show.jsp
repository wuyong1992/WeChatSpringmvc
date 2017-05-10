<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/5/3
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <jsp:include page="_meta.jsp"/>

    <title>查看用户</title>
</head>
<body>
<div class="cl pd-20" style=" background-color:#5bacb6">
    <!--头像-->
    <img class="avatar size-XL l" src="${pageContext.request.contextPath}/static/h-ui/images/ucnter/avatar-default.jpg">
    <dl style="margin-left:80px; color:#fff">
        <dt>
            <span class="f-18">${user.username}</span>
            <span class="f-12" style="margin-left: 10px;">
                <c:if test="${user.sex == 1}">男</c:if>
            <c:if test="${user.sex == 2}">女</c:if>
            <c:if test="${user.sex == 0}">未知</c:if>
            </span>
            <br>
            <!--TODO  非会员或会员到期显示非会员-->
            <c:if test="${user.isMember == 1}">
                <span class="f-14">会员到期时间</span>
                <span class="pl-10 f-12">
                    <fmt:formatDate value="${user.vipEndTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </span>
            </c:if>
            <c:if test="${user.isMember == 0}">
                <span class="f-14">非会员用户</span>
            </c:if>
        </dt>
       <%-- <dd class="pt-10 f-12" style="margin-left:0">
            <c:if test="${user.sex == 1}">男</c:if>
            <c:if test="${user.sex == 2}">女</c:if>
            <c:if test="${user.sex == 0}">未知</c:if>
        </dd>--%>
        <dd class="pt-10 f-12" style="margin-left:0">
            <span class="f-14">充值金额:</span> <span class="pl-10 f-12">${user.total_fee}</span>
            <br>
            <span class="f-14">积分:</span> <span class="pl-10 f-12">${user.points}</span>
        </dd>

    </dl>
</div>
<div class="pd-20">
    <table class="table">
        <tbody>
        <tr>
            <th>订单流水号</th>
            <th>充值时间</th>
            <th>充值金额</th>
        </tr>
        <c:forEach items="${orders}" var="order">
            <tr>
                <td>${order.transaction_id}</td>
                <td>
                    <fmt:formatDate value="${order.vipTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>
                <td>${order.total_fee}</td>
            </tr>
        </c:forEach>

        <%--<tr>
            <th class="text-r">充值金额：</th>
            <td>${user.total_fee}</td>
        </tr>
        <tr>
            <th class="text-r">积分：</th>
            <td>${user.points}</td>
        </tr>
        <!--循环输出-->
        <tr>
            <th class="text-r" width="100">订单流水号：</th>
            <td>46546541231346546541321324654</td>
        </tr>

        <tr>
            <th class="text-r">充值时间：</th>
            <td>2017.12.20</td>
        </tr>--%>
        </tbody>
    </table>
</div>
<!--_footer 作为公共模版分离出去-->
<jsp:include page="_footer.jsp"/>
<!--/_footer /作为公共模版分离出去-->

</body>
</html>

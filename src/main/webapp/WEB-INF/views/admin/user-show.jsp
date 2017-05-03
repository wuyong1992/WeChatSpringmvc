<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/5/3
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <span class="f-18">张三</span>
            <br>
            <!--TODO  非会员或会员到期显示非会员-->
            <span class="f-14">会员到期时间</span>
            <span class="pl-10 f-12">2017-05-18</span>
        </dt>
        <dd class="pt-10 f-12" style="margin-left:0">男</dd>
    </dl>
</div>
<div class="pd-20">
    <table class="table">
        <tbody>
        <tr>
            <th class="text-r">充值金额：</th>
            <td>330</td>
        </tr>
        <tr>
            <th class="text-r">积分：</th>
            <td>330</td>
        </tr>
        <!--TODO 循环输出-->
        <tr>
            <th class="text-r" width="100">订单流水号：</th>
            <td>46546541231346546541321324654</td>
        </tr>

        <tr>
            <th class="text-r">充值时间：</th>
            <td>2017.12.20</td>
        </tr>
        </tbody>
    </table>
</div>
<!--_footer 作为公共模版分离出去-->
<jsp:include page="_footer.jsp"/>
<!--/_footer /作为公共模版分离出去-->

</body>
</html>

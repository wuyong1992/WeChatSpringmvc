<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/4/7
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>测试页</title>
    <jsp:include page="${pageContext.request.contextPath}/headInfo.jsp"/>
</head>
<body>
<h3>
    ok!
    <%--测试jquery是否引入成功--%>
    <%--<script>
        $(function () {
            alert("hahaha")
        })
    </script>--%>
</h3>
</body>
</html>

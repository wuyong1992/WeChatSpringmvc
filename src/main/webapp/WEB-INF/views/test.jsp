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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/wangEditor/css/wangEditor.min.css">
</head>
<body>
<%--ok!--%>
<%--测试jquery是否引入成功--%>
<%--<script>
    $(function () {
        alert("hahaha")
    })
</script>--%>

<%--<div>
    <img src="http://localhost:8080/files/2d23593b-f90e-4d05-aa8a-802fbfb8719d.jpg" alt="">
</div>--%>


<div>
    <form action="/admin/test" enctype="multipart/form-data">
        <p>请输入内容</p>
        <textarea id="editor" name="editorValue" style="height: 500px;width: 100%"></textarea>
        <input type="submit" value="提交">
    </form>
</div>

<script src="${pageContext.request.contextPath}/lib/wangEditor/js/lib/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/wangEditor/js/wangEditor.min.js"></script>
<script>

    $(function () {
        var editor = new wangEditor('editor');
        editor.config.uploadImgUrl = '/admin/test';
        editor.config.uploadImgFileName = 'myFileName';

        editor.create();

    })

</script>
</body>
</html>

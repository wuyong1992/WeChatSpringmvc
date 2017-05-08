<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/5/3
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="_meta.jsp"/>
    <!--/meta 作为公共模版分离出去-->

    <title>无极玄推广二维码</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/webuploader/0.1.5/webuploader.css">
    <script src="${pageContext.request.contextPath}/lib/jquery/1.9.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/webuploader/0.1.5/webuploader.min.js"></script>
</head>
<body>
<!--_header 作为公共模版分离出去-->
<jsp:include page="_header.jsp"/>
<!--/_header 作为公共模版分离出去-->

<!--_menu 作为公共模版分离出去-->
<jsp:include page="_menu.jsp"/>
<!--/_menu 作为公共模版分离出去-->

<section class="Hui-article-box">
    <nav class="breadcrumb">
        <i class="Hui-iconfont">&#xe67f;</i>
        <a href="/admin/main" class="maincolor">首页</a>
        <span class="c-gray en">&gt;</span> 系统设置
        <span class="c-gray en">&gt;</span> 无极玄推广二维码
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
           href="javascript:location.replace(location.href);" title="刷新">
            <i class="Hui-iconfont">&#xe68f;</i>
        </a>
    </nav>

    <div class="Hui-article">
        <article class="cl pd-20">
            <%--TODO 添加form表单--%>
            <div>
                <img src="${pageContext.request.contextPath}/images/moren.jpg" alt="" id="showQRcode">
                <br>
                <%--TODO 限制只能选择图片--%>
                <input type="file" id="QRcode" name="file" value="选择二维码">
            </div>
        </article>
    </div>
</section>

<!--_footer 作为公共模版分离出去-->
<jsp:include page="_footer.jsp"/>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script>

    $("#QRcode").change(function () {
        var objUrl = getObjectURL(this.files[0]);
        console.log("objUrl = " + objUrl);
        if (objUrl) {
            $("#showQRcode").attr("src", objUrl);
        }
    });
    //建立一個可存取到該file的url
    function getObjectURL(file) {
        var url = null;
        if (window.createObjectURL != undefined) { // basic
            url = window.createObjectURL(file);
        } else if (window.URL != undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    }
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>

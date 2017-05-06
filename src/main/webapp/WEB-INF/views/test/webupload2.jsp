<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/5/6
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>WebUploader演示</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/testweub/webuploader.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/testweub/style.css" />
</head>
<body>
<div id="wrapper">
    <div id="container">
        <!--头部，相册选择和格式选择-->

        <div id="uploader">
            <div class="queueList">
                <div id="dndArea" class="placeholder">
                    <div id="filePicker"></div>
                    <p>或将照片拖到这里，单次最多可选300张</p>
                </div>
            </div>
            <div class="statusBar" style="display:none;">
                <div class="progress">
                    <span class="text">0%</span>
                    <span class="percentage"></span>
                </div><div class="info"></div>
                <div class="btns">
                    <div id="filePicker2"></div><div class="uploadBtn">开始上传</div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/testweub/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/testweub/webuploader.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/testweub/upload.js"></script>
</body>
</html>

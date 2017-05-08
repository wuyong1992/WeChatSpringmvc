<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/5/3
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--/meta 作为公共模版分离出去-->
    <jsp:include page="_meta.jsp"/>
    <title>新增banner图</title>
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
        <i class="Hui-iconfont">&#xe67f;</i> <a href="/admin/main" class="maincolor">首页</a>
        <span class="c-gray en">&gt;</span> banner图管理
        <span class="c-gray en">&gt;</span> 添加banner图
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
           href="javascript:location.replace(location.href);" title="刷新">
            <i class="Hui-iconfont">&#xe68f;</i>
        </a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="page-container">
                <form class="form form-horizontal" id="form-article-add" action="">
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">排序值：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" class="input-text" value="" placeholder="" name="">
                        </div>
                    </div>


                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">图片链接：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" class="input-text" value="" placeholder="" name="">
                        </div>
                    </div>


                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">图片上传：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <div>
                                <img src="${pageContext.request.contextPath}/images/moren.jpg" alt="" id="showBanner">
                                <br>
                                <%--限制只能选择图片--%>
                                <input type="file" id="banner" name="file" value="选择banner" accept="image/gif,image/png,image/jpeg,image/jpg" >
                            </div>
                        </div>
                    </div>
                    <div class="row cl">
                        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                            <button class="btn btn-primary radius" type="button">
                                <i class="Hui-iconfont">&#xe632;</i> 保存并提交审核
                            </button>
                            <button  class="btn btn-default radius" type="button" onclick="window.open('/admin/banner-list','_self')">
                                &nbsp;&nbsp;取消&nbsp;&nbsp;
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </article>
    </div>
</section>


<!--_footer 作为公共模版分离出去-->
<jsp:include page="_footer.jsp"/>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->

<script type="text/javascript">
    $("#banner").change(function () {
        var objUrl = getObjectURL(this.files[0]);
        console.log("objUrl = " + objUrl);
        if (objUrl) {
            $("#showBanner").attr("src", objUrl);
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
</body>
</html>

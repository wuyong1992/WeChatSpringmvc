<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/5/3
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--/meta 作为公共模版分离出去-->
    <jsp:include page="_meta.jsp"/>
    <title>banner编辑</title>
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
                <form class="form form-horizontal" id="form-banner-editor" action="/admin/bannerUpdate/${banner.id}" method="post" enctype="multipart/form-data">
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">排序值：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" class="input-text" value="" placeholder="${banner.sort}" name="sort">
                        </div>
                    </div>


                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">图片链接：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" class="input-text" value="" placeholder="${banner.link}" name="link">
                        </div>
                    </div>

                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">图片状态：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" class="input-text" value="" placeholder="${banner.status}" name="status">
                        </div>
                    </div>

                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">banner图：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <div>
                                <img src="${banner.bannerPath}" alt="" id="showEditorBanner">
                                <br>
                                <%--限制只能选择图片--%>
                                <input type="file" id="editorBanner" name="file" value="选择banner图" accept="image/gif,image/png,image/jpeg,image/jpg" >
                            </div>
                        </div>
                    </div>
                    <div class="row cl">
                        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                            <button  class="btn btn-primary radius" type="submit">
                                <i class="Hui-iconfont">&#xe632;</i> 保存并提交审核
                            </button>
                            <button  class="btn btn-default radius" type="button" onclick="window.open('/admin/bannerList','_self')">
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
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">
    $("#editorBanner").change(function () {
        var objUrl = getObjectURL(this.files[0]);
        console.log("objUrl = " + objUrl);
        if (objUrl) {
            $("#showEditorBanner").attr("src", objUrl);
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

    //表单验证
    $(function () {
        $("#form-banner-editor").validate({
            rules: {
                status:{
                    digits:true,
                    range:[0,1],
                    maxlength:1
                },
                sort:{
                    digits:true,
                    min:0
                }
            }
        })
    })
</script>
</body>
</html>

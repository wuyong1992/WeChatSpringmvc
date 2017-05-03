<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/5/3
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--/meta 作为公共模版分离出去-->
    <jsp:include page="_meta.jsp"/>
    <title>无极玄推广</title>
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
        <span class="c-gray en">&gt;</span> 系统设置
        <span class="c-gray en">&gt;</span> 无极玄推广
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"href="javascript:location.replace(location.href);" title="刷新">
            <i class="Hui-iconfont">&#xe68f;</i>
        </a>
    </nav>
    <div class="Hui-article">
        <article class="page-container">
            <form class="form form-horizontal" id="form-article-add" action="/admin/promotionHandler">

                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-2">推广联系方式：</label>
                    <div class="formControls col-xs-8 col-sm-9"  style="margin-bottom: 10px">
                        <input type="text" class="input-text" placeholder="" id="promotionCall" name="promotionCall">
                    </div>
                    <label class="form-label col-xs-4 col-sm-2">推广名称：</label>
                    <div class="formControls col-xs-8 col-sm-9"  style="margin-bottom: 10px">
                        <input type="text" class="input-text" placeholder="" id="promotionName" name="promotionName">
                    </div>
                    <label class="form-label col-xs-4 col-sm-2">推广微信号：</label>
                    <div class="formControls col-xs-8 col-sm-9"  style="margin-bottom: 10px">
                        <input type="text" class="input-text" placeholder="" id="promotionWechatID" name="promotionWechatID">
                    </div>
                    <label class="form-label col-xs-4 col-sm-2">推广地址：</label>
                    <div class="formControls col-xs-8 col-sm-9"  style="margin-bottom: 10px">
                        <input type="text" class="input-text" placeholder="" id="promotionAddress" name="promotionAddress">
                    </div>
                </div>
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                    <button class="btn btn-primary radius" type="submit">
                        <i class="Hui-iconfont">&#xe632;</i>
                        确定
                    </button>
                </div>
            </form>
        </article>
    </div>
</section>

<!--_footer 作为公共模版分离出去-->
<jsp:include page="_footer.jsp"/>
<!--/_footer /作为公共模版分离出去-->



</body>
</html>


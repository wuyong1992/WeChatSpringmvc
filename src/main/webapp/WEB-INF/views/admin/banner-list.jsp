<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/5/3
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!--/meta 作为公共模版分离出去-->
    <jsp:include page="_meta.jsp"/>
    <title>banner图列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/lightbox2/2.8.1/css/lightbox.css">
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
        <span class="c-gray en">&gt;</span> banner管理
        <span class="c-gray en">&gt;</span> banner列表
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
           href="javascript:location.replace(location.href);" title="刷新">
            <i class="Hui-iconfont">&#xe68f;</i>
        </a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l">
                    <a class="btn btn-primary radius" href="/admin/goAddBanner">
                        <i class="Hui-iconfont">&#xe600;</i>
                        添加banner
                    </a>
                </span>
                <span class="r">共有数据：<strong>${count}</strong> 条</span>
            </div>
            <div class="mt-20">
                <table class="table table-border table-bordered table-bg table-hover table-sort">
                    <thead>
                    <tr class="text-c">
                        <th width="40"><input name="" type="checkbox" value=""></th>
                        <th width="40">ID</th>
                        <th>缩略图</th>
                        <th width="200">链接地址</th>
                        <th width="100">排序</th>
                        <th width="100">状态</th>
                        <th width="150">操作</th>
                    </tr>
                    </thead>
                    <tbody>


                    <c:forEach items="${banners}" var="banner">
                        <tr class="text-c">
                            <td><input name="" type="checkbox" value="${banner.id}"></td>
                            <td>${banner.id}</td>
                            <td>
                                <a href="${banner.bannerPath}" data-lightbox="banner">
                                    <img width="100%" class="picture-thumb" src="${banner.bannerPath}">
                                </a>
                            </td>
                            <td>${banner.link}</td>
                            <td>${banner.sort}</td>
                            <td class="td-status">

                                    <c:if test="${banner.status ==0}">
                                        <span class="label label-default radius">已禁用</span>
                                    </c:if>
                                    <c:if test="${banner.status ==1}">
                                        <span class="label label-success radius">已发布</span>
                                    </c:if>

                            </td>
                            <td class="td-manage">
                                <c:if test="${banner.status ==0}">
                                    <a style="text-decoration:none" onClick="banner_start(this,'${banner.id}')"
                                       href="javascript:;"
                                       title="发布">
                                        <span class="label label-success radius">发布</span>
                                    </a>
                                </c:if>
                                <c:if test="${banner.status ==1}">
                                    <a style="text-decoration:none" onClick="banner_stop(this,'${banner.id}')"
                                       href="javascript:;" title="禁用">
                                        <span class="label label-default radius">禁用</span>
                                    </a>
                                </c:if>

                                <a style="text-decoration:none" class="ml-5" href="/admin/bannerEditor/${banner.id}"
                                   title="编辑">
                                    <span class="label label-primary radius">修改</span>
                                </a>
                                <a style="text-decoration:none" class="ml-5" onClick="picture_del(this,'${banner.id}')"
                                   href="javascript:;" title="删除">
                                    <span class="label label-warning radius">删除</span>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>

                    <%--<tr class="text-c">
                        <td><input name="" type="checkbox" value=""></td>
                        <td>001</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/temp/200x150.jpg" data-lightbox="banner">
                                <img width="210" class="picture-thumb"
                                     src="${pageContext.request.contextPath}/temp/200x150.jpg">
                            </a>
                        </td>
                        <td>http://www.com.baidu.com</td>
                        <td>1</td>
                        <td class="td-status"><span class="label label-success radius">发布</span></td>
                        <td class="td-manage">
                            <a style="text-decoration:none" onClick="picture_stop(this,'10001')" href="javascript:;"
                               title="禁用">
                                <span class="label label-success radius">禁用</span>
                            </a>
                            <a style="text-decoration:none" class="ml-5" href="/admin/banner-editor" title="编辑">
                                <span class="label label-primary radius">修改</span>
                            </a>
                            <a style="text-decoration:none" class="ml-5" onClick="picture_del(this,'10001')"
                               href="javascript:;"
                               title="删除">
                                <span class="label label-warning radius">删除</span>
                            </a>
                        </td>
                    </tr>--%>
                    </tbody>
                </table>
            </div>
        </article>
    </div>
</section>

<!--_footer 作为公共模版分离出去-->
<jsp:include page="_footer.jsp"/>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/lightbox2/2.8.1/js/lightbox.min.js"></script>
<script type="text/javascript">
    $('.table-sort').dataTable({
        "aaSorting": [[1, "desc"]],//默认第几个排序
        "bStateSave": true,//状态保存
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {"orderable": false, "aTargets": [0, 6]}// 制定列不参与排序
        ]
    });

    /*/!*图片-下架*!/
    function picture_stop(obj, id) {
        layer.confirm('确认要禁用吗？', function (index) {
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_start(this,id)" href="javascript:;" title="发布"><span class="label label-success radius">发布</span></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已禁用</span>');
            $(obj).remove();
            layer.msg('已禁用!', {icon: 5, time: 1000});
        });
    }

    /!*图片-发布*!/
    function picture_start(obj, id) {
        layer.confirm('确认要发布吗？', function (index) {
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_stop(this,id)" href="javascript:;" title="禁用"><span class="label label-success radius">禁用</span></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">发布</span>');
            $(obj).remove();
            layer.msg('已发布!', {icon: 6, time: 1000});
        });
    }*/

    /*图片-发布*/
    function banner_start(obj, id) {
        layer.confirm('确定要发布吗', {
            btn: ['确定', '取消'] //按钮
        }, function () {
            var url = "/admin/updateBannerStatus";
            var params = {"id": id};
            $.post(url, params);
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="banner_stop(this,id)" href="javascript:;" title="禁用"><span class="label label-success radius">禁用</span></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
            $(obj).remove();
            layer.msg('已发布!', {icon: 6, time: 1000});
        }, function () {
            layer.msg('已取消', {icon: 2});
        });
    }

    /*图片-禁用*/
    function banner_stop(obj, id) {
        layer.confirm('确定要禁用吗', {
            btn: ['确定', '取消'] //按钮
        }, function () {
            var url = "/admin/updateStatus";
            var params = {"id": id};
            $.post(url, params);
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="banner_start(this,id)" href="javascript:;" title="发布"><span class="label label-success radius">发布</span></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
            $(obj).remove();
            layer.msg('已禁用!', {icon: 7, time: 1000});
        }, function () {
            layer.msg('已取消', {icon: 2});
        });
    }

    /*图片-删除*/
    function picture_del(obj, id) {
        layer.confirm('确定要删除吗', {
            btn: ['确定', '取消'] //按钮
        }, function () {
            var url = "/admin/deleteBannerById";
            var params = {"id": id};
            $.post(url, params);
            window.location.reload();       //刷新页面
            layer.msg('已删除', {icon: 1});
        }, function () {
            layer.msg('已取消', {icon: 2});
        });
    }
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>

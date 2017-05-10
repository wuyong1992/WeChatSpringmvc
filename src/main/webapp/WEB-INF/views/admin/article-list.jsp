<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/5/3
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!--/meta 作为公共模版分离出去-->
    <jsp:include page="_meta.jsp"/>
    <title>文章列表</title>
</head>
<body>
<!--_header 作为公共模版分离出去-->
<jsp:include page="_header.jsp"/>
<!--/_header 作为公共模版分离出去-->

<!--_menu 作为公共模版分离出去-->
<jsp:include page="_menu.jsp"/>
<!--/_menu 作为公共模版分离出去-->

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i><a href="/admin/main" class="maincolor">首页</a>
        <span class="c-gray en">&gt;</span>
        文章管理
        <span class="c-gray en">&gt;</span>
        文章列表
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
           href="javascript:location.replace(location.href);" title="刷新">
            <i class="Hui-iconfont">&#xe68f;</i>
        </a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="text-c">
				<span class="select-box inline">
				<select name="articleType" class="select" id="articleSelect">
					<option value="0">全部分类</option>
					<option value="1">首页</option>
					<option value="2">每日动态</option>
					<option value="3">产品介绍</option>
					<option value="4">玄灸图谱</option>
				</select>
				</span>
                <!--日期范围：
                <input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}'})" id="logmin" class="input-text Wdate" style="width:120px;">
                -
                <input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d'})" id="logmax" class="input-text Wdate" style="width:120px;">-->
                <input type="text" name="title" placeholder=" 文章标题" style="width:250px" class="input-text">
                <button name="" id="" class="btn btn-success" type="submit">
                    <i class="Hui-iconfont">&#xe665;</i>
                    搜文章
                </button>
            </div>
            <div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l">
				<a class="btn btn-primary radius" href="/admin/articleAdd">
					<i class="Hui-iconfont">&#xe600;</i> 
					添加文章
				</a>
				</span>
                <span class="r">共有数据：<strong>${size}</strong> 条</span>
            </div>
            <div class="mt-20">
                <table class="table table-border table-bordered table-bg table-hover table-sort">
                    <thead>
                    <tr class="text-c">
                        <th width="25"><input type="checkbox" name="" value=""></th>
                        <th width="80">ID</th>
                        <th>标题</th>
                        <th width="80">分类</th>
                        <th width="80">转载次数</th>
                        <th width="120">更新时间</th>
                        <th width="75">排序</th>
                        <th width="60">发布状态</th>
                        <th width="120">操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${articles}" var="article">
                    <tr class="text-c">
                        <td><input type="checkbox" value="" name=""></td>
                        <td>${article.id}</td>
                        <td>
                            <a style="cursor:pointer" class="text-primary" href="/admin/goArticleEditor/${article.id}" title="查看">
                                ${article.title}
                            </a>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${article.articleType == 1}">
                                    首页
                                </c:when>
                                <c:when test="${article.articleType == 2}">
                                    每日动态
                                </c:when>
                                <c:when test="${article.articleType == 3}">
                                    产品介绍
                                </c:when>
                                <c:otherwise>
                                    玄灸图谱
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${article.counts}</td>
                        <td>${article.updateTime}</td>
                        <td>${article.sort}</td>
                        <td class="td-status">
                            <c:if test="${article.status == 0}">
                                <span class="label label-default radius">已禁用</span>
                            </c:if>
                            <c:if test="${article.status == 1}">
                                <span class="label label-success radius">已发布</span>
                            </c:if>
                        </td>
                        <td class="f-14 td-manage">
                            <a style="text-decoration:none" class="ml-5" href="/admin/goArticleEditor/${article.id}" title="编辑">
                                <i class="Hui-iconfont">&#xe6df;</i>
                            </a>
                            <c:if test="${article.status == 0}">
                                <a style="text-decoration:none" onClick="article_stop(this,'${article.id}')" href="javascript:"
                                   title="发布">
                                    <span class="label label-success radius">发布</span>
                                </a>
                            </c:if>
                            <c:if test="${article.status == 1}">
                                <a style="text-decoration:none" onClick="article_stop(this,'${article.id}')" href="javascript:"
                                   title="禁用">
                                    <span class="label label-default radius">禁用</span>
                                </a>
                            </c:if>
                            <a style="text-decoration:none" class="ml-5" onClick="article_del(this,'${article.id}')"
                               href="javascript:"
                               title="删除">
                                <i class="Hui-iconfont">&#xe6e2;</i>
                            </a>

                        </td>
                    </tr>
                    </c:forEach>
                    <%--<tr class="text-c">
                        <td><input type="checkbox" value="" name=""></td>
                        <td>1</td>
                        <td>
                            <a style="cursor:pointer" class="text-primary" href="/admin/articleEditor" title="查看">
                                这是标题标题标题
                            </a>
                        </td>
                        <td>首页</td>
                        <td>5</td>
                        <td>2014-6-11 11:11:42</td>
                        <td>21212</td>
                        <td class="td-status"><span class="label label-success radius">已发布</span></td>
                        <td class="f-14 td-manage">
                            <a style="text-decoration:none" class="ml-5" href="/admin/articleEditor" title="编辑">
                                <i class="Hui-iconfont">&#xe6df;</i>
                            </a>
                            <a style="text-decoration:none" class="ml-5" onClick="article_del(this,'10001')"
                               href="javascript:"
                               title="删除">
                                <i class="Hui-iconfont">&#xe6e2;</i>
                            </a>
                            <a style="text-decoration:none" onClick="article_stop(this,'10001')" href="javascript:"
                               title="禁用">
                                <span class="label label-success radius">禁用</span>
                            </a>
                        </td>
                    </tr>
                    <tr class="text-c">
                        <td><input type="checkbox" value="" name=""></td>
                        <td>2</td>
                        <td>
                            <a style="cursor:pointer" class="text-primary" href="/admin/articleEditor" title="查看">
                                这是标题标题标题
                            </a>
                        </td>
                        <td>玄灸图谱</td>
                        <td>0</td>
                        <td>2014-6-11 11:11:42</td>
                        <td>21212</td>
                        <td class="td-status"><span class="label label-success radius">草稿</span></td>
                        <td class="f-14 td-manage">
                            <a style="text-decoration:none" class="ml-5" href="/admin/articleEditor" title="编辑">
                                <i class="Hui-iconfont">&#xe6df;</i>
                            </a>
                            <a style="text-decoration:none" class="ml-5" onClick="article_del(this,'10001')"
                               href="javascript:" title="删除">
                                <i class="Hui-iconfont">&#xe6e2;</i>
                            </a>
                            <a style="text-decoration:none" onClick="article_stop(this,'10001')" href="javascript:"
                               title="禁用">
                                <span class="label label-success radius">禁用</span>
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
<script type="text/javascript">
    $('.table-sort').dataTable({
        "aaSorting": [[1, "desc"]],//默认第几个排序
        "bStateSave": true,//状态保存
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {"orderable": false, "aTargets": [0, 8]}// 不参与排序的列
        ]
    });

    /*文章-删除*/
    function article_del(obj, id) {
        layer.confirm('确定要删除吗', {
            btn: ['确定', '取消'] //按钮
        }, function () {
            var url = "/admin/deleteArticleById";
            var params = {"id": id};
            $.post(url, params);
            layer.msg('已删除', {icon: 1});
            window.location.reload();       //刷新页面
        }, function () {
            layer.msg('已取消', {icon: 2});
        });
    }

    /*文章-发布*/
    function article_start(obj, id) {
        layer.confirm('确定要发布吗', {
            btn: ['确定', '取消'] //按钮
        }, function () {
            var url = "/admin/updateArticleStatus";
            var params = {"id": id};
            $.post(url, params);
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_stop(this,id)" href="javascript:;" title="禁用"><span class="label label-success radius">禁用</span></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
            $(obj).remove();
            layer.msg('已发布!', {icon: 6, time: 1000});
        }, function () {
            layer.msg('已取消', {icon: 2});
        });
    }
    /*文章-禁用*/
    function article_stop(obj, id) {
        layer.confirm('确定要发布吗', {
            btn: ['确定', '取消'] //按钮
        }, function () {
            var url = "/admin/updateArticleStatus";
            var params = {"id": id};
            $.post(url, params);
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_start(this,id)" href="javascript:;" title="发布"><span class="label label-success radius">发布</span></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已禁用</span>');
            $(obj).remove();
            layer.msg('已禁用!', {icon: 7, time: 1000});
        }, function () {
            layer.msg('已取消', {icon: 2});
        });
    }

</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>

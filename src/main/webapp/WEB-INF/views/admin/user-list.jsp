<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/5/3
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <jsp:include page="_meta.jsp"/>
    <!--/meta 作为公共模版分离出去-->

    <title>用户列表</title>
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
        <span class="c-gray en">&gt;</span> 用户中心
        <span class="c-gray en">&gt;</span> 用户列表
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
           href="javascript:location.replace(location.href);" title="刷新">
            <i class="Hui-iconfont">&#xe68f;</i>
        </a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="text-c">
                <input type="text" class="input-text" style="width:250px" placeholder="输入用户微信号" name="">
                <input type="text" class="input-text" style="width:250px" placeholder="输入用户姓名" name="">
                <input type="text" class="input-text" style="width:250px" placeholder="输入用户手机号" name="">
                <button type="submit" class="btn btn-success radius" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户
                </button>
            </div>
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="r">共有数据：<strong>${users.size()}</strong> 条
                </span>
            </div>
            <div class="mt-20">
                <table class="table table-border table-bordered table-hover table-bg table-sort">
                    <thead>
                    <tr class="text-c">
                        <th width="25"><input type="checkbox" name="" value=""></th>
                        <th width="80">ID</th>
                        <th width="120">用户名</th>
                        <th width="100">微信号</th>
                        <th width="40">性别</th>
                        <th width="90">手机</th>
                        <%--<th width="80">转载文章次数</th>--%>
                        <th width="">地址</th>
                        <th width="130">关注时间</th>
                        <th width="130">会员到期时间</th>
                        <th width="70">状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${users}" var="user">
                        <tr class="text-c">
                            <td><input type="checkbox" value="${user.id}" name=""></td>
                            <td>${user.id}</td>
                            <td>
                                <u style="cursor:pointer" class="text-primary" onclick="user_show('用户信息','/admin/userShow/${user.id}','${user.id}','800','400')">${user.username}</u>
                            </td>
                            <td>
                                <u style="cursor:pointer" class="text-primary" onclick="user_show('用户信息','/admin/userShow/${user.id}','${user.id}','800','400')">${user.wechatID}</u>
                            </td>
                            <td>
                                <c:if test="${user.sex == 1}">男</c:if>
                                <c:if test="${user.sex == 2}">女</c:if>
                                <c:if test="${user.sex == 0}">未知</c:if>
                            </td>
                            <td>${user.phoneNum}</td>
                            <td>${user.country}${user.city}</td>
                            <td>
                                <fmt:formatDate value="${user.registerTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </td>
                            <td>
                                <fmt:formatDate value="${user.vipEndTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </td>
                            <td class="td-status">
                                <c:if test="${user.isSubscribe == 1}">
                                    <span class="label label-success radius">关注</span>
                                </c:if>
                                <c:if test="${user.isSubscribe == 0}">
                                    <span class="label label-default radius">取消关注</span>
                                </c:if>
                                <c:if test="${user.isMember == 1}">
                                    <span class="label label-success radius">会员</span>
                                </c:if>
                                <c:if test="${user.isMember == 0}">
                                    <span class="label label-default radius">非会员</span>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>

                    <%--<tr class="text-c">
                        <td><input type="checkbox" value="1" name=""></td>
                        <td>1</td>
                        <td>
                            <u style="cursor:pointer" class="text-primary" onclick="user_show('用户信息','/admin/user-show','10001','500','400')">张三</u>
                        </td>
                        <td><u style="cursor:pointer" class="text-primary"
                               onclick="user_show('用户信息','/admin/user-show','10001','500','400')">张三</u></td>
                        <td>男</td>
                        <td>13000000000</td>
                        <td>1</td>
                        <td>北京市 海淀区</td>
                        <td>2014-6-11 11:11:42</td>
                        <td>2017-6-11 11:11:42</td>
                        <td class="td-status"><span class="label label-success radius">关注</span></td>
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
    $(function () {
        $('.table-sort').dataTable({
            "aaSorting": [[1, "desc"]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable": false, "aTargets": [0, 8, 8]}// 制定列不参与排序
            ]
        });
        $('.table-sort tbody').on('click', 'tr', function () {
            if ($(this).hasClass('selected')) {
                $(this).removeClass('selected');
            }
            else {
                table.$('tr.selected').removeClass('selected');
                $(this).addClass('selected');
            }
        });
    });

    /*用户-查看*/
    function user_show(title, url, id, w, h) {
        layer_show(title, url, w, h);
    }

</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>

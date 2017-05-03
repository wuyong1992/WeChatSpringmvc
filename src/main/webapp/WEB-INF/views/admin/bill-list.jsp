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
    <title>财务列表</title>
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
        <span class="c-gray en">&gt;</span>
        财务管理
        <span class="c-gray en">&gt;</span>
        财务列表
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新">
            <i class="Hui-iconfont">&#xe68f;</i>
        </a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="text-c"> <!--日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;">-->
                <input type="text" name="" placeholder="流水号" style="width:250px" class="input-text">
                <input type="text" name="" placeholder="姓名" style="width:250px" class="input-text">
                <input type="text" name="" placeholder="微信号" style="width:250px" class="input-text">
                <input type="text" name="" placeholder="手机号" style="width:250px" class="input-text">
                <button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
            </div>
            <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="r">共有数据：<strong>54</strong> 条</span></div>
            <div class="mt-20">
                <table class="table table-border table-bordered table-bg table-hover table-sort">
                    <thead>
                    <tr class="text-c">
                        <th width="80">用户名</th>
                        <th width="100">微信号</th>
                        <th>微信平台交易流水号</th>
                        <th width="100">充值金额</th>
                        <th width="150">充值时间</th>
                        <th width="150">会员到期时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!--TODO 循环输出-->
                    <tr class="text-c">
                        <td>大坚果</td>
                        <td>wuhu9290</td>
                        <td>54547676544564674694354987</td>
                        <td>229.0元</td>
                        <td>2017-6-11 11:11:42</td>
                        <td>2018-6-11 11:11:42</td>
                    </tr>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    $('.table-sort').dataTable({
        "aaSorting": [[1, "desc"]],//默认第几个排序
        "bStateSave": true,//状态保存
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {"orderable": false, "aTargets": [0, 5]}// 制定列不参与排序
        ]
    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>

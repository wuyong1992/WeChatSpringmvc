<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/4/1
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>个人信息</title>
    <jsp:include page="${pageContext.request.contextPath}/headInfo.jsp"/>
    <style>
        strong,s{
            color: red;
        }
    </style>
    <script>
        $(document).ready(function () {
            var vip = ${user.isMember};

            if (vip != 1) {
                $.confirm({
                    title: '会员到期提醒',
                    text: "亲，您的会员免费体验期还有<strong>${betweenTime}</strong>天！开通微站，让文章带上您的名片，让客户自动找上门！，原价<s>${item.originalTotalFee}</s>元/年,本月活动惊喜价仅<strong>${item.totalFee}</strong>元！名额有限，先抢先得，随时涨价！立即支付，避免错失重要客户！",
                    onOK: function () {
                        //点击确认
                        window.location.href = "http://b.wujixuanyi.com/open";
                    },
                    onCancel: function () {
                        //点击取消
                    }
                });
            }

        })
    </script>
</head>
<body>

<%--顶部信息--%>
<div class="weui-cells" style="background-color: #3f4346;margin-top: 0">
    <div class="weui-cell">
        <div class="weui-cell__hd">
            <%--<button><span>&lt;</span></button>--%>
            <a href="javascript:history.back(-1);" class="weui-btn weui-btn_mini weui-btn_default">&lt;</a>
        </div>
        <div class="weui-cell__bd" style="text-align: center">
            <p style="color: white">我</p>
        </div>
    </div>
</div>

<%--头像简介--%>
<div class="weui-panel weui-panel_access">
    <div class="weui-panel__bd">
        <a href="/changePortrait" class="weui-media-box weui-media-box_appmsg userPortrait">
            <div class="weui-media-box__hd">
                <img class="weui-media-box__thumb" src="${user.userPortrait}">
            </div>
            <div class="weui-media-box__bd">
                <h4 class="weui-media-box__title">${user.username}</h4>
                <p class="weui-media-box__desc">${user.phoneNum}</p>
                <p class="weui-media-box__desc">
                    到期日期：${vipEndTime}
                </p>
            </div>
        </a>
    </div>
</div>

<hr>

<%--个人信息--%>
<div class="weui-cells" style="margin-bottom: 50px">

    <a class="weui-cell weui-cell_access" href="/open">
        <div class="weui-cell__hd"><img src="${pageContext.request.contextPath}/images/1.png" style="width:40px;margin-right:5px;display:block"></div>
        <div class="weui-cell__bd">
            <p>开通VIP</p>
        </div>
        <div class="weui-cell__ft"></div>
    </a>

    <a class="weui-cell weui-cell_access" href="/goVipServeValue">
        <div class="weui-cell__hd"><img src="${pageContext.request.contextPath}/images/2.png" alt="" style="width:40px;margin-right:5px;display:block"></div>
        <div class="weui-cell__bd">
            <p>VIP服务价值</p>
        </div>
        <div class="weui-cell__ft"></div>
    </a>

    <a class="weui-cell weui-cell_access" href="javascript:;">
        <div class="weui-cell__hd"><img src="${pageContext.request.contextPath}/images/3.png" alt="" style="width:40px;margin-right:5px;display:block"></div>
        <div class="weui-cell__bd">
            <p>海报中心</p>
        </div>
        <div class="weui-cell__ft"></div>
    </a>

    <a class="weui-cell weui-cell_access" href="/uploadQRcode">
        <div class="weui-cell__hd"><img src="${pageContext.request.contextPath}/images/4.png" alt="" style="width:40px;margin-right:5px;display:block"></div>
        <div class="weui-cell__bd">
            <p>上传二维码</p>
        </div>
        <div class="weui-cell__ft"></div>
    </a>

    <a class="weui-cell weui-cell_access" href="/changeUserinfo">
        <div class="weui-cell__hd"><img src="${pageContext.request.contextPath}/images/5.png" alt="" style="width:40px;margin-right:5px;display:block"></div>
        <div class="weui-cell__bd">
            <p>姓名：${user.username}</p>
        </div>
        <div class="weui-cell__ft"></div>
    </a>

    <a class="weui-cell weui-cell_access" href="/changeUserinfo">
        <div class="weui-cell__hd"><img src="${pageContext.request.contextPath}/images/6.png" alt="" style="width:40px;margin-right:5px;display:block"></div>
        <div class="weui-cell__bd">
            <p>联系方式：${user.phoneNum}</p>
        </div>
        <div class="weui-cell__ft"></div>
    </a>

    <a class="weui-cell weui-cell_access" href="/changeUserinfo">
        <div class="weui-cell__hd"><img src="${pageContext.request.contextPath}/images/7.png" alt="" style="width:40px;margin-right:5px;display:block"></div>
        <div class="weui-cell__bd">
            <p>所在城市：${user.city}</p>
        </div>
        <div class="weui-cell__ft"></div>
    </a>
</div>


<%--
<div class="weui-cells" style="margin-bottom: 50px">
    <a class="weui-cell weui-cell_access" href="/open">
        <div class="weui-cell__bd">
            <img src="${pageContext.request.contextPath}/images/1.png">
            <p>开通VIP</p>
        </div>
        <div class="weui-cell__ft">
        </div>
    </a>
    <a class="weui-cell weui-cell_access" href="/goVipServeValue">
        <div class="weui-cell__bd">
            <img src="${pageContext.request.contextPath}/images/2.png">
            <p>VIP服务价值</p>
        </div>
        <div class="weui-cell__ft">
        </div>
    </a>
    <a class="weui-cell weui-cell_access" href="javascript:;">
        <div class="weui-cell__bd">
            <img src="${pageContext.request.contextPath}/images/3.png">
            <p>海报中心</p>
        </div>
        <div class="weui-cell__ft">
        </div>
    </a>
    <a class="weui-cell weui-cell_access" href="/uploadQRcode">
        <div class="weui-cell__bd">
            <img src="${pageContext.request.contextPath}/images/4.png">
            <p>上传二维码</p>
        </div>
        <div class="weui-cell__ft">
        </div>
    </a>
    <a class="weui-cell weui-cell_access" href="/changeUserinfo">
        <div class="weui-cell__bd">
            <img src="${pageContext.request.contextPath}/images/5.png">
            <p>姓名：${user.username}</p>
        </div>
        <div class="weui-cell__ft">
        </div>
    </a>
    <a class="weui-cell weui-cell_access" href="/changeUserinfo">
        <div class="weui-cell__bd">
            <img src="${pageContext.request.contextPath}/images/6.png">
            <p>联系方式：${user.phoneNum}</p>
        </div>
        <div class="weui-cell__ft">
        </div>
    </a>
    <a class="weui-cell weui-cell_access" href="/changeUserinfo">
        <div class="weui-cell__bd">
            <img src="${pageContext.request.contextPath}/images/7.png">
            <p>所在城市：${user.city}</p>
        </div>
        <div class="weui-cell__ft">
        </div>
    </a>
</div>
--%>

<%--退出按钮--%>
<%--<a href="javascript:;" class="weui-btn  weui-btn_primary"
   style="width: 60%;text-align: center;margin-top: 20px;margin-bottom: 100px">
    退出登录
</a>--%>

<%--底部--%>
<jsp:include page="${pageContext.request.contextPath}/bottomMenu.jsp"/>
</body>
</html>

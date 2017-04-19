<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/4/19
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传二维码</title>
    <jsp:include page="${pageContext.request.contextPath}/headInfo.jsp"/>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
</head>
<body>
<script>

    //TODO 配置不成功 why？
    wx.config({
        debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
        appId: "${wxJsapiSignature.appId}", // 必填，公众号的唯一标识
        timestamp: "${wxJsapiSignature.timestamp}", // 必填，生成签名的时间戳
        nonceStr: "${wxJsapiSignature.nonceStr}", // 必填，生成签名的随机串
        signature: "${wxJsapiSignature.signature}",// 必填，签名，见附录1
        jsApiList: [
            'chooseImage', 'uploadImage', 'previewImage', 'downloadImage'
        ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
    });

    // config验证成功后执行
    wx.ready(function () {

    });

    // config验证失败后执行
    wx.error(function (res) {

    });


    //上传图片
    var serverIds = "";
    // 更换头像按钮点击
    function uploadQRcode() {
        wx.chooseImage({
            count: 1,                             //指定可以上传几张图片
            sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
            sourceType: ['album', 'camera'],      // 可以指定来源是相册还是相机，默认二者都有
            success: function (res) {
                var localIds = res.localIds;      // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片

                $("#QRcode").attr('src', localIds);
                //alert("图片src：" + $("#img")[0].src);
                syncUpload(localIds);
            }
        });
    }

    function syncUpload(localIds) {
        var localId = localIds.pop();        //.pop()方法去除最后一个元素
        wx.uploadImage({
            localId: localId,                // 需要上传的图片的本地ID，由chooseImage接口获得
            isShowProgressTips: 1,           // 默认为1，显示进度提示
            success: function (res) {
                var serverId = res.serverId; // 返回图片的服务器端serverId
                serverIds = serverId;
                $("#serverIds").val(serverIds);
                alert("二维码上传成功,serverIds:" + $("#serverIds").val())      //获取到图片的serverId，即media_id
            }
        });
    }
</script>

<%--顶部信息--%>
<div class="weui-cells" style="background-color: #3f4346;margin-top: 0">
    <div class="weui-cell">
        <div class="weui-cell__hd">
            <%--<button><span>&lt;</span></button>--%>
            <a href="javascript:history.back(-1);" class="weui-btn weui-btn_mini weui-btn_default">&lt;</a>
        </div>
        <div class="weui-cell__bd" style="text-align: center">
            <p style="color: white">上传二维码</p>
        </div>
    </div>
</div>

<%--图片--%>
<div style="width: 100%;margin: 20px auto">
    <img src="${pageContext.request.contextPath}/images/QRcode.png" alt="" id="QRcode" style="width: 100%">
</div>

<a href="/goHowTOUploadQRcode" class="weui-btn weui-btn_primary" style="width: 80%;margin-top: 10px">如何上传二维码</a>

<button onclick="uploadQRcode()" class="weui-btn weui-btn_primary" style="margin-bottom: 10px;margin-top: 10px;width: 80%">点击选择二维码</button>


<form action="/downloadQRcode" method="post">
    <input type="hidden" name="serverIds" id="serverIds" value=""/>

    <button type="submit" class="weui-btn weui-btn_primary" style="width: 80%;margin-bottom: 10px">确定</button>
</form>
<%--版权--%>
<div class="weui-footer" style="margin: 100px auto">
    <p class="weui-footer__links">
        <a href="javascript:void(0);" class="weui-footer__link">关注无极玄服务</a>
        <a href="contactUs" class="weui-footer__link">联系我们</a>
    </p>
    <p class="weui-footer__text">Copyright © 2017 芜湖雁脉传媒文化有限公司版权所有</p>
</div>

<%--底部--%>
<jsp:include page="${pageContext.request.contextPath}/bottomMenu.jsp"/>
</body>
</html>

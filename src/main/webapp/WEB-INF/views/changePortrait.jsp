<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/4/5
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传头像</title>
    <jsp:include page="${pageContext.request.contextPath}/headInfo.jsp"/>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js">
    </script>
</head>
<body>
<script>


    wx.config({
        debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
        appId: "${wxJsapiSignature.appId}", // 必填，公众号的唯一标识
        timestamp:"${wxJsapiSignature.timestamp}", // 必填，生成签名的时间戳
        nonceStr: "${wxJsapiSignature.nonceStr}", // 必填，生成签名的随机串
        signature:"${wxJsapiSignature.signature}",// 必填，签名，见附录1
        jsApiList: [
            'chooseImage','uploadImage','previewImage','downloadImage'
        ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
    });

    // config验证成功后执行
    wx.ready(function(){
        wx.uploadImage({
            localId: '', // 需要上传的图片的本地ID，由chooseImage接口获得
            isShowProgressTips: 1, // 默认为1，显示进度提示
            success: function (res) {
                var serverId = res.serverId; // 返回图片的服务器端ID
            }
        });
    });

    // config验证失败后执行
    wx.error(function(res){

    });

    //上传图片
    var serverIds = "";
    function uploadImg() {
        wx.chooseImage({
            count: 1,
            sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
            sourceType: ['album', 'camera'],      // 可以指定来源是相册还是相机，默认二者都有
            success: function (res) {
                var localIds = res.localIds;      // 返回选定照片的本地ID列表
                syncUpload(localIds);             // localId可作为img标签的src属性显示图片
            }
        });
    }

    function syncUpload(localIds) {
        var localId = localIds.pop();
        wx.uploadImage({
            localId: localId,                // 需要上传的图片的本地ID，由chooseImage接口获得
            isShowProgressTips: 1,           // 默认为1，显示进度提示
            success: function (res) {
                var serverId = res.serverId; // 返回图片的服务器端serverId
                serverIds =  serverId;
                $("#serverIds").val(serverIds);

                alert("图片上传成功")

            }
        });
    }


    // 更换头像按钮点击
    /*function changeImg() {
        wx.chooseImage({
            count: 1, // 默认9
            sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
            sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
            success: function (res) {
                var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
            }
        });
    }*/


</script>

<%--顶部信息--%>
<div class="weui-cells" style="background-color: #3f4346;margin-top: 0">
    <div class="weui-cell">
        <div class="weui-cell__hd">
            <%--<button><span>&lt;</span></button>--%>
            <a href="javascript:history.back(-1);" class="weui-btn weui-btn_mini weui-btn_default">&lt;</a>
        </div>
        <div class="weui-cell__bd" style="text-align: center">
            <p style="color: white">上传头像</p>
        </div>
    </div>
</div>

<%--TODO 实现头像更换--%>
<%--<div style="margin: 0 auto">--%>
    <%--<div class="weui-flex">
        <div class="weui-flex__item" >
            <img src="${user.userPortrait}" alt="" style="width: 50%;margin: 20px auto">
        </div>
    </div>--%>
    <%--<form action="/goUserinfoByChangeImg" method="post">--%>



        <img src="${user.userPortrait}" alt="" style="width: 60%;margin: 20px auto;text-align: center">
        <button onclick="uploadImg()" class="weui-btn weui-btn_primary" style="width: 30%">更换头像</button>

<form name="myForm" action="/downloadImage">
    <input type="hidden" name="serverIds" id="serverIds" value=""/>
    <input type="button" value="提交"/>
</form>

    <%--</form>--%>
    <%--<button onclick="changeImg()">更换头像</button>--%>
<%--</div>--%>


<%--底部--%>
<jsp:include page="${pageContext.request.contextPath}/bottomMenu.jsp"/>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/4/20
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>升级开通</title>
    <jsp:include page="${pageContext.request.contextPath}/headInfo.jsp"/>
    <script>
        function show() {
            $.confirm({
                title: '支付',
                text: '亲！请确认您的信息<br>（以下信息作为订单凭证）<br>姓名：${user.username}<br>手机号：${user.phoneNum}',
                onOK: function () {
                    //点击确认,调起支付
                    $.ajax({
                        url: "http://b.wujixuanyi.com/wxPay/getJSSDKPayInfo",
                        type: "post",
                        data: "",
                        success: function (data) {
                            var appId = data.appId;
                            var timeStamp = data.timeStamp;
                            var nonceStr = data.nonceStr;
                            var package = data.package;
                            var signType = data.signType;
                            var paySign = data.paySign;

                            function onBridgeReady() {
                                WeixinJSBridge.invoke(
                                    'getBrandWCPayRequest', {
                                        "appId": appId,     //公众号名称，由商户传入
                                        "timeStamp": timeStamp,         //时间戳，自1970年以来的秒数
                                        "nonceStr": nonceStr, //随机串
                                        "package": package,     //预支付id
                                        "signType": signType,         //微信签名方式：
                                        "paySign": paySign //微信签名
                                    },
                                    function (res) {
                                        if (res.err_msg == "get_brand_wcpay_request:ok") {
                                            //支付之后的页面跳转
                                            window.location.href = "http://b.wujixuanyi.com/paySucceed";
                                        } else {
                                            question = confirm("支付失败，是否重新支付");
                                            if (question) {
                                                pay();
                                            }
                                            // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。
                                        }
                                    }
                                );

                            }

                            if (typeof WeixinJSBridge == "undefined") {
                                if (document.addEventListener) {
                                    document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
                                } else if (document.attachEvent) {
                                    document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
                                    document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
                                }
                            } else {
                                onBridgeReady();
                            }

                        },
                        error: function () {
                            alert("error")
                        },
                        dataType: "json"

                    });

                },
                onCancel: function () {
                    //取消支付
                    alert("取消！")
                }
            });
        }

        /* function onBridgeReady() {
         WeixinJSBridge.invoke(
         'getBrandWCPayRequest', {
         "appId": appId,     //公众号名称，由商户传入
         "timeStamp": timeStamp,         //时间戳，自1970年以来的秒数
         "nonceStr": nonceStr, //随机串
         "package": package,     //预支付id
         "signType": signType,         //微信签名方式：
         "paySign": paySign //微信签名
         },
         function (res) {
         if (res.err_msg == "get_brand_wcpay_request:ok") {

         //支付之后的页面跳转

         } else {
         question = confirm("支付失败，是否重新支付");
         if (question) {
         pay();
         }
         // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。
         }
         }
         );

         }*/

        /*function pay() {
         if (typeof WeixinJSBridge == "undefined") {
         if (document.addEventListener) {
         document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
         } else if (document.attachEvent) {
         document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
         document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
         }
         } else {
         onBridgeReady();
         }

         }*/

    </script>
</head>
<body>

<%--顶部信息（取消）--%>
<%--<div class="weui-cells" style="background-color: #3f4346;margin-top: 0">
    <div class="weui-cell">
        <div class="weui-cell__hd">
            &lt;%&ndash;<button><span>&lt;</span></button>&ndash;%&gt;
            <a href="javascript:history.back(-1);" class="weui-btn weui-btn_mini weui-btn_default">&lt;</a>
        </div>
        <div class="weui-cell__bd" style="text-align: center">
            <p style="color: white">升级开通</p>
        </div>
    </div>
</div>--%>

<%--图片--%>
<div>
    <img src="${pageContext.request.contextPath}/images/kaitong.jpg" alt="" style="width: 100%;margin-bottom: 50px">
</div>

<%--<div id="open">
    <a href="javascript:" class="weui-btn weui-btn_warn" style="margin:0 auto;">马上开通</a>
</div>--%>

<button href="javascript:" class="weui-btn weui-btn_warn"
        style="position: fixed;bottom: 60px;left: 15%;width: 70%;height: 50px" onclick="show()">
    马&nbsp;上&nbsp;开&nbsp;通
</button>


<jsp:include page="${pageContext.request.contextPath}/bottomMenu.jsp"/>
</body>
</html>

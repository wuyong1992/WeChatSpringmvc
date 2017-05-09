<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/5/3
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--/meta 作为公共模版分离出去-->
    <jsp:include page="_meta.jsp"/>
    <title>新增文章</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/wangEditor/css/wangEditor.min.css">
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
        <span class="c-gray en">&gt;</span> 文章管理
        <span class="c-gray en">&gt;</span> 添加文章
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
           href="javascript:location.replace(location.href);" title="刷新">
            <i class="Hui-iconfont">&#xe68f;</i>
        </a>
    </nav>
    <div class="Hui-article">
        <article class="page-container">
            <form class="form form-horizontal" id="form-article-add" action="/admin/articleUpload" method="post"
                  enctype="multipart/form-data">
                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章标题：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" value="" placeholder="" id="articletitle" name="title">
                    </div>
                </div>

                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章分类：</label>
                    <div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
				<select name="articleType" class="select" id="articleSelect" onchange="selectChange()">
					<option value="1">首页</option>
                    <option value="2">每日动态</option>
                    <option value="3">产品介绍</option>
                    <option value="4">玄灸图谱</option>
				</select>
				</span>
                    </div>
                </div>

                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章类型：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <div id="radioDiv" style="width: 30%;margin-right: 20px;text-align: center;">

                            <img src="${pageContext.request.contextPath}/images/TextType1.png" alt=""
                                 style="width: 100%">
                            <input type="radio" name="imgType" value="1" onclick="showArticleType()">
                            <hr style="margin: 10px">
                            <img src="${pageContext.request.contextPath}/images/TextType2.png" alt=""
                                 style="width: 100%">
                            <input type="radio" id="radio-1" name="imgType" value="2" onclick="showArticleType()">
                            <hr style="margin: 10px">
                            <img src="${pageContext.request.contextPath}/images/TextType3.png" alt=""
                                 style="width: 100%">
                            <input type="radio" name="imgType" value="3" onclick="showArticleType()">
                        </div>
                    </div>
                </div>

                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-2">文章图片：</label>
                    <div class="formControls col-xs-8 col-sm-9" id="imgDiv">

                        <%--动态显示图片--%>
                        <div id="selectImg1" style="display: none">
                            <img src="${pageContext.request.contextPath}/images/moren.jpg" alt="" id="showImg1"
                                 style="width: 200px;height: 150px;margin-bottom: 10px">
                            <br>
                            <span class="btn-upload">
                                <a href="javascript:;" class="btn btn-primary radius"><i class="iconfont">&#xf0020;</i> 浏览文件</a>
                            <input type="file" id="myImg1" class="input-file" name="file" value="选择图片"
                                   accept="image/gif,image/png,image/jpeg,image/jpg">
                            </span>
                        </div>

                        <div id="selectImg2" style="display: none">
                            <img src="${pageContext.request.contextPath}/images/moren.jpg" alt="" id="showImg2"
                                 style="width: 200px;height: 150px">
                            <br>
                            <span class="btn-upload">
                                <a href="javascript:;" class="btn btn-primary radius"><i class="iconfont">&#xf0020;</i> 浏览文件</a>
                            <input type="file" id="myImg2" class="input-file" name="file" value="选择图片"
                                   accept="image/gif,image/png,image/jpeg,image/jpg">
                            </span>
                        </div>

                        <div id="selectImg3" style="display: none">
                            <img src="${pageContext.request.contextPath}/images/moren.jpg" alt="" id="showImg3"
                                 style="width: 200px;height: 150px">
                            <br>
                            <span class="btn-upload">
                                <a href="javascript:;" class="btn btn-primary radius"><i class="iconfont">&#xf0020;</i> 浏览文件</a>
                            <input type="file" id="myImg3" class="input-file" name="file" value="选择图片"
                                   accept="image/gif,image/png,image/jpeg,image/jpg">
                            </span>
                        </div>

                    </div>
                </div>

                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-2">排序值：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" value="0" placeholder="" id="articlesort" name="sort">
                    </div>
                </div>
                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-2">状态：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" value="" placeholder="0:禁用，1:发布，默认1" name="status">
                    </div>
                </div>

                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-2">文章简介：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <textarea name="intro" cols="" rows="" class="textarea" placeholder="文章简介，至少10个字符"
                                  datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！"
                                  onKeyUp="$.Huitextarealength(this,200)"></textarea>
                        <p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
                    </div>
                </div>


                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-2">文章内容：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <textarea id="editor" name="content" style="height: 600px;width: 100%"></textarea>
                    </div>
                </div>
                <div class="row cl">
                    <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                        <button id="btn" class="btn btn-primary radius" type="submit">
                            <i class="Hui-iconfont">&#xe632;</i> 保存并发布
                        </button>
                        <%--TODO 通过controller返回文章列表--%>
                        <button class="btn btn-default radius" type="button"
                                onclick="window.open('/admin/article-list')">
                            &nbsp;&nbsp;取消&nbsp;&nbsp;
                        </button>
                    </div>
                </div>
            </form>
        </article>
    </div>
</section>

<!--_footer 作为公共模版分离出去-->
<jsp:include page="_footer.jsp"/>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/wangEditor/js/wangEditor.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">

    $(function () {
        if ($.validator) {
            //fix: when several input elements shares the same name, but has different id-ies....
            $.validator.prototype.elements = function () {
                var validator = this,
                rulesCache = {};
                return $([]).add(this.currentForm.elements)
                    .filter(":input")
                    .not(":submit, :reset, :image, [disabled]")
                    .not(this.settings.ignore)
                    .filter(function () {
                        var elementIdentification = this.id || this.name;
                        !elementIdentification && validator.settings.debug && window.console && console.error("%o has no id nor name assigned", this);
                        if (elementIdentification in rulesCache || !validator.objectLength($(this).rules()))
                        return false;
                        rulesCache[elementIdentification] = true;
                        return true;
                    });
            };
        }
    });


    $(function () {
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        //表单验证
        $("#form-article-add").validate({
            rules: {
                title: {
                    required: true
                },
                articleType: {
                    required: true
                },
                imgType: {
                    required: true
                },
                sort: {
                    digits: true,
                    min: 0
                },
                status: {
                    digits: true,
                    range: [0, 1],
                    maxlength: 1
                },
                keywords: {
                    required: true
                },
                intro: {
                    required: true
                },
                file:{
                    required: true
                }

            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            submitHandler: function (form) {
                //$(form).ajaxSubmit();
                form.submit();
                //var index = parent.layer.getFrameIndex(window.name);
                //parent.$('.btn-refresh').click();
                //parent.layer.close(index);
            }
        });

        //初始化富文本
        $(function () {
            var editor = new wangEditor('editor');
            editor.config.uploadImgUrl = '/admin/uploadImg';
            editor.config.uploadImgFileName = 'myFileName';
            editor.create();
        });
    });



    function selectChange() {
        //获取文章分类的值
        var articleSelect = $("#articleSelect").val();
        console.log(articleSelect);
        if (articleSelect != 1) {
            $("#radioDiv").hide();
            $("#selectImg1").remove();
            <%--$("#imgDiv").append('<div id="selectImg1"> <img src="${pageContext.request.contextPath}/images/moren.jpg" alt="" id="showImg1"style="width: 200px;height: 150px;margin-bottom: 10px"> <br> <span class="btn-upload"> <a href="javascript:;" class="btn btn-primary radius"><i class="iconfont">&#xf0020;</i> 浏览文件</a> <input type="file" id="myImg1" class="input-file" name="file" value="选择图片" accept="image/gif,image/png,image/jpeg,image/jpg"> </span> </div>');--%>
        } else {
            $("#radioDiv").show();
        }
    }


    //获取文章类型的值
    function showArticleType() {
        var imgType = $('#radioDiv input[name="imgType"]:checked ').val();

        console.log(imgType);

        if (imgType == 1 || imgType == 2) {

            /*$("#selectImg1").remove();
            $("#selectImg2").remove();
            $("#selectImg3").remove();
            $("#imgDiv").append('<div id="selectImg1"> <img src="${pageContext.request.contextPath}/images/moren.jpg" alt="" id="showImg1"style="width: 200px;height: 150px;margin-bottom: 10px"> <br> <span class="btn-upload"> <a href="javascript:;" class="btn btn-primary radius"><i class="iconfont">&#xf0020;</i> 浏览文件</a> <input type="file" id="myImg1" class="input-file" name="file" value="选择图片" accept="image/gif,image/png,image/jpeg,image/jpg"> </span> </div>');
*/
            $("#selectImg1").show();
            $("#selectImg2").hide();
            $("#selectImg3").hide();

        }
        if (imgType == 3) {

            /*$("#selectImg1").remove();
            $("#selectImg2").remove();
            $("#selectImg3").remove();
            $("#imgDiv").append('<div id="selectImg1"> <img src="${pageContext.request.contextPath}/images/moren.jpg" alt="" id="showImg1"style="width: 200px;height: 150px;margin-bottom: 10px"> <br> <span class="btn-upload"> <a href="javascript:;" class="btn btn-primary radius"><i class="iconfont">&#xf0020;</i> 浏览文件</a> <input type="file" id="myImg1" class="input-file" name="file" value="选择图片" accept="image/gif,image/png,image/jpeg,image/jpg"> </span> </div>');
            $("#imgDiv").append('<div id="selectImg2"> <img src="${pageContext.request.contextPath}/images/moren.jpg" alt="" id="showImg2"style="width: 200px;height: 150px;margin-bottom: 10px"> <br> <span class="btn-upload"> <a href="javascript:;" class="btn btn-primary radius"><i class="iconfont">&#xf0020;</i> 浏览文件</a> <input type="file" id="myImg2" class="input-file" name="file" value="选择图片" accept="image/gif,image/png,image/jpeg,image/jpg"> </span> </div>');
            $("#imgDiv").append('<div id="selectImg3"> <img src="${pageContext.request.contextPath}/images/moren.jpg" alt="" id="showImg3"style="width: 200px;height: 150px;margin-bottom: 10px"> <br> <span class="btn-upload"> <a href="javascript:;" class="btn btn-primary radius"><i class="iconfont">&#xf0020;</i> 浏览文件</a> <input type="file" id="myImg3" class="input-file" name="file" value="选择图片" accept="image/gif,image/png,image/jpeg,image/jpg"> </span> </div>');
 */
            $("#selectImg1").show();
            $("#selectImg2").show();
            $("#selectImg3").show();
        }
    }


    //图片上传预览
    $("#myImg1").change(function () {
        var objUrl = getObjectURL(this.files[0]);
        console.log("objUrl = " + objUrl);
        if (objUrl) {
            $("#showImg1").attr("src", objUrl);
        }
    });
    $("#myImg2").change(function () {
        var objUrl = getObjectURL(this.files[0]);
        console.log("objUrl = " + objUrl);
        if (objUrl) {
            $("#showImg2").attr("src", objUrl);
        }
    });
    $("#myImg3").change(function () {
        var objUrl = getObjectURL(this.files[0]);
        console.log("objUrl = " + objUrl);
        if (objUrl) {
            $("#showImg3").attr("src", objUrl);
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
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>

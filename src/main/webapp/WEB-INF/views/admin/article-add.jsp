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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/html5up/control/css/zyUpload.css">
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
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"href="javascript:location.replace(location.href);" title="刷新">
            <i class="Hui-iconfont">&#xe68f;</i>
        </a>
    </nav>
    <div class="Hui-article">
        <article class="page-container">
            <%--<form class="form form-horizontal" id="form-article-add" action="/admin/articleHandle" method="post" enctype="multipart/form-data">--%>
            <form class="form form-horizontal" id="form-article-add" action="/admin/articleUpload" method="post" enctype="multipart/form-data">
                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章标题：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" value="" placeholder="" id="articletitle" name="articletitle">
                    </div>
                </div>

                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章分类：</label>
                    <div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
				<select name="articletype" class="select">
					<option value="1">首页</option>
                    <option value="2">产品介绍</option>
                    <option value="3">加盟合作</option>
                    <option value="4">玄灸图谱</option>
				</select>
				</span>
                    </div>
                </div>

                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章类型：</label>
                    <div class="formControls col-xs-8 col-sm-9" >
                        <div style="width: 30%;margin-right: 20px;text-align: center;display: inline-block">
                            <img src="${pageContext.request.contextPath}/images/TextType1.png" alt="" style="width: 100%"><br>
                            <input type="radio" name="article">
                        </div>
                        <div style="width: 30%;margin-right: 20px;text-align: center;display: inline-block">
                            <img src="${pageContext.request.contextPath}/images/TextType2.png" alt="" style="width: 100%"><br>
                            <input type="radio" name="article">
                        </div>
                        <div style="width: 30%;text-align: center;display: inline-block">
                            <img src="${pageContext.request.contextPath}/images/TextType3.png" alt="" style="width: 100%"><br>
                            <input type="radio" name="article">
                        </div>
                    </div>
                </div>

                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-2">文章图片：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <%--<div class="uploader-thum-container">
                            <div id="fileList" class="uploader-list"></div>
                            <div id="filePicker">选择图片</div>
                            &lt;%&ndash;<button id="btn" class="btn btn-default btn-uploadstar radius ml-10">开始上传</button>&ndash;%&gt;
                        </div>--%>
                        <input type="file" name="file">
                        <input type="file" name="file">
                           <%-- <div id="demo" class="demo"></div>--%>
                    </div>
                </div>

               <%-- <div id="uploader-demo">
                    <!--用来存放item-->
                    <div id="fileList" class="uploader-list"></div>
                    <div id="upInfo"></div>
                    <div id="filePicker">选择图片</div>
                </div>
                <input type="button" id="btn" value="开始上传">--%>

                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-2">排序值：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" value="0" placeholder="" id="articlesort" name="articlesort">
                    </div>
                </div>

                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-2">文章简介：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <textarea name="abstract" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="$.Huitextarealength(this,200)"></textarea>
                        <p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
                    </div>
                </div>


                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-2">文章内容：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <textarea id="editor" name="editorValue" style="height: 600px;width: 100%"></textarea>
                    </div>
                </div>
                <div class="row cl">
                    <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                        <button id="btn" class="btn btn-primary radius" type="submit">
                            <i class="Hui-iconfont">&#xe632;</i> 保存并发布
                        </button>
                        <%--TODO 通过controller返回文章列表--%>
                        <button  class="btn btn-default radius" type="button" onclick="window.open('/admin/article-list')">
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
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/wangEditor/js/wangEditor.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/html5up/control/js/zyUpload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/html5up/core/zyFile.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/html5up/core/jq22.js"></script>
<script type="text/javascript">

    //取消页面
    /*function removeIframe() {
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        parent.layer.close(index); //再执行关闭
    }*/

    //文章保存并发布
    /*function article_save() {
        window.parent.location.reload();
    }*/


    $(function(){
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        //表单验证TODO 无效
        $("#form-article-add").validate({
            rules: {
                articletitle: {
                    required: true
                },
                articletitle2: {
                    required: true
                },
                articlecolumn: {
                    required: true
                },
                articletype: {
                    required: true
                },
                articlesort: {
                    required: true
                },
                keywords: {
                    required: true
                },
                abstract: {
                    required: true
                },
                author: {
                    required: true
                },
                sources: {
                    required: true
                },
                allowcomments: {
                    required: true
                },
                commentdatemin: {
                    required: true
                },
                commentdatemax: {
                    required: true
                },

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
        })

        //html5up


    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>

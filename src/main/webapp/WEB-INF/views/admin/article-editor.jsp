<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/5/3
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--/meta 作为公共模版分离出去-->
    <jsp:include page="_meta.jsp"/>
    <title>文章展示、修改</title>
</head>
<body>
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
            <form class="form form-horizontal" id="form-article-add" action="/admin/articleHandle">
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
                        <div class="uploader-thum-container">
                            <div id="fileList" class="uploader-list"></div>
                            <div id="filePicker">选择图片</div>
                            <button id="btn" class="btn btn-default btn-uploadstar radius ml-10">开始上传</button>
                        </div>
                    </div>
                </div>

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
                        <div style="width: 100%">
                            <script id="editor" type="text/plain" ></script>
                        </div>
                    </div>
                </div>
                <div class="row cl">
                    <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                        <button class="btn btn-primary radius" type="submit">
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

<script type="text/javascript">
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
                    required: true,
                },
                articletitle2: {
                    required: true,
                },
                articlecolumn: {
                    required: true,
                },
                articletype: {
                    required: true,
                },
                articlesort: {
                    required: true,
                },
                keywords: {
                    required: true,
                },
                abstract: {
                    required: true,
                },
                author: {
                    required: true,
                },
                sources: {
                    required: true,
                },
                allowcomments: {
                    required: true,
                },
                commentdatemin: {
                    required: true,
                },
                commentdatemax: {
                    required: true,
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

        //文章图片上传
        var $ = jQuery,
            $list = $('#fileList'),
            // 优化retina, 在retina下这个值是2
            ratio = window.devicePixelRatio || 1,
            // 缩略图大小
            thumbnailWidth = 100 * ratio,
            thumbnailHeight = 100 * ratio,
            // Web Uploader实例
            uploader;
        // 初始化Web Uploader
        uploader = WebUploader.create({
            // 自动上传。
            auto: false,
            // swf文件路径
            swf: '${pageContext.request.contextPath}/lib/webuploader/0.1.5/webuploader/Uploader.swf',
            // 文件接收服务端。
            server: 'avatarUploader',
            threads: '5',        //同时运行5个线程传输
            fileNumLimit: '1',  //文件总数量只能选择10个

            // 选择文件的按钮。可选。
            pick: {
                id: '#filePicker',  //选择文件的按钮
                multiple: true
            },   //允许可以同时选择多个图片
            // 图片质量，只有type为`image/jpeg`的时候才有效。
            quality: 90,

            //限制传输文件类型，accept可以不写
            accept: {
                title: 'Images',//描述
                extensions: 'gif,jpg,jpeg,png',//类型
                mimeTypes: 'image/gif,image/jpg,image/jpeg,image/png' //mime类型
            }
        });


        // 当有文件添加进来的时候，创建img显示缩略图使用
        uploader.on('fileQueued', function (file) {
            var $li = $(
                    '<div id="' + file.id + '" class="file-item thumbnail">' +
                    '<img>' +
                    '<div class="info">' + file.name + '</div>' +
                    '</div>'
                ),
                $img = $li.find('img');

            // $list为容器jQuery实例
            $list.append($li);

            // 创建缩略图
            // 如果为非图片文件，可以不用调用此方法。
            // thumbnailWidth x thumbnailHeight 为 100 x 100
            uploader.makeThumb(file, function (error, src) {
                if (error) {
                    $img.replaceWith('<span>不能预览</span>');
                    return;
                }

                $img.attr('src', src);
            }, thumbnailWidth, thumbnailHeight);
        });

        // 文件上传过程中创建进度条实时显示。    uploadProgress事件：上传过程中触发，携带上传进度。 file文件对象 percentage传输进度 Nuber类型
        uploader.on('uploadProgress', function (file, percentage) {
            var $li = $('#' + file.id),
                $percent = $li.find('.progress span');

            // 避免重复创建
            if (!$percent.length) {
                $percent = $('<p class="progress"><span></span></p>')
                    .appendTo($li)
                    .find('span');
            }

            $percent.css('width', percentage * 100 + '%');
        });

        // 文件上传成功时候触发，给item添加成功class, 用样式标记上传成功。 file：文件对象，    response：服务器返回数据
        uploader.on('uploadSuccess', function (file, response) {
            $('#' + file.id).addClass('upload-state-done');
            //console.info(response);
            $("#upInfo").html("<font color='red'>" + response._raw + "</font>");
        });

        // 文件上传失败                                file:文件对象 ， code：出错代码
        uploader.on('uploadError', function (file, code) {
            var $li = $('#' + file.id),
                $error = $li.find('div.error');

            // 避免重复创建
            if (!$error.length) {
                $error = $('<div class="error"></div>').appendTo($li);
            }

            $error.text('上传失败!');
        });

        // 不管成功或者失败，文件上传完成时触发。 file： 文件对象
        uploader.on('uploadComplete', function (file) {
            $('#' + file.id).find('.progress').remove();
        });

        //绑定提交事件
        $("#btn").click(function () {
            uploader.upload();   //执行手动提交
        });



        //初始化富文本
        $(function () {
            var editor = new wangEditor('editor');
            editor.config.uploadImgUrl = '/admin/uploadImg';
            editor.config.uploadImgFileName = 'myFileName';
            editor.create();
        })


    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>

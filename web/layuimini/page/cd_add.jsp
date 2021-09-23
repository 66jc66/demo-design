<%--
  Created by IntelliJ IDEA.
  User: 19041
  Date: 2021/8/11
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>专辑添加</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="../lib/layui-v2.6.3/css/layui.css" media="all">
        <link rel="stylesheet" href="../css/public.css" media="all">
        <style>
            body {
                background-color: #ffffff;
            }
        </style>
    </head>
<body>
<div class="layui-form layuimini-form">
    <form id="detForm" action="${pageContext.request.contextPath}/cd?key=insertCd" method="post" enctype="multipart/form-data">
        <div class="layui-form-item">
            <label class="layui-form-label required">专辑名</label>
            <div class="layui-input-block">
                <input type="text" name="cdName" id="cdName" lay-verify="required" lay-reqtext="专辑名不能为空"
                       placeholder="请输入专辑名"
                       value="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label required">歌手</label>
            <div class="layui-input-block">
                <input type="text" name="singer" lay-verify="required" lay-reqtext="歌手不能为空" placeholder="请输入歌手"
                       value="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label required">地区</label>
            <div class="layui-input-block">
                <select name="city" lay-verify="" >
                    <option>请选择地区</option>
                    <option value="华语">华语</option>
                    <option value="英语">英语</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">年代</label>
            <div class="layui-input-block">
<%--                <input type="text" name="cyear" placeholder="请输入首字母" value="" class="layui-input">--%>
                <select name="cyear" lay-verify="" >
                    <option>请选择所属的年代</option>
                    <option value="2020">2020</option>
                    <option value="2019">2019</option>
                    <option value="2018">2018</option>
                    <option value="2017">2017</option>
                    <option value="2016">2016</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label required">专辑图片上传</label>
            <div class="layui-input-block">
                <input type="file" class="layui-btn" name="cphoto" id="cphoto" value="">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label required">是否热门</label>
            <div class="layui-input-block">
                <input type="radio" name="popular" value="1" title="是" checked="">
                <input type="radio" name="popular" value="0" title="否">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认保存</button>
            </div>
        </div>
    </form>
</div>

<script src="../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'upload'], function () {
        var form = layui.form,
            upload = layui.upload,
            layer = layui.layer,
            $ = layui.jquery;
        //专辑绑定一个失去焦点事件
        $("#cdName").blur(function () {
            //获取专辑信息
            var cdName = $("#cdName").val();
            //验证账号是否为空
            if (cdName == null || $.trim(cdName).length == 0) {
                layer.msg("专辑名不能为空");
                return;
            }
            //验证专辑名是否重复：使用ajax异步
            $.ajax({
                url: "${pageContext.request.contextPath}/cd",//需要使用绝对路径
                type: "post",
                data: {
                    "key": "checkByCdName",
                    "cdName": cdName
                },
                dataType: "json",
                success: function (obj) {
                    console.log(obj);
                    if (obj == "ok") {
                        layer.msg("专辑无重复，可以添加 ");
                    } else {
                        layer.msg("专辑已有，请添加新的专辑");
                    }
                }
            })
        });
        //监听提交
        form.on('submit(saveBtn)', function (data) {
            //获取数据，并使用弹框显示在页面上
            var index = layer.alert(JSON.stringify(data.field), {
                    title: '最终的提交信息'
                },
                //提交表单
                document.getElementById('detForm').submit()
                // function () {
                //      // 关闭弹出层
                //     layer.close(index);
                //     var iframeIndex = parent.layer.getFrameIndex(window.name);
                //     parent.layer.close(iframeIndex);
                // }

            );
            return false;
        });

    });
</script>
</body>
</html>



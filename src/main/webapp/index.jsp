<%--
  Created by IntelliJ IDEA.
  User: chenyuan
  Date: 4/29/14
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图片上传测试</title>
    <link rel="stylesheet" href="/uploadify/uploadify.css"/>
    <script src="/jquery-1.8.1.js"></script>
    <script src="/uploadify/jquery.uploadify.js"></script>
    <style type="text/css">
        #some-file-queue {
            background-color: #FFF;
            border-radius: 3px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.25);
            height: 103px;
            margin-bottom: 10px;
            padding: 5px 10px;
            height: 120px;
            width: 480px;
            display: none;
        }

        #some-file-queue li {
            margin: 5px;
            list-style-type: none;
            float: left;
            padding: 5px;
            width: 100px;
            height: 100px;
        }

        .uploadify-queue-item .cancel {
            width: 20px;
            height: 20px;
            text-align: center;
            position: absolute;
            top: 0px;
            right: 0px;
            z-index: 99
        }

        .li-content {
            position: relative;
            width: 100px;
            height: 100px;
            text-align: center;
        }

        .image-content {
            width: 100px;
            height: 100px;
            text-align: center;
            display: table-cell;
            vertical-align: middle;
        }

        .image-content img {
            vertical-align: middle;
        }
    </style>

    <script>
        $(function () {
            $('#fileUpload').uploadify({
                'auto': true,
                //'buttonClass': 'upload-button-cus',
                'buttonCursor': 'arrow',
                //'buttonImage': '/image_add_48.png',
                'buttonText': 'BROWSE...',
                //'debug': true,
                'fileObjName': 'photo',
                //'fileSizeLimit': '100KB',// 图片上传的大小
                //'fileTypeDesc': 'Image Files',
                //'fileTypeExts': '*.gif; *.jpg; *.png',
                //'formData': {},
                //'height': 20,
                //'width': 30,
                'itemTemplate': '<li id="\${fileID}" class="uploadify-queue-item">\
                    <div class="li-content">\
                        <div class="cancel">\
                            <a href="javascript:$(\'#\${instanceID}\').uploadify(\'cancel\', \'\${fileID}\')">X</a>\
                        </div>\
                        <div class="image-content">\
                            <span class="fileName"></span><span class="data"></span>\
                        </div>\
                    </div>\
                </li>',
                'method': 'post',// 提交方式
                'multi': true, // 设置false, 则只能选中一张图片
                //'overrideEvents': ['onUploadProgress'],  // The progress will not be updated
                'preventCaching': true,// true 防止缓存
                'progressData': 'speed',// speed + percentage
                'queueID': 'some-file-queue',
                'queueSizeLimit': 4,// 每次上传的张数
                'removeCompleted': false,
                //'removeTimeout': 10,
                //'requeueErrors': true,
                //'checkExisting': '/uploadify/check-exists.php',
                'swf': '/uploadify/uploadify.swf',
                'uploader': 'servlet/Upload',
                'uploadLimit': 4, // 图片上传的数量
                //data 就是返回的JSON
                'onUploadSuccess' : function(file, data, response) {
                    //console.log('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);
                    if (response) {
                        data = eval('(' + data + ')');
                        var html = [
                            '<div class="li-content">',
                            '   <div class="cancel">',
                                    '<a href="javascript:$(\'#fileUpload\').uploadify(\'cancel\', \'' + file.id + '\')">X</a>',
                            '   </div>',
                            '   <div class="image-content">',
                                    '<img src="/uploads/' + data.filename + '" alt=""/>',
                            '   </div>',
                            '</div>'
                        ].join('');
                        $('#' + file.id).html(html);
                    }
                    $('#some-file-queue').show();
                }
            });
        });
    </script>
</head>
<body>
Hello World!!!
<hr/>
<input type="file" name="fileUpload" id="fileUpload"/>
<ul id="some-file-queue"></ul>
</body>
</html>

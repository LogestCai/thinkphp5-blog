{__NOLAYOUT__}
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <title>跳转提示</title>
</head>
<body>
<link href="__STATICS__/admin/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="__STATICS__/admin/global/plugins/jquery.min.js" type="text/javascript"></script>
<link href="__STATICS__/admin/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />
<script src="__STATICS__/admin/global/plugins/bootstrap-sweetalert/sweetalert.js" type="text/javascript"></script>
<!--
* $msg 待提示的消息
* $url 待跳转的链接
* $time 弹出维持时间（单位秒）
* icon 这里主要有两个layer的表情，5和6，代表（哭和笑）
-->
<script type="text/javascript">
    (function(){
        var msg = '<?php echo(strip_tags($msg));?>';
        var url = '<?php echo($url);?>';
        // 去除.html
        url = url.replace(/\.html/, "");
        var wait = '<?php echo($wait);?>';
        <?php
        switch ($code) {
            case 1:
                    ?>

                swal({
                    title: "成功",
                    text:msg,
                    icon: "success",
                    timer: wait*1000
                });
            <?php
                break;
            case 0:
                    ?>
                swal({
                    title: "失败",
                    text:msg,
                    icon: "error",
                    timer: wait*1000
                });
            <?php
                break;
        }
            ?>
        setTimeout(function(){
            location.href=url;
        },3000)
    })();
</script>
</body>
</html>
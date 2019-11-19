{__NOLAYOUT__}<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>跳转提示1</title>
    <style type="text/css">
        *{ padding: 0; margin: 0; }
        body{ background: #fff; font-family: "Microsoft Yahei","Helvetica Neue",Helvetica,Arial,sans-serif; color: #333; font-size: 16px; }
        .system-message{ padding: 24px 48px; }
        .system-message h1{ font-size: 100px; font-weight: normal; line-height: 120px; margin-bottom: 12px; }
        .system-message .jump{ padding-top: 10px; }
        .system-message .jump a{ color: #333; }
        .system-message .success,.system-message .error{ line-height: 1.8em; font-size: 36px; }
        .system-message .detail{ font-size: 12px; line-height: 20px; margin-top: 12px; display: none; }
    </style>
    <link href="__STATICS__/admin/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />

</head>
<body   style="margin:auto;width:20%;margin-top:20%;border:1px solid red;background:#F9F9F9">
    <div class="system-message">
      <!-- 成功提示 -->
        <?php switch ($code) {?>
         
            <?php case 1:?>
            <div class="sweet-alert showSweetAlert visible" data-custom-class="" data-has-cancel-button="false" data-has-confirm-button="true" data-allow-outside-click="false" data-has-done-function="false" data-animation="pop" data-timer="null" style="display: block; margin-top: -176px;"><div class="sa-icon sa-error" style="display: none;">
              <span class="sa-x-mark">
                <span class="sa-line sa-left"></span>
                <span class="sa-line sa-right"></span>
              </span>
            </div><div class="sa-icon sa-warning" style="display: none;">
              <span class="sa-body"></span>
              <span class="sa-dot"></span>
            </div><div class="sa-icon sa-info" style="display: none;"></div><div class="sa-icon sa-success animate" style="display: block;">
              <span class="sa-line sa-tip animateSuccessTip"></span>
              <span class="sa-line sa-long animateSuccessLong"></span>

              <div class="sa-placeholder"></div>
              <div class="sa-fix"></div>
            </div><div class="sa-icon sa-custom" style="display: none; width: 80px; height: 80px; "></div><h2>OK!</h2>
            <p style="display: block;"><?php echo(strip_tags($msg));?>,正在跳转，等待时间： <b id="wait"><?php echo($wait);?></b></p>
            <fieldset>
              <input type="text" tabindex="3" placeholder="">
              <div class="sa-input-error"></div>
            </fieldset><div class="sa-error-container">
              <div class="icon">!</div>
              <p>Not valid!</p>
            </div><div class="sa-button-container">
              <button class="cancel" tabindex="2" style="display: none; box-shadow: none;">取消</button>
             <a id="href" href="<?php echo($url);?>"> <button class="confirm" tabindex="1" style="display: inline-block; box-shadow: rgba(174, 222, 244, 0.8) 0px 0px 2px, rgba(0, 0, 0, 0.0470588) 0px 0px 0px 1px inset; background-color: rgb(174, 222, 244);">立即跳转</button></a>
            </div></div>

           
         
            <?php break;?>
    <!-- 失败提示 -->
            <?php case 0:?>
           <div class="sweet-alert showSweetAlert visible" data-custom-class="" data-has-cancel-button="false" data-has-confirm-button="true" data-allow-outside-click="false" data-has-done-function="false" data-animation="pop" data-timer="null" style="display: block; margin-top: -176px;"><div class="sa-icon sa-error animateErrorIcon" style="display: block;">
          <span class="sa-x-mark animateXMark">
            <span class="sa-line sa-left"></span>
            <span class="sa-line sa-right"></span>
          </span>
        </div><div class="sa-icon sa-warning" style="display: none;">
          <span class="sa-body"></span>
          <span class="sa-dot"></span>
        </div><div class="sa-icon sa-info" style="display: none;"></div><div class="sa-icon sa-success" style="display: none;">
          <span class="sa-line sa-tip"></span>
          <span class="sa-line sa-long"></span>

          <div class="sa-placeholder"></div>
          <div class="sa-fix"></div>
        </div><div class="sa-icon sa-custom" style="display: none;"></div><h2>失败!</h2>
        <p style="display: block;"><?php echo(strip_tags($msg));?>,正在跳转，等待时间： <b id="wait"><?php echo($wait);?></b></p>
        <fieldset>
          <input type="text" tabindex="3" placeholder="">
          <div class="sa-input-error"></div>
        </fieldset><div class="sa-error-container">
          <div class="icon">!</div>
          <p>Not valid!</p>
        </div><div class="sa-button-container">
          <button class="cancel" tabindex="2" style="display: none; box-shadow: none;">取消</button>
          <a id="href" href="<?php echo($url);?>"> <button class="confirm" tabindex="1" style="display: inline-block; box-shadow: rgba(174, 222, 244, 0.8) 0px 0px 2px, rgba(0, 0, 0, 0.0470588) 0px 0px 0px 1px inset; background-color: rgb(174, 222, 244);">立即跳转</button></a>
        </div></div>

            <?php break;?>
        <?php } ?>
        <p class="detail"></p>
        <p class="jump">
            页面自动 <a id="href" href="<?php echo($url);?>">跳转</a> 等待时间： <b id="wait"><?php echo($wait);?></b>
        </p>
    </div>
    <script type="text/javascript">
        (function(){
            var wait = document.getElementById('wait'),
                href = document.getElementById('href').href;
            var interval = setInterval(function(){
                var time = --wait.innerHTML;
                if(time <= 0) {
                    location.href = href;
                    clearInterval(interval);
                };
            }, 1000);
        })();
    </script>
</body>
</html>

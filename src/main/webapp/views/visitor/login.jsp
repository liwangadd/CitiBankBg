<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1"/>
    <title>首页</title>
    <link rel="stylesheet" href="/public/stylesheets/customer-header.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/login.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
    <script type="text/javascript" src="/public/javascripts/jq.js"></script>
    <script src="/public/javascripts/unslider.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            var unslider = $('.banner').unslider({
                delay: 3000,
                fluid: true
            });
            console.log(unslider);
            $('.unslider-arrow').click(function () {
                var fn = this.className.split(' ')[1];
                unslider.data('unslider')[fn]();
            });

            $('#first-glance').css({
                width: '400px',
                height: '320px'
            });
            $('#refresh').click(function (e) {
                var now = new Date();
                var time = now.getTime();
                $.ajax({
                    type: "GET",
                    url: "/getCode",
                    dataType: "text",
                    success: function (text) {
                        $('#auth img').remove();
                        var html = '<img src=' + '"' + "/getCode/" + time + '"' + '>'
                        $('#auth').append(html);
                    },
                    error: function (xhhr) {
                        $('#check-auth').addClass('icon-error').html('网络错误，稍后重试')
                    }
                });
            });

        });
    </script>
</head>

<body>
<jsp:include page="customer-header.jsp"/>
<div id="main">
    <div id="content">
        <div id="first-glance" class="banner">
            <a href="#" class="unslider-arrow next">
                <img src="/public/images/btn-pre.png" alt=""/>
            </a>
            <a href="#" class="unslider-arrow next">
                <img src="/public/images/btn-next.png" alt=""/>
            </a>
            <ul>
                <li style="background-image:url(/public/images/banner-l1.png)">
                </li>
                <li style="background-image:url(/public/images/banner-l2.png)">
                </li>
                <li style="background-image:url(/public/images/banner-l3.png)">
                </li>
            </ul>
        </div>
        <div id="login">
            <form method="post" action="/customer/login">
                <ul>
                    <li>
                        <span class="label">账号:</span>
                        <input type="text" id="username" name="username" class="input-text">
                    </li>
                    <li>
                        <span class="label">密码:</span>
                        <input type="password" id="password" name="password" class="input-text">
                    </li>
                    <li>
                        <span id="auth-tips">验证码:&nbsp;</span>
                        <input type="text" name="auth" id="auth-in">
                        <span id="auth"><img src="/getCode" alt=""></span>
                        <span id="refresh">刷新</span>
                    </li>
                    <li>
                        <input type="checkbox" name="nologin" value="1" class="checke" id="nologin" checked/>
                        <span id="nologin-text">自动登陆</span>
                    </li>
                    <li>
                        <input type="submit" id="btn-login" value="立即登陆">
                        <span id="btn-reg"><a href="/customer/register.htm" title="">立即注册</a></span>
                    </li>
                </ul>
            </form>
        </div>
    </div>
</div>

</body>

</html>

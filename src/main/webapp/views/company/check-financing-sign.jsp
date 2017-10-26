<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="/public/stylesheets/business-header.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/nav.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/check-finacing-sign.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
    <meta charset="UTF-8">
    <title>电子签约(审核中)</title>
</head>
<body>
<jsp:include page="business-header.jsp"/>
<div class="wrap">
    <div class="nav">
        <div class="title">
            <p>电子签约</p>
        </div>
        <!--tit-->
        <div class="tri">
        </div>
        <div class="tri1">
        </div>
        <div class="list">
            <ul>
                <li class="on">
                    <a href="#">协议签约</a>
                </li>
                <li>
                    <a href="#">协议查询</a>
                </li>
                <li>
                    <a href="#">返回</a>
                </li>
            </ul>
        </div>
        <!--list-->
    </div>
    <!--nav-->
</div>
<div class="main">
    <p class="welcome">
        <span class="name">王女士</span>
        ，欢迎您
    </p>

    <p class="stage">
        当前的状态：
        <span>数字证书申请审核中</span>
    </p>

    <div class="left_line">
    </div>
    <!--left_line-->
    <span class="tit">电子签约流程</span>

    <div class="right_line">
    </div>
    <!--right_line-->
    <div class="progress">
        <img src="/public/images/DC-apply.png" class="DC_apply">
        <img src="/public/images/connection.png" class="connection c1">
        <img src="/public/images/DC-authentication.png" class="DC_authentication">
        <img src="/public/images/connection.png" class="connection c2">
        <a href="#">
            <img src="/public/images/check-contract.png" class="check_contract">
        </a>
        <img src="/public/images/connect-slide.png" class="connect_slide cs1">
        <a href="#">
            <img src="/public/images/sign-contract.png" class="sign_contract">
        </a>
        <img src="/public/images/connect-slide.png" class="connect_slide cs2">
        <img src="/public/images/number-authentication.png" class="number_authentication">
        <img src="/public/images/connection.png" class="connection c3">
        <img src="/public/images/time-authentication.png" class="time_authentication">
        <img src="/public/images/connection.png" class="connection c4">
        <a href="#">
            <img src="/public/images/sign-finished.png" class="sign_finished">
        </a>
    </div>
    <!--progress-->
</div>
<!--main-->
</div><!--wrap-->
<div id="footer">
    <div id="foot-list">
    </div>
</div>
</body>
</html>
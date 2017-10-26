<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="/public/stylesheets/font.css">
    <!-- <link rel="stylesheet" href="/public/stylesheets/new-font.css"> -->
    <link rel="stylesheet" href="/public/stylesheets/customer-header.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/reg.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
    <script type="text/javascript" src="/public/javascripts/jq.js"></script>
    <script type="text/javascript" src="/public/javascripts/d3.min.js"></script>
    <script type="text/javascript" src="/public/javascripts/citi.js"></script>
    <script type="text/javascript" src="/public/javascripts/imd.js"></script>
    <script type="text/javascript" src="/public/javascripts/reg.js"></script>
    <title>注册</title>
</head>

<body>
<jsp:include page="customer-header.jsp"/>
    <div id="main">
        <div id="content">
            <div id="sitenav">
                <ul>
                    <li>
                        <span class="sitnav-active"><img src="/public/images/1.png" alt="" />设置登录名</span>
                    </li>
                    <li>
                        <span><img src="/public/images/2.png" alt="" />填写注册信息</span>
                    </li>
                    <li>
                        <span><img src="/public/images/3.png" alt="" />注册完成</span>
                    </li>
                </ul>
            </div>
            <div id="reg">
                <form method="post" id="form" action="/customer/nextstep">
                    <ul>
                        <li>
                            <span class="label">邮箱:</span>
                            <input type="text" id="email" class="reg-input" name="username">
                            <span class="check">
            				</span>
                        </li>
                        <li>
                            <span class="label">密码:</span>
                            <input type="password" id="password" class="reg-input" name="password"/>
                            <span class="check"></span>
                        </li>
                        <li>
                            <span class="label">确认密码:</span>
                            <input type="password" id="re-password" class="reg-input" name="re-password" />
                            <span class="check"></span>
                        </li>
                        <li>
                            <span class="label">验证码:</span>
                            <input type="text" id="auth" class="reg-input" name="auth" />
                            <span id="auth-image"><img src="/getCode" alt="" /></span>
                            <span id="refresh"><img src="/public/images/refresh.png" /></span>
                            <span class="check" id="check-auth"></span>
                        </li>
                        <li>
                            <span class="label">用户类型:</span>
                            <input type="radio" checked="checked" name="userType" value="企业" class="checked" />
                            <span>企业</span>
                            <input type="radio" checked="checked" name="userType" value="投资者" class="checked" />
                            <span class="check">投资者</span>
                        </li>
                        <li>
                            <span class="label">企业名称:</span>
                            <input type="text" id="name" class="reg-input" name="companyName" />
                            <span class="check">
            				</span>
                        </li>
                        <li>
                            <span class="label">组织机构代码:</span>
                            <input type="text" id="code" class="reg-input" name="companyCode" />
                            <span class="check">
            				</span>
                        </li>
                        <li>
                            <span class="label"></span>
                            <input type="checkbox" name="iagree" value="企业" class="checke" id="agree" checked/>
                            <span>我同意<a href="/protopl">《网站服务协议》</a></span>
                        </li>
                        <li>
                            <span class="label"></span>
                            <input type="submit" id="btn" value="下一步" />
                            <span id="login">
                            	<a href="/login">&nbsp;&nbsp;登陆</a>
            				</span>
                        </li>
                    </ul>
                </form>
            </div>
        </div>
    </div>
    <div id="footer">
        <div id="foot-list">
        </div>
    </div>
</body>

</html>

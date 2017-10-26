<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="/public/stylesheets/font.css">
    <link rel="stylesheet" href="/public/stylesheets/customer-header.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/complete-reg.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
    <script type="text/javascript" src="/public/javascripts/jq.js"></script>
    <script type="text/javascript" src="/public/javascripts/d3.min.js"></script>
    <script type="text/javascript" src="/public/javascripts/citi.js"></script>
    <script type="text/javascript" src="/public/javascripts/imd.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            imd.Event('#fileInput').on('change', function (e) {
                var fileReader = new FileReader();
                var file = imd.getElement('#fileInput').files[0];
                fileReader.onload = function () {
                    var html = '<span><img src=' + '"' + fileReader.result + '"' + '></span>';
                    $('#logo-show').append(html);
                }
                fileReader.readAsDataURL(file);
            });
        });
    </script>
    <title>继续注册</title>
</head>

<body>
<jsp:include page="../visitor/customer-header.jsp"/>
<div id="main">
    <div id="content">
        <div id="sitenav">
            <ul>
                <li>
                    <span><img src="/public/images/1.png" alt=""/>设置登录名</span>
                </li>
                <li>
                    <span class="sitnav-active"><img src="/public/images/2.png" alt=""/>填写注册信息</span>
                </li>
                <li>
                    <span><img src="/public/images/3.png" alt=""/>注册完成</span>
                </li>
            </ul>
        </div>
        <div id="complete-reg">
            <form method="post" enctype="multipart/form-data" action="/investor/nextstep">
                <div id="left-reg">
                    <ul>
                        <li>
                            <span class="label">投资者名称:</span>
                            <input type="text" name="investorName" class="reg-input">
                        </li>
                        <li>
                            <span class="label">公司名称:</span>
                            <input type="text" name="companyName" class="reg-input">
                        </li>
                        <li>
                            <span class="label">法定代表人:</span>
                            <input type="text" name="legalRepresentative" class="reg-input">
                        </li>
                        <li>
                            <span class="label">法定代表委托人:</span>
                            <input type="text" name="legalRepresentativeMandator" class="reg-input">
                        </li>
                        <%-- <li>
                             <span class="label">营业执照注册号:</span>
                             <input type="text" name="" class="reg-input">
                         </li>--%>
                        <li>
                            <span class="label">注册资本:</span>
                            <input type="text" name="registeredCapital" class="reg-input">
                        </li>
                        <%--  <li>
                              <span class="label">注册地址:</span>
                              <input type="text" name="" class="reg-input">
                          </li>
                          <li>
                              <span class="label">所在地区:</span>
                              <input type="text" name="" class="reg-input">
                          </li>--%>
                        <li>
                            <span class="label">投资地区:</span>
                            <input type="text" name="investArea" class="reg-input">
                        </li>
                        <li>
                            <span class="label">投资领域:</span>
                            <input type="text" name="investField" class="reg-input">
                        </li>
                        <li>
                            <span class="label">投资阶段:</span>
                            <input type="text" name="investStage" class="reg-input">
                        </li>
                        <li>
                            <span class="label">投资周期:</span>
                            <input type="text" name="investPeriod" class="reg-input">
                        </li>
                        <li>
                            <span class="label">总部地址:</span>
                            <input type="text" name="baseAddress" class="reg-input">
                        </li>
                        <li>
                            <span class="label">咨询电话:</span>
                            <input type="text" name="firstNum" id="first">
                            <span>-</span>
                            <input type="text" name="secondNum" id="second">
                        </li>
                        <li>
                            <span class="label"></span>
                            <input type="submit" id="btn" value="下一步"/>
                        </li>
                    </ul>
                </div>
                <div id="right-reg">
                    <div id="title">
                        <p>企业/个人表示(LOGO)</p>
                    </div>
                    <div id="logo-show">
                    </div>
                    <div id="file">
                        <span id="text">上传图片</span>
                        <input type="file" id="fileInput" name="logoPath">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>

</html>

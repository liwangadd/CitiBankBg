<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% Map<String, Object> userInfo = (Map<String, Object>) request.getAttribute("userInfo");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>个人中心-资产管理</title>
    <link href="/public/stylesheets/personalcenter_assetsmanagement.css" type="text/css" rel="stylesheet">
    <link href="/public/stylesheets/business-header.css" rel="stylesheet" type="text/css">
    <link href="/public/stylesheets/customer-footer.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="invest-header.jsp"></jsp:include>
<div class="main">

    <div class="container">
        <div id="title">
                <h1>资料管理</h1>
            </div>
     
        <div id="first">
            <div style="margin: 8px">基本信息</div>
            <hr/>
            <div class="box">
                <div id="first_left">
                        <div class="block">
                        	
                            <p>投资者姓名：<%= userInfo.get("investorName") %> ></p><br/>
                            <p>联系方式：<%= userInfo.get("consultPhone") %></p><br/>
                            <p>职位：<%= userInfo.get("c_position") %></p><br/>
                            <p>资金额： <%= userInfo.get("totalMoney") %></p><br/>
                            <p>所在地区：<%= userInfo.get("companyArea") %></p><br/>
                        </div>
                        <div class="block">
                            <p>投资领域：<%= userInfo.get("investField") %></p><br/>
                            <p>投资阶段：<%= userInfo.get("investStage")%></p><br/>
                            <p>投资周期：<%= userInfo.get("investPeriod") %></p><br/>
                            <p>投资规模：<%= userInfo.get("companyScale") %></p><br/>
                            <p>投资地区：<%= userInfo.get("investArea") %></p><br/>
                        </div>

                    </div>
                <div id="first_right">
                        <div class="block">
                            <img src="/public/images/myphoto.png">
                            <p id="button1"><a href="">更换</a></p>
                        </div>
                        <div class="block">
                            <p>所在公司名称：<%= userInfo.get("companyName") %></p><br/>
                            <p>公司注册地址：<%= userInfo.get("address") %></p><br/>
                            <p>公司注册资本：<%= userInfo.get("registeredCapital") %></p><br/>
                            <p>法定代表人信息：<%= userInfo.get("legalRepresentative") %></p><br/>
                            <p>法定代表人委托信息：<%= userInfo.get("legalRepresentativeMandator") %></p><br/>
                        </div>
                    </div>
            </div>
        </div>
        <div id="second">
            <div style="margin: 8px">基本信息</div>
            <hr/>
            <div class="box">
                <div id="second_top">
                    <div id="top_left">
                        <p>股东背景：<%= userInfo.get("shareholderBackground")%></p><br/>
                        <p>投资行业：<%= userInfo.get("investIndustry")%></p><br/>
                        <p>投资类型：<%= userInfo.get("investType")%></p><br/>
                        <p>达成案例：无</p><br/>
                    </div>
                    <div id="top_right">
                        <p>管理基金：<%= userInfo.get("managedFund")%></p><br/>
                        <p>投资意向金额：<%= userInfo.get("investMoney") %></p><br/>
                        <p>所需资料：无</p><br/>
                    </div>
                </div>
                <div id="second_middle">投资历史：<br/>
                    <%= userInfo.get("investHistory") %>
                </div>
                <div id="second_bottom">
                    <p>瑞贝卡（600439.sh）、兴森科技（002436.sz)</p><br/>
                    <p>天壕节能科技股份有限公司（300332.sz）</p><br/>
                    <p>郴州金贵银业股份有限公司（已过发审会）</p><br/>
                    <p>金轮科创股份有限公司（已过发审会）</p><br/>
                    <p id="button2"><a href="/investor/isource">编辑</a></p>
                </div>
            </div>
        </div>
    </div>

</div>
<div id="footer">
    <div id="foot-list">
    </div>
</div>
</body>
</html>

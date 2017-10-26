<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1"/>
    <title>个人中心-我的消息</title>
    <link rel="stylesheet" type="text/css" href="../public/stylesheets/business-header.css">
    <link rel="stylesheet" type="text/css" href="../public/stylesheets/customer-footer.css">
    <link rel="stylesheet" type="text/css" href="../public/stylesheets/personal_center_my_message_privately.css">

</head>
<body>
<jsp:include page="business-header.jsp"/>
<div id="mainContainer">
    <div id="main">
        <jsp:include page="list_direct.jsp"/>
        <div id="mainContent">
            <div id="searchForm">
                <div id="searchInput">
                    <input id="searchText" type="text" placeholder="请输入关键字">
                </div>
                <a href="" style="display:inline;">
                    <div id="searchButton">确定</div>
                </a>

            </div>
            <div id="mainContent_list">
                <ul class="table_item">
                    2015-01-01&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;广州财富股份公司&nbsp;&nbsp;&nbsp;&nbsp;
                    你好，我是……
                </ul>

                <ul class="table_item">
                    2015-01-01&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;深圳平安股份公司&nbsp;&nbsp;&nbsp;&nbsp;
                    你好，我是……
                </ul>
            </div>
            <div id="page">
                <div>

                </div>
            </div>
        </div>
    </div>
</div>
<div id="footer">
</div>
</body>

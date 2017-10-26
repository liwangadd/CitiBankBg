<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/business-header.css">
    <link href="/public/stylesheets/reset.css" type="text/css" rel="stylesheet"/>
    <link href="/public/stylesheets/task4-nav.css" type="text/css" rel="stylesheet"/>
    <link href="/public/stylesheets/information_issue.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="/public/javascripts/jq.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>中心公告</title>
    <script type="text/javascript">
        var flag1 = ${flag1};
        $(document).ready(function () {
            $('#addclass li').eq(${flag1}).addClass('on');
            $('#search-btn').click(function (e) {
                var search = $('#search').val();
                window.location.href = '/report/getReport/' + flag1 + '/' + search;
            });
        });
    </script>

</head>
<body>
<% List<Map<String, Object>> reports = (List<Map<String, Object>>) request.getAttribute("data");%>
<jsp:include page="invest-header.jsp"/>
<div class="swap">
    <div class="nav fl">
        <div class="tit ">
            <p>信息披露</p>
        </div>
        <!--tit-->

        <div class="tri">
        </div>
        <div class="tri1">
        </div>
        <jsp:include page="information-left-nav.jsp"/>
        <!--list-->
    </div>
    <!--nav-->
    <div class="main fl">
        <div class="main_head">
            <p>中心公告</p>

            <div class="search">
                <input type="text" class="input" placeholder="请输入关键字搜索" id="search">
                <button class="search_button" id="search-btn">&nbsp;&nbsp;&nbsp;搜&nbsp;索</button>
            </div>
            <!--search-->
        </div>
        <!--main_head-->
        <div class="main_content">
            <ul>
                <% for (int i = 0; i < reports.size(); ++i) {%>
                <li>
                    <%--<img src="/public/images/select.png"/>--%>
                    <a href="<%= "/uploads/"+reports.get(i).get("path")%>"><%= reports.get(i).get("fileName")%>
                    </a>
                </li>
                <%}%>
            </ul>
        </div>
        <!--main_content-->
    </div>
    <!--main-->
</div>
<!--swapper-->
<div id="footer">
</div>

</body>
</html>

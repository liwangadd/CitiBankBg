<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1"/>
    <title>资讯</title>
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-header.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-information-policy.css">
</head>
<body>
<% int type = (int) request.getAttribute("flag");%>
<jsp:include page="customer-header.jsp"/>
<% List<Map<String, Object>> information = (List<Map<String, Object>>) request.getAttribute("information");%>
<div id="main">
    <div id="content">
        <div id="nav">
            <p><span><% if (type == 7) out.print("政策咨询");
            else out.print("市场资讯");%></span></p>

            <div id="back">
                <span><a href="/customer/index" title="">返回上一页</a></span>
            </div>
        </div>
        <div id="policynews">
            <ul>
                <% for (int i = 0; i < information.size(); ++i) {%>
                <li><a href="/uploads/<%= information.get(i).get("path")%>"
                       title="<%= information.get(i).get("fileName")%>"><%= information.get(i).get("fileName")%>
                </a>
                    <span>2015-7-11</span>
                </li>
                <%}%>
            </ul>
        </div>
    </div>
</div>
<div id="footer">
</div>
</body>
</html>
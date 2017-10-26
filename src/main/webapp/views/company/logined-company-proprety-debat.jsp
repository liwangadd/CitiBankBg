<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/business-header.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/logined-company-proprety-debat.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/radioButton.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>产品详情-公司详情</title>
</head>
<body>
<jsp:include page="business-header.jsp"/>
<div id="main">
    <div id="content">
        <div id="nav-head">
            <div id="nav">
                <form action="/asset/search/1" method="get">
                    <a href="/asset/company/0"><span id="debat-manag">股权管理</span></a>
                    <span id="search">搜索：</span>
                    <input name="content" type="text" id="search-text">
                    <input type="submit" value="搜索" id="search-btn">
                </form>
            </div>
            <div id="nav1">
                <a href="/asset/company/1"><span id="stock-manag">债权管理</span></a>
            </div>
        </div>
        <div id="sift">
            <span>筛选条件</span>
            <span>发布时间：</span>

            <div id="announce-time">
                <form action="/asset/getChooseDebtList",method="get">
                    <input type="radio" id="1" value="1" name="time" check="checked"/>
                    <label for="1">近一个月</label>
                    <input type="radio" id="2" value="2" name="time"/>
                    <label for="2">近三个月</label>
                    <input type="radio" id="3" value="3" name="time"/>
                    <label for="3">近六个月</label>
                    <input type="radio" id="4" value="4" name="time"/>
                    <label for="4">近一年</label>
                    <input type="radio" id="5" value="5" name="time"/>
                    <label for="5">近两年</label>
                    <input type="submit" value="确认筛选">
                </form>

            </div>
        </div>
        <div id="announce-message">
            <span>发布信息</span>
        </div>

        <% List<Map<String,Object>> asset1 = (List<Map<String,Object>>)request.getAttribute("data"); %>
        <% for (int i = 0; i < asset1.size(); i++) {%>
        <a href="/company/productDebt" title="">
        <div class="product">
            <span>产品名称：<%=asset1.get(i).get("name")%></span>
            <div class="prod1">
                <ul>
                    <li>发布时长：<%=asset1.get(i).get("publishedTime")%>个月</li>
                    <li>目前股权状况：<%=asset1.get(i).get("condition")%></li>
                    <li>融资方式：股权投资</li>
                </ul>
            </div>
            <div class="prod2">
                <ul>
                    <li>期限：<%=asset1.get(i).get("limit")%></li>
                    <li>融资占比：<%=asset1.get(i).get("radio")%></li>
                    <li>意向投资方：相互关注的</li>
                </ul>
            </div>
        </div>
        </a>
        <%}%>

        <div id="nav-footer">

        </div>
    </div>
</div>
<div id="footer">
</div>
</body>
</html>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html>
<head>
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/business-header.css">
    <link href="/public/stylesheets/reset.css" type="text/css" rel="stylesheet"/>
    <link href="/public/stylesheets/task4-nav.css" type="text/css" rel="stylesheet"/>
    <link href="/public/stylesheets/information_issue.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="/public/javascripts/jq.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#search-btn').click(function (e) {
                var search = $('#search').val();
                if(search!="") {
                    window.location.href = '/selfBounds/getSelfBounds.htm?queryContent=' + search;
                }
            });
        });
    </script>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1"/>
    <title>私募债列表</title>
</head>
<body>
<% List<Map<String, Object>> bounds = (List<Map<String, Object>>) request.getAttribute("data");%>
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
    <div class="main fl">
        <div class="main_head">
            <p>私募债券列表</p>

            <div class="search">
                <input type="text" class="input" placeholder="请输入关键字搜索" id="search">
                <button class="search_button" id="search-btn">&nbsp;&nbsp;&nbsp;搜&nbsp;索</button>
            </div>
            <!--search-->
        </div>

        <div id="subjectListContainer">
            <table id="subjectListContent">
                <tbody>
                <tr>
                    <th class="rightListHead">债券代码</th>
                    <th class="rightListHead">债券名称</th>
                    <th class="rightListHead">所属行业</th>
                    <th class="rightListHead">转让日期</th>
                    <th class="rightListHead">承销商</th>
                    <th class="rightListHead">受托人</th>
                </tr>
                <% for (int i = 0; i < bounds.size(); ++i) {%>
                <tr>
                    <td class="listItem"><%= bounds.get(i).get("code")%>
                    </td>
                    <td class="listItem"><%= bounds.get(i).get("productName")%>
                    </td>
                    <td class="listItem"><%= bounds.get(i).get("industry")%>
                    </td>
                    <td class="listItem"><%= bounds.get(i).get("signTime")%>
                    </td>
                    <td class="listItem">a</td>
                    <td class="listItem">a</td>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>
        <div id="page">
        </div>
    </div>
</div>
<div id="footer">
</div>
</body>
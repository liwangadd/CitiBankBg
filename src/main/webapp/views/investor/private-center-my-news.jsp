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
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/business-header.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/private-center-my-news.css">
    <script type="text/javascript" src="/public/javascripts/jq.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#searchButton').click(function (e) {
                var search = $('#search').val();
                if (search != "") {
                    window.location.href = '/investor/inews.htm?queryContent=' + search;
                }
            });
        });
    </script>
</head>
<body>
<%List<Map<String, Object>> system_message = (List<Map<String, Object>>) request.getAttribute("system_message");%>
<jsp:include page="invest-header.jsp"/>
<div id="mainContainer">
    <div id="main">
        <div id="sidebarContainer">
            <div id="listTitle">
                <ul id="sidebarTitle">
                    <li class="sidebarItem">我的消息</li>
                </ul>
            </div>
            <div id="listContent">
                <jsp:include page="realse_left_nav.jsp"></jsp:include>
            </div>
        </div>
        <div id="mainContent">
            <div id="searchForm">
                <p>查询：</p>

                <div id="searchInput">
                    <input id="search" type="text" placeholder="请输入关键字搜索">
                </div>
                    <input id="searchButton" type="button" value="确定"/>

            </div>
            <div id="TableList">
                <table class="hovertable">

                    <tr>
                        <th>&nbsp;日期&nbsp;&nbsp;&nbsp;</th>
                        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;内容&nbsp;&nbsp;&nbsp;</th>
                        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;更多操作</th>
                    </tr>


                    <% for (int i = 0; i < system_message.size(); i++) { %>
                    <tr onMouseOver="this.style.backgroundColor='#ffff66';"
                        onMouseOut="this.style.backgroundColor='#d4e3e5';">
                        <td>&nbsp;&nbsp;&nbsp;<%= system_message.get(i).get("time")%>&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<%= system_message.get(i).get("content")%>&nbsp;&nbsp;&nbsp;</td>
                        <td><a class="com_detail" href="/company/<%= system_message.get(i).get("companyId")%>>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;企业详情</a>
                        </td>
                    </tr>
                    <% }%>

                </table>
                <hr class="hr1"/>
            </div>
            <div id="page">
            </div>
        </div>
    </div>
</div>
<div id="footer">
</div>
</body>
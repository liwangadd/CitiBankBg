<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>资产管理-详情显示</title>
    <link href="/public/stylesheets/business-header.css" rel="stylesheet" type="text/css">
    <link href="/public/stylesheets/customer-footer.css" rel="stylesheet" type="text/css">
    <link href="/public/stylesheets/product_details.css" rel="stylesheet" type="text/css">
</head>
<body>
<% Map<String, Object> map = (Map<String, Object>) request.getAttribute("data");
    List<Map<String, Object>> regular = (List<Map<String, Object>>) request.getAttribute("regularReport");
    List<Map<String, Object>> temp = (List<Map<String, Object>>) request.getAttribute("tempReport");%>
<%@include file="business-header.jsp" %>
<div id="container">
    <div id="head">
        <div id="title">
            <p>当前投资公司：深圳诚勒达电力建设工程公司</p>
        </div>
    </div>
    <div id="main">
        <div id="left">
            <div id="column1">
                <div class="subtitle"><p>发展数据</p></div>
                <div class="text" style="width: 40%;display: inline-block">
                    <p>
                        利润额：<%=map.get("profit")%><br/>
                        销售毛利率：<%=map.get("saleProfit")%><br/>
                        资产负债率：<%=map.get("assetDebt")%><br/>
                        流动比率：<%=map.get("flowRate")%><br/>
                    </p>
                </div>
                <div class="text" style="width: 40%;display: inline-block">
                    <p>
                        应收账款周转天数：<%=map.get("accountDay")%><br/>
                        应收账款周转率：<%=map.get("accountTurn")%><br/>
                        净值报酬率：<%=map.get("rewardRate")%><br/>
                        总资产周转率：<%=map.get("assetTurn")%><br/>
                    </p>
                </div>
            </div>
            <div id="column2">
                <div class="subtitle"><p>定期报告</p></div>
                <div class="text">
                    <p>
                        <% for (Map<String, Object> item : temp) {%>
                        <a href="<%= "/uploads/"+item.get("path")%>"><%= item.get("fileName")%>
                        </a><br/>
                        <%}%>
                    </p>
                </div>
            </div>
            <div class="column">
                <div class="subtitle"><p>临时发布</p></div>
                <div class="text">
                    <p>
                        <% for (Map<String, Object> item : regular) {%>
                        <a href="<%= "/uploads/"+item.get("path")%>"><%= item.get("fileName")%>
                        </a><br/>
                        <%}%>
                    </p>
                </div>
            </div>
            <div class="column">
                <div class="subtitle"><p>相关新闻</p></div>
                <div class="text">
                    <p>
                        <a href="">新闻新闻，跳官网</a><br/>
                        <a href="">新闻新闻，跳官网</a><br/>
                        <a href="">新闻新闻，跳官网</a><br/>
                        <a href="">新闻新闻，跳官网</a><br/>
                    </p>
                </div>
            </div>
        </div>
        <div id="right" style="background-color: white">
            <div class="box">
                <img src="/public/images/example.jpg">
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>产品详情</title>
    <link href="/public/stylesheets/business-header.css" rel="stylesheet" type="text/css">
    <link href="/public/styles
    heets/customer-footer.css" rel="stylesheet" type="text/css">
    <link href="/public/stylesheets/my-attention-product-detail.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="invest-header.jsp"></jsp:include>
<div id="container">
    <% List<Map<String,Object>> data= (List<Map<String, Object>>) request.getAttribute("data");%>

    <div id="head">
        <div id="button">
            <p><a href="">返回上一层
                <img src="../public/images/back.png" style="vertical-align: middle"></a></p>
        </div>
        <div id="title">
            <p><%=data.get(0).get("productName")%></p>
        </div>
    </div>
    <div id="main">
        <div id="left">
            <div id="column1">
                <div class="subtitle"><p>发行方基本信息</p></div>
                <div class="text">
                    <p>
                        所属行业：<%=data.get(0).get("investIndustry")%><br/>
                        注册地：<%=data.get(0).get("investArea")%><br/>
                        注册时间：2002年8月<br/>
                        注册资本：5000万元<br/>
                        担保公司/个人：<span style="color: red">广发证券有限公司</span><br/>
                        去年营业额：1000万元<br/>
                        净资产：1000万元<br/>
                        净利润：100万元<br/>
                    </p>
                </div>
            </div>
            <div id="column2">
                <div class="subtitle"><p>产品详细信息</p></div>
                <div class="text">
                    <p>
                        发行人：深圳市诚勒达电力建设工程有限公司<br/>
                        发行金额：4000万元<br/>
                        发行期限：2年<br/>
                        发行完成日期：本私募债券第一个兑付日为2014年12月4日，第二个兑付日为2015年12月4日<br/>
                        产品类型：单一债<br/>
                        还本付息方式：本期私募债分期偿还本金，其中：在第12个月末偿还本金1000万元，
                        在第24个月末偿还本金3000万元。采用单利按月计息，不计复利。<br/>
                        可承担最高利息：13%年<br/>
                        年资金占用时长：3-5个月<br/>
                        可提供风控：抵押、信用<br/>
                        抵押物类型：其他资产<br/>
                        还款来源：销售回款<br/>
                    </p>
                </div>
            </div>
        </div>
        <div id="right">
            <div class="sidebartitle">
                <P>相似的产品</P>
            </div>
            <div class="box">
                广东某互联网科技项目股权融资300万<br/>
                融资金融：300万<br/>
                <span>债券融资</span>
                <span class="border">IT互联网</span>
                <span>广东省</span>
            </div>
            <div class="box">
                广东某互联网科技项目股权融资300万<br/>
                融资金融：300万<br/>
                <span>债券融资</span>
                <span class="border">IT互联网</span>
                <span>广东省</span>
            </div>
            <div class="box">
                广东某互联网科技项目股权融资300万<br/>
                融资金融：300万<br/>
                <span>债券融资</span>
                <span class="border">IT互联网</span>
                <span>广东省</span>
            </div>
            <div class="box">
                广东某互联网科技项目股权融资300万<br/>
                融资金融：300万<br/>
                <span>债券融资</span>
                <span class="border">IT互联网</span>
                <span>广东省</span>
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
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>详情显示</title>
    <link href="../public/stylesheets/business-header.css" rel="stylesheet" type="text/css">
    <link href="../public/stylesheets/customer-footer.css" rel="stylesheet" type="text/css">
    <link href="../public/stylesheets/product_details.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="header">
    <jsp:include page="invest-header.jsp"></jsp:include>
</div>
<div id="container">
    <div id="head">
        <div id="button">
            <p><a href="/asset/investor/0">返回上一层
                <img src="../public/images/back.png" style="vertical-align: middle"></a></p>
        </div>
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
                        利润额：1000万元<br/>
                        销售毛利率：80%<br/>
                        资产负债率：20%<br/>
                        流动比率：50%<br/>
                    </p>
                </div>
                <div class="text" style="width: 40%;display: inline-block">
                    <p>
                        应收账款周转天数：28天<br/>
                        应收账款周转率：30%<br/>
                        净值报酬率：50%<br/>
                        总资产周转率：16%<br/>
                    </p>
                </div>
            </div>
            <div id="column2">
                <div class="subtitle"><p>定期报告</p></div>
                <div class="text">
                    <p>
                        <a href="">滨河建筑安装工程股份有限公司2015年度中期报告</a><br/>
                        <a href="">河北同聚祥商贸股份有限公司2015年度中期报告</a><br/>
                        <a href="">宁夏白浪包装股份有限公司2015年度中期报告</a><br/>
                        <a href="">邢台美的客食品股份有限公司2015年度中期报告</a><br/>
                    </p>
                </div>
            </div>
            <div class="column">
                <div class="subtitle"><p>临时发布</p></div>
                <div class="text">
                    <p>
                        <a href="">无锡乐天市政工程股份有限公司关于延期披露2015年中期报告的说明</a><br/>
                        <a href="">榆缆线缆集团股份有限公司关于董事变更的公告</a><br/>
                        <a href="">中渔（福建）通信股份有限公司关于再次延期召开2015年第一次临时股东大会的公告</a><br/>
                        <a href="">天津华泰森淼生物工程技术股份有限公司关于延期披露2015年中期报告的公告</a><br/>
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
                <img src="../public/images/example.jpg">
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
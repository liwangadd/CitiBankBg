<%@ page import="java.util.Map" %>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<head>
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/business-header.css">
    <link href="/public/stylesheets/task4-nav.css" type="text/css" rel="stylesheet"/>
    <link href="/public/stylesheets/information_issue.css" type="text/css" rel="stylesheet"/>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1"/>
    <title>信息发布-我要发布</title>
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/message-publish-my-pubish.css">
    <script type="text/javascript" src="/public/javascripts/jq.js"></script>
    <script type="text/javascript" src="/public/javascripts/publish.js"></script>
</head>
<body>
<% Map<String, Object> companyInfo = (Map<String, Object>) request.getAttribute("companyInfo");%>
<jsp:include page="business-header.jsp"/>
<div id="mainContainer">
    <div id="main">
        <div id="sidebarContainer">
            <div id="listTitle">
                <ul id="sidebarTitle">
                    <li class="sidebarItem">信息发布</li>
                </ul>
            </div>
            <jsp:include page="information-left-nav.jsp"/>
        </div>
        <div id="mainContent">
            <p class="title">对公数据披露</p>

            <div id="subjectListContainer">
                <div id="headPhotoBox"></div>
                <table id="subjectListContent">
                    <tbody>
                    <tr>
                        <td>公司名称：某某股份有限公司</td>
                        <td>成立时间：2006/10/09</td>
                    </tr>
                    <tr>
                        <td class="listItem">所在地区：广东省 深圳市 宝安区</td>
                        <td class="listItem">注册资本：5000万&nbsp;人民币</td>
                    </tr>
                    <tr>
                        <td class="listItem">所属行业：机械制造业</td>
                        <td class="listItem">咨询电话：0755-86802655</td>
                    </tr>
                    <tr>
                        <td class="listItem">所属专利：专利一、专利二</td>
                        <td class="listItem">驻外办事处机构：无</td>
                    </tr>
                    <tr>
                        <td class="listItem">分厂：分厂一、分厂二</td>
                        <td class="listItem">员工人数：100人</td>
                    </tr>
                    <tr>
                        <td class="listItem">子公司：子公司一</td>
                        <td class="listItem">占地面积：100亩</td>
                    </tr>
                    <tr>
                        <td class="listItem">技术优势：优势优势</td>
                        <td class="listItem">人才优势：优势优势</td>
                    </tr>
                    <tr>
                        <td class="listItem">产品优势：优势优势</td>
                        <td class="listItem">品牌优势：优势优势</td>
                    </tr>
                    <tr>
                        <td class="listItem">市场优势：优势优势</td>
                        <td class="listItem">管理优势：优势优势</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <p class="title">产品服务：</p>

            <p>
                公司产品公司产品公司产品公司产品公司产品公司产品公司产品公司产品公司产品公司产品
                公司产品公司产品公司产品公司产品公司产品公司产品公司产品公司产品公司产品公司产品
                公司产品公司产品公司产品公司产品公司产品公司产品公司产品公司产品公司产品公司产品
            </p>

            <p class="title">公司简介</p>

            <p>公司简介公司简介</p>

            <p class="title">公司相册</p>

            <div id="albumContainer"></div>
            <a href="javascript:void(0);" onclick="publishWidget.startWidget('albumContainer')">
                <div id="publishButton">发布更多消息</div>
            </a>

            <div id="page">
            </div>
        </div>
    </div>
</div>
<div id="footer">
</div>
</body>
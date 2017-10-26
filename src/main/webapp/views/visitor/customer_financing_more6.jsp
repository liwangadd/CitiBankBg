<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>游客模式-融资企业-详情查看</title>
    <link href="/public/stylesheets/customer_financing_more.css" rel="stylesheet" type="text/css">
    <link href="/public/stylesheets/customer-header.css" rel="stylesheet" type="text/css">
    <link href="/public/stylesheets/customer-footer.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/public/javascripts/jq.js"></script>
    <script type="text/javascript" src="/public/javascripts/islider.js"></script>
    <script type="text/javascript">
    window.onload = function() {
        $('.banner').unslider({
            fluid: true,
            dots: true
        });
        var arr = ['url(/public/images/s6_1.png)',
            'url(/public/images/s6_2.png)',
            'url(/public/images/s6_3.png)'
        ];
        var i = 0;
        $('.dot').each(function() {
            this.style.backgroundImage = arr[i++];
        });
    }
    </script>
</head>
<body>
    <jsp:include page="customer-header.jsp"/>
    <div id="main">
        <div class="container">
            <div class="top">
                <img class="head" src="/public/images/logo_0006.jpg">
                <a href="http://www.amore.net.cn/"><p style="font-size: 2em">嘉碧斯化妆品企业</p><br/></a>
                <div class="about">
                    <p>是一家集研发、生产、销售、培训、服务等为一体的综合性美容化妆品企业</p>
                </div>
                <div class="top-right">
                    <div class="return">
                        <a id="return" href="javascript:void(0)" onClick="javascript:history.back(-1);">返回上一层<img style="vertical-align: middle" src="/public/images/back.png"></a>
                    </div>
                    <div class="button" id="send">
                        <a href="">发送意见</a>
                    </div>
                    <div class="button" id="attention">
                        <a href="">关注企业</a>
                    </div>
                </div>
            </div><hr class="clear"/>
            <div class="center">
                <h2 style="font-size: 1.2em">公司信息</h2><br>
                <div class="center-left">
                    <div class="center-title-line">
                        <span class="title">基本信息：</span>
                        <span class="short-line"></span>
                    </div>
                    <div class="center-content">
                        成立时间：2006<br/>
                        注册资本：2亿人民币<br/>
                        咨询电话：400-000-8508<br/>
                        企业类型：有限责任公司<br/>
                        注册地址：广州高新技术产业开发区<br/><br/>
                    </div>
                    <div class="center-title-line">
                        <span class="title">公司规模：</span>
                        <span class="short-line"></span>
                    </div>
                    <div class="center-content">
                        分厂：3个<br/>
                        子公司：无<br/>
                        驻外办事处机构：无<br/>
                        员工人数：50人<br/>
                        占地面积：7.2万平方米<br/><br/>
                    </div>
                </div>
                <div class="center-right">
                    <p style="font-size: 1.1em">公司图片：</p>
                    <br/>
                    <div class="imgBox" id="slider">
                        <div class="banner">
                            <ul id="banner-image">
                                <li style="background-image: url(/public/images/rotate6_1.png)"></li>
                                <li style="background-image: url(/public/images/rotate6_2.png)"></li>
                                <li style="background-image: url(/public/images/rotate6_3.png)"></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bottom">
                <div class="bottom-title-line">
                    <span class="title">行业发展：</span>
                    <span class="long-line"></span>
                </div>
                <div class="center-content">
                    所属行业：化工<br/>
                    细分行业：化妆品<br/>
                    <p class="content">
                    </p><br/>
                </div>
                <div class="bottom-title-line">
                    <span class="title">产品服务：</span>
                    <span class="long-line"></span>
                </div>
                <div class="center-content">
                    <p class="content">倡导的“丰富女性人生”的企业使命，以及平衡、乐观、积极、乐善好施的价值观念，也引发了广大女性的强烈共鸣。主要产品有气垫BB霜 休眠霜 唇膏 睫毛膏 冰肌水
                    </p><br/>
                </div>
                <div class="bottom-title-line">
                    <span class="title">优势专长：</span>
                    <span class="long-line"></span>
                </div>
                <div class="center-content">
                    技术优势：先进的技术<br/>
                    产品优势：产品符合大众口味<br/>
                    市场优势：市场火热 <br/>
                    人才优势：兢兢业业的优秀员工<br/>
                    管理优势：卓有成效的管理团队<br/>
                    品牌优势：有系统的资深品牌<br/><br/>
                </div>
                <div class="bottom-title-line">
                    <span class="title">公司介绍：</span>
                    <span class="long-line"></span>
                </div>
                <div class="center-content">
                    <p class="content">
                        始终秉承“做冠军产品、创世界名牌”的战略目标，以科技为导向，以品质为核心，不断研发天然、安全、有效的美容类产品。公司建立了完善的组织架构和管理制度，引进大型ERP软件管理平台及条码管理系统，建立起了系统化、程序化、制度化的高效管理系统。
                    </p>
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
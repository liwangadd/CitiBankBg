<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>游客模式-融资企业-详情查看</title>

    <link href="/public/stylesheets/customer_financing_more.css" rel="stylesheet" type="text/css">
    <link href="/public/stylesheets/customer-header.css" rel="stylesheet" type="text/css">
    <link href="/public/stylesheets/customer-footer.css" rel="stylesheet" type="text/css">
    <script src="/public/javascripts/jq.js"></script>
    <script>
    $(document).ready(function() {
        $('.nav-item').eq(${flag}).addClass('active');
    })
    </script>
</head>
<body>
    <jsp:include page="customer-header.jsp"/>
    <div id="main">
        <div class="container">
            <div class="top">
                <img class="head" src="/public/images/example.jpg">
                <p style="font-size: 2em">广州市铱泰电子科技有限公司</p><br/>
                <div class="about">
                    <p>广州市铱泰电子科技有限公司是集研究开发、制造销售、应用服务为一体的高新技术企业</p>
                </div>
                <span>地区——&nbsp&nbsp行业——</span>
                <div class="top-right">
                    <div class="return">
                        <a id="return0" href="">访问官网</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a id="return" href="">返回上一层<img style="vertical-align: middle" src="/public/images/back.png"></a>
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
                        成立时间：2006.09.28<br/>
                        注册资本：120万人民币<br/>
                        咨询电话：020-62199552<br/>
                        企业类型：有限责任公司<br/>
                        注册地址：广州市白云山山麓<br/>
                        所有专利：钳形接地电阻 非接触性相序表 漏电流表 接地电阻在线检测<br/><br/>
                    </div>
                    <div class="center-title-line">
                        <span class="title">公司规模：</span>
                        <span class="short-line"></span>
                    </div>
                    <div class="center-content">
                        分厂：北京分公司<br/>
                        子公司：无<br/>
                        驻外办事处机构：无<br/>
                        员工人数：60人<br/>
                        占地面积：3000平米<br/><br/>
                    </div>
                </div>
                <div class="center-right">
                    <p style="font-size: 1.1em">公司图片：</p><br/>
                    <div class="imgBox">
                        <ul class="imgList">
                            <li><img src="/public/images/1.PNG"></li>
                            <li><img src="/public/images/2.PNG"></li>
                        </ul>
                        <div class="s-left">
                            <img src="/public/images/s-left-inactive.png">
                        </div>
                        <div class="s-right">
                            <img src="/public/images/s-right-active.png">
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
                    所属行业：电子行业<br/>
                    细分行业：高端智能化数字测试仪器<br/>
                    <p class="content">
                    </p><br/>
                </div>
                <div class="bottom-title-line">
                    <span class="title">产品服务：</span>
                    <span class="long-line"></span>
                </div>
                <div class="center-content">
                    <p class="content">公司致力于向广大客户提供高端智能化数字测试仪器，
                        以及接地电阻、泄漏电流、相序、功率等非接触式远程在线监测解决方案。
                        其产品广泛应用于电力、通信、军事、石油、化工、气象、铁路及工矿企业等领域。
                        公司拥有高水平的技术研发团队，在产品研发与制造上积极遵照国际电工委员会IEC1010标准，
                        专注于研制安全、耐用、精确的高端数字检测产品，并不断对现有产品升级换代。
                        公司还拥有卓有成效的管理团队、兢兢业业的优秀员工，确保我们的产品技术领先、品质优良。
                    </p><br/>
                </div>
                <div class="bottom-title-line">
                    <span class="title">优势专长：</span>
                    <span class="long-line"></span>
                </div>
                <div class="center-content">
                    技术优势：高新技术<br/>
                    产品优势：产品广泛应用<br/>
                    市场优势：市场需求量大<br/>
                    人才优势：兢兢业业的优秀员工<br/>
                    品牌优势：卓有成效的管理团队<br/>
                    管理优势：国内知名品牌<br/><br/>
                </div>
                <div class="bottom-title-line">
                    <span class="title">公司介绍：</span>
                    <span class="long-line"></span>
                </div>
                <div class="center-content">
                    <p class="content">
                        广州市铱泰电子科技有限公司是集研究开发、制造销售、应用服务为一体的高新技术企业，
                        是国家计量检定规程：JJG105410－2009【钳形接地电阻仪】的参与制定单位。
                        公司参与了国家标准的制定，拥有钳形接地电阻测试仪等十多项国家专利，产品畅销国内外近十年，
                        赢得了广大客户的信赖与赞赏。 我们的质量方针：以客户需求为宗旨，以科技创新为动力，以严格管理为保证，
                        以国际水平为目标，为广大客户提供满意的产品和服务。 我们的价值观：团结和睦、志同道合、诚实守信、
                        尊崇创新、严谨守纪、追求卓越。  我们的企业目标：将铱泰科技打造成一个具有自主知识产权，拥有核心技术，
                        在规模和技术上领先于国内外同行的高端智能数字测试仪器供应商。 客户的认同，是对我们最好的鼓励。
                        我们坚信，通过我们的不懈努力，一定会有更多的用户使用我们的产品，有更多的合作伙伴与我们携手同进，
                        共创美好明天！
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
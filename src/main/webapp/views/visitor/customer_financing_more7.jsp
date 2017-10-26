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
        var arr = ['url(/public/images/s7_1.png)',
            'url(/public/images/s7_2.png)',
            'url(/public/images/s7_3.png)'
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
                <img class="head" src="/public/images/logo_0007.jpg">
                <a href="http://zuoyou-sofa.com/"><p style="font-size: 2em">唐一酒店</p><br/></a>
                <div class="about">
                    <p>酒店装饰华贵典雅，具有浓郁的欧陆风格。</p>
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
                        成立时间：2001<br/>
                        注册资本：400万人民币<br/>
                        咨询电话：0532-88614000<br/>
                        企业类型：有限责任公司<br/>
                        注册地址：青岛 市南区 香港中路<br/><br/>
                    </div>
                    <div class="center-title-line">
                        <span class="title">公司规模：</span>
                        <span class="short-line"></span>
                    </div>
                    <div class="center-content">
                        分厂：无<br/>
                        子公司：无<br/>
                        驻外办事处机构：无<br/>
                        员工人数：2000人<br/>
                        占地面积：10000平米<br/><br/>
                    </div>
                </div>
                <div class="center-right">
                    <p style="font-size: 1.1em">公司图片：</p>
                    <br/>
                    <div class="imgBox" id="slider">
                        <div class="banner">
                            <ul id="banner-image">
                                <li style="background-image: url(/public/images/rotate7_1.png)"></li>
                                <li style="background-image: url(/public/images/rotate7_2.png)"></li>
                                <li style="background-image: url(/public/images/rotate7_3.png)"></li>
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
                    所属行业：服务业<br/>
                    细分行业：住宿<br/>
                    <p class="content">
                    </p><br/>
                </div>
                <div class="bottom-title-line">
                    <span class="title">产品服务：</span>
                    <span class="long-line"></span>
                </div>
                <div class="center-content">
                    <p class="content">可调节温度的中央空调系统、LED液晶电视、宽带上网、浴室、热水壶、吹风机在质量不断提高的同时，努力在设施上不断完善。酒店除拥有各类客房、中西餐厅、宴会厅以及游泳池、香熏疗养园、歌舞厅等场所外，更有大型的商务中心，其会议、办公及通信等设施先进、功能齐全。
                    </p><br/>
                </div>
                <div class="bottom-title-line">
                    <span class="title">优势专长：</span>
                    <span class="long-line"></span>
                </div>
                <div class="center-content">
                    技术优势：先进的技术<br/>
                    产品优势：产品符合大众口味<br/>
                    市场优势：市场充足<br/>
                    人才优势：兢兢业业的优秀员工<br/>
                    管理优势：卓有成效的管理团队<br/>
                    品牌优势：独有特色<br/><br/>
                </div>
                <div class="bottom-title-line">
                    <span class="title">公司介绍：</span>
                    <span class="long-line"></span>
                </div>
                <div class="center-content">
                    <p class="content">
                        致力于为客人打造更加完美的商务之旅，一键式服务让您体验现代商旅的舒适与便捷；训练有素的酒店一线员工能熟练地进行英语和日语沟通，并为客人提供优质、全面、超值地服务，同时酒店还特设了多语种的宾客关系团队，可以随时为外藉客人提供周到、贴心地服务，并帮助客人解决在店期间的一切问题。
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
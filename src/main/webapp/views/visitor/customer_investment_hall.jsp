<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1" />
    <link rel="stylesheet" href="/public/stylesheets/customer-header.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer_investment_hall.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
    <script type="text/javascript" src="/public/javascripts/jq.js"></script>
    <script type="text/javascript" src="/public/javascripts/citi.js"></script>
    <script src="/public/javascripts/unslider.js"></script>
    <script type="text/javascript">
    $(window).load(function() {
        var unslider = $('.banner').unslider({
            delay: 3000,
            fluid: true
        });
        $('.unslider-arrow').click(function() {
            var fn = this.className.split(' ')[1];
            unslider.data('unslider')[fn]();
        });

    });
    </script>
    <script>
        $(document).ready(function() {
            $('.nav-item').eq(${flag}).addClass('active');
        })
    </script>
    <title>投资中心</title>
</head>

<body>
    <jsp:include page="customer-header.jsp"/>
    <div id="main">
        <div id="content">
            <div id="first-glance" class="banner">
                <a href="#" class="unslider-arrow next">
                    <img src="/public/images/btn-pre.png" alt="" />
                </a>
                <a href="#" class="unslider-arrow next">
                    <img src="/public/images/btn-next.png" alt="" />
                </a>
                <ul>
                    <li style="background-image:url(/public/images/banner1.jpg)">
                    </li>
                    <li style="background-image:url(/public/images/banner2.png)">
                    </li>
                    <li style="background-image:url(/public/images/banner3.png)">
                    </li>
                </ul>
            </div>
            <div id="service-item">
                <div id="item-management">
                    <p class="title">私募股权</p>
                    <p class="item-describe">
                        降低投资者的交易费用
                        <br/> 提高投资效率
                        <br/> 青睐规模初定的成长企业，多倾向中长期
                        <br/> 降低财务成本
                        <br/> 投资退出渠道多样化
                    </p>
                    <div class="other">
                            <a href="/customer/invest_more" class="content_more" style="color: black">
                                了解更多
                            </a>
                        <span class="content_more_text">
                            <a href="/customer/login.htm" title="" style="color: #4F4F4F;font-size: 14px">
                                去投资 去融资
                            </a>
                        </span>
                    </div>
                </div>
                <div id="item-esignature">
                    <p class="title">私募债</p>
                    <p class="item-describe">
                        便捷高效
                        <br/> 审批周期快
                        <br/> 综合融资成本低于信托资金和民间借贷
                        <br/> 政策贴息
                        <br/> 期限较长
                    </p>
                    <div class="other">
                        <a href="/customer/debt_more" class="content_more" style="color: black">
                            了解更多
                        </a>
                        <span class="content_more_text_1">
                            <a href="/customer/login.htm" title="" style="color: #4F4F4F;font-size: 14px">
                                去投资 去融资
                            </a>
                        </span>
                    </div>
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

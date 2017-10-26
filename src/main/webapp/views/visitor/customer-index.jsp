<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1" />
    <title>首页</title>
    <link rel="stylesheet" href="/public/stylesheets/customer-header.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-index.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
    <script type="text/javascript" src="/public/javascripts/jq.js"></script>
    <script type="text/javascript" src="/public/javascripts/d3.min.js"></script>
    <script type="text/javascript" src="/public/javascripts/citi.js"></script>
    <script src="/public/javascripts/unslider.js"></script>

    <script>
        $(document).ready(function() {
            $('.nav-item').eq(${flag}).addClass('active');
        })
    </script>
    <script type="text/javascript">
    $(window).load(function() {
        var unslider = $('.banner').unslider({
            delay: 3000,
            fluid: true
        });
        console.log(unslider);
        $('.unslider-arrow').click(function() {
            var fn = this.className.split(' ')[1];
            unslider.data('unslider')[fn]();
        });

        var svgCircle = {
            obj: '#circle-image',
            dataSet: [10, 50, 25, 20, 80],
            arc: {
                innerWidth: 40,
                outerWidth: 70
            },
            svg: {
                translate: {
                    x: 20,
                    y: 20
                },
                width: 160,
                height: 160,
                text: {
                    text: '资本分布',
                    color: '#767576',
                    fontSize: '0.7em',
                    translate: {
                        x: 50,
                        y: 70
                    }
                }
            },
            g: {
                translate: {
                    x: 70,
                    y: 70
                },
                stroke: 'white',
                strokeWidth: 1,
                text: false,
                animation: 60
            }

        };


        var color = citi.circle(svgCircle);
        var i = 0;
        $('.color').each(function() {
            $(this).css('background-color', color[i++]);
        });

        var count = {
            digital: 6276,
            speedUp: 100,
            upTimes: 80,
            obj: '#num'
        };

        citi.countUp(count);

        var lscroll = {
            parent: {
                obj: '#policy-item',
                height: 240
            },
            scroll: {
                height: 360,
                speedUp: 120,
                firstScroll: '#lf',
                secondScroll: '#ls'
            }

        };

        var rscroll = {
            parent: {
                obj: '#market-item',
                height: 240
            },
            scroll: {
                height: 360,
                speedUp: 120,
                firstScroll: '#rf',
                secondScroll: '#rs'
            }
        }

        citi.scrollUp(lscroll);
        citi.scrollUp(rscroll);

    });
    </script>
</head>

<body>
<%
    List<Map<String, Object>> policy = (List<Map<String, Object>>) request.getAttribute("policy");
    List<Map<String, Object>> market = (List<Map<String, Object>>) request.getAttribute("market");
%>
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
            <div id="data-show">
                <div id="reg-num">
                    <p class="title">
                        当前注册企业总数
                    </p>
                    <p id="num-show">
                        <span id="num">6276</span>
                        <span>家</span>
                    </p>
                </div>
                <div id="rise-speed">
                    <div class="title">
                        <p>注册企业增长情况</p>
                    </div>
                    <div id="show-area">
                        <ul id="line-list">
                            <li>
                                <p>近一周</p>
                                <div class="data-image">
                                    <img src="/public/images/arrow1.png">
                                </div>
                                <p class="speed">增长率:13%</p>
                            </li>
                            <li>
                                <p>近一月</p>
                                <div class="data-image">
                                    <img src="/public/images/arrow2.png">
                                </div>
                                <p class="speed">增长率:13%</p>
                            </li>
                            <li>
                                <p>近一季</p>
                                <div class="data-image">
                                    <img src="/public/images/arrow3.png">
                                </div>
                                <p class="speed">增长率:13%</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="circle">
                    <div id="circle-data">
                        <ul>
                            <li>
                                <span class="color"></span>
                                <span class="d">100万以下</span>
                            </li>
                            <li>
                                <span class="color"></span>
                                <span class="d">100万~200万</span>
                            </li>
                            <li>
                                <span class="color"></span>
                                <span class="d">200万~500</span>
                            </li>
                            <li>
                                <span class="color"></span>
                                <span class="d">500万~1000万</span>
                            </li>
                            <li>
                                <span class="color"></span>
                                <span class="d">1000万以上</span>
                            </li>
                        </ul>
                    </div>
                    <div id="circle-image">
                    </div>
                </div>
            </div>
            <div id="invest-center">
                <p id="inv-title">投资中心</p>
                <ul id="invest-list">
                    <li class="list">
                        <p>私募股权</p>
                        <ul class="list-item">
                            <li>
                                <span>降低投资者的交易费用</span>
                            </li>
                            <li>
                                <span>提高投资效率</span>
                            </li>
                            <li>
                                <span>青睐规模初定的成长企业，多倾向中长期</span>
                            </li>
                            <li>
                                <span>降低财务成本</span>
                            </li>
                            <li>
                                <span>投资退出渠道多样化</span>
                            </li>
                        </ul>
                    </li>
                    <li class="list">
                        <p>私募债</p>
                        <ul class="list-item">
                            <li>
                                <span>便捷高效</span>
                            </li>
                            <li>
                                <span>审批周期快</span>
                            </li>
                            <li>
                                <span>综合融资成本低于信托资金和民间借贷</span>
                            </li>
                            <li>
                                <span>期限较长</span>
                            </li>
                            <li>
                                <span>政策贴息</span>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div id="news">
                <p id="zixun">资讯</p>
                <div id="news-area">
                    <ul>
                        <li>
                            <div class="title-nav">
                                <span>政策资讯</span>
                                <span class="more">
                                    <a href="/customer/report_more/7" title="">更多</a>
                                </span>
                            </div>
                            <div id="policy-item">
                                <div class="zixun-item" id="lf">
                                    <% for(int i=0;i<policy.size();++i){%>
                                    <p>
                                        <a title="<%=policy.get(i).get("fileName")%>" href="/uploads/<%= policy.get(i).get("path")%>"><%=policy.get(i).get("fileName")%>
                                        </a>
                                    </p>
                                    <%}%>
                                </div>
                                <div class="zixun-item" id="ls">
                                    <% for(int i=0;i<policy.size();++i){%>
                                    <p>
                                        <a title="<%=policy.get(i).get("fileName")%>" href="/uploads/<%=policy.get(i).get("path")%>"><%=policy.get(i).get("fileName")%>
                                        </a>
                                    </p>
                                    <%}%>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="title-nav">
                                <span>市场资讯</span>
                                <span class="more">
                                    <a href="/customer/report_more/8" title="">更多</a>
                                </span>
                            </div>
                            <div id="market-item">
                                <div class="zixun-item" id="rf">
                                    <% for(int i=0;i<market.size();++i){%>
                                    <p>
                                        <a title="<%=market.get(i).get("fileName")%>" href="/uploads/<%=market.get(i).get("path")%>"><%=market.get(i).get("fileName")%>
                                        </a>
                                    </p>
                                    <%}%>
                                </div>
                                <div class="zixun-item" id="rs">
                                    <% for(int i=0;i<market.size();++i){%>
                                    <p>
                                        <a title="<%=market.get(i).get("fileName")%>" href="/uploads/<%=market.get(i).get("path")%>"><%=market.get(i).get("fileName")%>
                                        </a>
                                    </p>
                                    <%}%>
                                </div>
                        </li>
                    </ul>
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

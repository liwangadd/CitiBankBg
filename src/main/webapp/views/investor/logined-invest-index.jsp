<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1"/>
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/invest-header.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/logined-invest-index.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
    <script type="text/javascript" src="/public/javascripts/jq.js"></script>
    <script type="text/javascript" src="/public/javascripts/d3.min.js"></script>
    <script type="text/javascript" src="/public/javascripts/citi.js"></script>
    <script src="/public/javascripts/unslider.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            var unslider = $('.banner').unslider({
                delay: 3000,
                fluid: true
            });
            $('#site-banner-r').css({
                height: '240px'
            })
            $('#site-banner-l').css({
                height: '240px'
            })
            $('.unslider-arrow').click(function () {
                var fn = this.className.split(' ')[1];
                unslider.data('unslider')[fn]();
            });
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
        })
    </script>
    <title>投资人首页</title>
</head>
<body>
<%
    List<Map<String, Object>> policy = (List<Map<String, Object>>) request.getAttribute("policy");
    List<Map<String, Object>> market = (List<Map<String, Object>>) request.getAttribute("market");
%>
<jsp:include page="invest-header.jsp"/>
<div id="main">
    <div id="content">
        <div class="banner" id="first-glance">
            <a href="#" class="unslider-arrow next">
                <img src="/public/images/btn-pre.png" alt=""/>
            </a>
            <a href="#" class="unslider-arrow next">
                <img src="/public/images/btn-next.png" alt=""/>
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
        <div class="banner" id="second-glance">
            <a href="#" class="unslider-arrow next">
                <img src="/public/images/btn-pre.png" alt=""/>
            </a>
            <a href="#" class="unslider-arrow next">
                <img src="/public/images/btn-next.png" alt=""/>
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
        <div id="invest-center">
            <div id="inv-title">
                <p>推荐行业</p>
            </div>
            <div id="invest-list">
                <div id="left-banner">
                    <p>行业一</p>

                    <div class="banner" id="site-banner-l">
                        <ul>
                            <li style="background-image:url(/public/images/touzizhe1.png)">
                            </li>
                            <li style="background-image:url(/public/images/touzizhe2.png)">
                            </li>
                        </ul>
                    </div>
                    <div class="invest-more">
                        <span><a href="/investor/invest-more" title="">查看更多行业>></a></span>
                    </div>
                </div>
                <div id="right-banner">
                    <p>行业二</p>

                    <div class="banner" id="site-banner-r">
                        <ul>
                            <li style="background-image:url(/public/images/touzizhe3.png)">
                            </li>
                            <li style="background-image:url(/public/images/touzizhe4.png)">
                            </li>
                        </ul>
                    </div>
                    <div class="invest-more">
                        <span><a href="/investor/invest-more" title="">查看更多行业>></a></span>
                    </div>
                </div>
            </div>
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
                                <% for (int i = 0; i < policy.size(); ++i) {%>
                                <p>
                                    <a title="<%=policy.get(i).get("fileName")%>"
                                       href="/uploads/<%= policy.get(i).get("path")%>"><%=policy.get(i).get("fileName")%>
                                    </a>
                                </p>
                                <%}%>
                            </div>
                            <div class="zixun-item" id="ls">
                                <% for (int i = 0; i < policy.size(); ++i) {%>
                                <p>
                                    <a title="<%=policy.get(i).get("fileName")%>"
                                       href="/uploads/<%=policy.get(i).get("path")%>"><%=policy.get(i).get("fileName")%>
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
                                <% for (int i = 0; i < market.size(); ++i) {%>
                                <p>
                                    <a title="<%=market.get(i).get("fileName")%>"
                                       href="/uploads/<%=market.get(i).get("path")%>"><%=market.get(i).get("fileName")%>
                                    </a>
                                </p>
                                <%}%>
                            </div>
                            <div class="zixun-item" id="rs">
                                <% for (int i = 0; i < market.size(); ++i) {%>
                                <p>
                                    <a title="<%=market.get(i).get("fileName")%>"
                                       href="/uploads/<%=market.get(i).get("path")%>"><%=market.get(i).get("fileName")%>
                                    </a>
                                </p>
                                <%}%>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</div>
</body>

</html>

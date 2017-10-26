<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/business-header.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/personal-attiontion.css">
    <script type="text/javascript" src="/public/javascripts/jq.js"></script>
    <script type="text/javascript " src="/public/javascripts/lubotu.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".select").each(function () {
                var s = $(this);
                var z = parseInt(s.css("z-index"));
                var dt = $(this).children("dt");
                var dd = $(this).children("dd");
                var _show = function () {
                    dd.slideDown(200);
                    dt.addClass("cur");
                    s.css("z-index", z + 1);
                };
                var _hide = function () {
                    dd.slideUp(200);
                    dt.removeClass("cur");
                    s.css("z-index", z);
                };
                dt.click(function () {
                    dd.is(":hidden") ? _show() : _hide();
                });
                dd.find("a").click(function () {
                    dt.html($(this).html());
                    _hide();
                });
                $("body").click(function (i) {
                    !$(i.target).parents(".select").first().is(s) ? _hide() : "";
                });
                $("#search-btn").click(function (i) {
                    var search = $('#search').val();
                    if ('' != search)
                        window.location.href = '/company/isFollow/' + search;
                })
            })
        })
    </script>

    <meta charset="UTF-8">
    <title>我关注的</title>
</head>
<body>
<%List<Map<String, Object>> attention = (List<Map<String, Object>>) request.getAttribute("attention");%>
<jsp:include page="business-header.jsp"/>
<div class="wrap">
    <div class="title">
        我关注的
    </div>
    <!--title-->
    <div class="toubu">
        <div class="sort">

            <dl class="select">
                <span>排序:</span>
                <dt>请选择</dt>
                <dd>
                    <ul>
                        <li><a href="/company/ifollow/time">按时间排序</a></li>
                        <li><a href="/company/ifollow/credit">按信用排序</a></li>
                        <li><a href="/company/ifollow/palce">按地点排序</a></li>
                        <li><a href="/company/ifollow/model">按规模排序</a></li>
                    </ul>
                </dd>
            </dl>
        </div>
        <!--sort-->
        <div class="search">
            <input id="search" type="text" placeholder="请输入关键字搜索">
            <button id="search-btn">&nbsp&nbsp&nbsp&nbsp搜&nbsp索</button>
        </div>
    </div>
    <!--search-->
    <table cellSpacing=0 cellPadding=0>
        <tr>
            <th>
                投资者名称
            </th>
            <th>
                关注状态
            </th>
            <th>
                发布产品
            </th>
            <th>
                产品类型
            </th>
            <th>
                更多操作
            </th>
        </tr>
        <% for (int i = 0; i < attention.size(); i++) {%>
        <tr>
            <th>
                <%= attention.get(i).get("companyName")%>
            </th>
            <th>
                <%= attention.get(i).get("attentionState")%>
            </th>
            <th>
                <%= attention.get(i).get("productName")%>
            </th>
            <th>
                <%= Integer.valueOf(attention.get(i).get("productType").toString()) == 0 ? "股券" : "债券"%>
            </th>
            <th>
                更多操作
            </th>
        </tr>
        <% } %>

    </table>
    <div class="page">

    </div>
    <!--page-->
    <p class="company">推荐企业</p>

    <div class="slider">
        <div class="slider_left">
            <p>行业一</p>

            <div id="focus1">
                <div class="pre"></div>
                <div class="next"></div>
                <ul>
                    <li>
                        <a href="#" target="_blank">
                            <img src="/public/images/company-service-banner1.jpg">
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <img src="/public/images/company-service-banner2.jpg">
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <img src="/public/images/company-service-banner3.jpg">
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <img src="/public/images/company-service-banner4.jpg">
                        </a>
                    </li>
                </ul>
            </div>
            <div class="invest-more">
                <span><a href="more_investor.htm" title="">查看更多投资人>></a> </span>
            </div>
        </div>
        <!--slider_left-->
        <div class="slider_right">
            <p>行业二</p>

            <div id="focus">
                <div class="pre"></div>
                <div class="next"></div>
                <ul>
                    <li>
                        <a href="#" target="_blank">
                            <img src="/public/images/company-service-banner2.jpg">
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <img src="/public/images/company-service-banner4.jpg">
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <img src="/public/images/company-service-banner3.jpg">
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <img src="/public/images/company-service-banner1.jpg">
                        </a>
                    </li>
                </ul>
            </div>
            <div class="invest-more">
                <span><a href="more_investor.htm" title="">查看更多投资人>></a> </span>
            </div>

        </div>
        <!--slider_right-->
    </div>
    <!--slider-->
</div>
<!--wrap-->
<div id="footer">
    <div id="foot-list">
    </div>
</div>
</body>
</html>
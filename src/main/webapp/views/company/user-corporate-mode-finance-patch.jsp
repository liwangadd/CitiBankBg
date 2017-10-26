<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>

<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1"/>
    <title>已登录-企业模式-融资板块（撮合配对）</title>
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/business-header.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/user-corporate-mode-finance-patch.css">
    <script type="text/javascript" src="/public/javascripts/jq.js"></script>
</head>
<body>
<jsp:include page="business-header.jsp"/>
<div id="mainContainer">
    <div id="main">
        <div id="mainContent">
            <form action="/financing/byKey" method="post">
                <div id="searchForm">
                    <div id="searchInput">
                        <div id="textClear">
                            <a href=""><img src="../public/images/cancel.png"></a>
                        </div>
                        <input id="searchText" type="text" name="productName" placeholder="请输入关键字搜索">
                    </div>
                    <a href="/financing/investor/matching" style="display:inline;">
                        <div id="searchButton">确定</div>
                    </a>
                </div>
                <div id="selectForm">
                    <p>类型：</p>
                    <select name="productType">
                        <option value=0>全部</option>
                        <option value=1>股权投资</option>
                        <option value=2>债权投资</option>
                    </select>
                </div>

                <a href="javascript:void(0);" style="display:inline;color:#2A324B;padding-left:20px;"
                   onclick="$('#patchPanel').slideToggle('slow');">显示/隐藏筛选信息</a>
            </form>
            <form action="" method="post">
                <div id="patchPanel">
                    <div>地区筛选：
                        <div class="selectItemGroup" id="investArea">
                            <span class="selectItem"><input name="investArea" type="checkbox" value="黑龙江">黑龙江</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="吉林">吉林</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="辽宁">辽宁</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="河北">河北</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="河南">河南</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="新疆">新疆</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="江苏">江苏</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="山西">山西</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="陕西">陕西</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="甘肃">甘肃</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="四川">四川</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="青海">青海</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="湖南">湖南</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="江西">江西</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="湖北">湖北</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="安徽">安徽</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="浙江">浙江</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="福建">福建</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="广东">广东</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="广西">广西</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="贵州">贵州</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="云南">云南</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="海南">海南</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="内蒙古">内蒙古</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="山东">山东</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="宁夏">宁夏</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="西藏">西藏</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="北京">北京</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="天津">天津</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="上海">上海</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="重庆">重庆 </span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="香港">香港</span>
                            <span class="selectItem"><input name="investArea" type="checkbox" value="台湾">台湾</span>
                        </div>

                    </div>
                    <br/>

                    <div>行业筛选：
                        <div class="selectItemGroup" id="investIndustry">
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="金融投资">金融投资</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="房地产">房地产</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="能源">能源</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="化学化工">化学化工</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="节能环保">节能环保</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="建筑建材">建筑建材</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="矿产冶金">矿产冶金</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="基础设施">基础设施</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="农林牧渔">农林牧渔</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="国防军工">国防军工</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="航空航天">航空航天</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="电器设备">电气设备</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="机械机电">机械机电</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="交通运输">交通运输</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="仓储物流">仓储物流</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="汽车汽配">汽车汽配</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="纺织服装饰品">纺织服装饰品</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="旅游酒店">旅游酒店</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="餐饮休闲娱乐">餐饮休闲娱乐</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="教育培训体育">教育培训体育</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="文化传媒广告">文化传媒广告</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="批发零售">批发零售</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="家电数码">家电数码</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="家居日用">家居日用</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="食品饮料烟草">食品饮料烟草</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="医疗保健">医疗保健</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="生物医药">生物医药</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="IT互联网">IT互联网</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="电子通信">电子通信</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="海洋开发">海洋开发</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="商务贸易">商务贸易</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="家政服务">家政服务</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="园林园艺">园林园艺</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="收藏品">收藏品</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="行政事业机构">行政事业机构</span>
                            <span class="selectItem"><input name="investIndustry" type="checkbox" value="其它行业">其他行业</span>

                        </div>
                    </div>
                    <br/>

                    <div>资金类型：
                        <div class="selectItemGroup" id="">
                            <span class="selectItem"><input type="checkbox">全部</span>
                            <span class="selectItem"><input type="checkbox">个人资金</span>
                            <span class="selectItem"><input type="checkbox">企业资金</span>
                            <span class="selectItem"><input type="checkbox">天使投资</span>
                            <span class="selectItem"><input type="checkbox">VC投资</span>
                            <span class="selectItem"><input type="checkbox">PE投资</span>
                            <span class="selectItem"><input type="checkbox">小额贷款</span>
                            <span class="selectItem"><input type="checkbox">典当公司</span>
                            <span class="selectItem"><input type="checkbox">担保公司</span>
                            <span class="selectItem"><input type="checkbox">金融租赁</span>
                            <span class="selectItem"><input type="checkbox">投资公司</span>
                            <span class="selectItem"><input type="checkbox">资产管理</span>
                            <span class="selectItem"><input type="checkbox">商业银行</span>
                            <span class="selectItem"><input type="checkbox">证券公司</span>
                            <span class="selectItem"><input type="checkbox">基金公司</span>
                            <span class="selectItem"><input type="checkbox">信托公司</span>
                            <span class="selectItem"><input type="checkbox">资产管理</span>
                            <span class="selectItem"><input type="checkbox">其他资金</span>
                        </div>
                    </div>
                    <br/>

                    <div>金额区间：
                        <div class="selectItemGroup">
                            <input type="input" class="sizeSelect">&nbsp;-&nbsp;<input type="input" class="sizeSelect">
                            万元
                        </div>
                    </div>
                    <br/>

                    <div>收益率范围：
                        <div class="selectItemGroup">
                            <input type="input" class="sizeSelect">&nbsp;-&nbsp;<input type="input" class="sizeSelect">
                            %
                        </div>
                        <a href="">
                            <input type="submit" value="确定" id="patchConfirmButton">

                        </a>
                    </div>
                </div>
            </form>
            <!--******* *************************************** table**********************************************-->
            <div id="TableList">
                <table>

                    <tr>
                        <th>产品名称</th>
                        <th>类型</th>
                        <th>地区</th>
                        <th>资金类型</th>
                        <th>金额</th>
                        <th class="rightItem">投资者</th>
                    </tr>
                    <% List<Map<String, Object>> matching = (List<Map<String, Object>>) request.getAttribute("data");
                    %>

                    <% if (matching != null) for (int i = 0; i < matching.size(); i++) {%>
                    <tr>
                        <td><a style="color:#000000" href="/financing/getDetail/<%=matching.get(i).get("id")%>" title="">
                            <%=matching.get(i).get("productName")%>
                        </a>
                        </td>
                        <td><%=matching.get(i).get("productType")%>
                        </td>
                        <td><%=matching.get(i).get("registerAddress")%>
                        </td>
                        <td><%=matching.get(i).get("workingFiled")%>
                        </td>
                        <td><%=matching.get(i).get("investMoney")%>
                        </td>
                        <td><%=matching.get(i).get("username")%>
                        </td>

                    </tr>
                    <%}%>
                </table>
            </div>
            <div id="page">
            </div>
        </div>
    </div>
</div>
<div id="footer">
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1"/>
    <title>撮合配对</title>
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/business-header.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/company-corporate-mode-finance-patch.css">
    <script type="text/javascript" src="/public/javascripts/jq.js"></script>
</head>

<body>
<jsp:include page="./invest-header.jsp"/>
<div id="mainContainer">
    <div id="main">

        <div id="mainContent">
            <form action="/financing/byKey" method="post">
            <div id="searchForm">
                <div id="searchInput">
                    <div id="textClear">
                        <a href="javascript:void(0);"><img src="/public/images/cancel.png"></a>
                    </div>
                    <input id="searchText" type="text" placeholder="请输入关键字搜索"
                           name="productName">
                </div>
                <a href="javascript:void(0);" onclick="$('form')[0].submit();" style="display:inline;">
                    <div id="searchButton">确定</div>
                </a>
            </div>
            <div id="selectForm">
                <p>类型：</p>
                <select name="productType">
                    <option value="全部">全部</option>
                    <option value="股权">股权投资</option>
                    <option value="债权">债权投资</option>
                </select>
            </div>
            <a href="javascript:void(0);" style="display:inline;color:#2A324B;padding-left:20px;"
               onclick="$('#patchPanel').slideToggle('slow');">显示/隐藏筛选信息</a>
            </form>
            <form action="" method="post">
                <div id="patchPanel">`
                <div>地区筛选：
                    <div class="selectItemGroup">
                        <span class="selectItem"><input type="checkbox" name="investArea" value="黑龙江">黑龙江</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="吉林">吉林</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="辽宁">辽宁</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="河北">河北</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="河南">河南</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="新疆">新疆</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="江苏">江苏</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="山西">山西</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="陕西">陕西</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="甘肃">甘肃</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="四川">四川</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="青海">青海</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="湖南">湖南</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="江西">江西</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="湖北">湖北</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="安徽">安徽</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="浙江">浙江</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="福建">福建</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="广东">广东</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="广西">广西</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="贵州">贵州</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="云南">云南</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="海南">海南</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="内蒙古">内蒙古</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="山东">山东</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="宁夏">宁夏</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="西藏">西藏</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="北京">北京</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="天津">天津</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="上海">上海</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="重庆">重庆 </span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="香港">香港</span>
                        <span class="selectItem"><input type="checkbox" name="investArea" value="台湾">台湾</span>
                    </div>
                </div>
                <br/>

                <div>行业筛选：
                    <div>行业筛选：
                        <div class="selectItemGroup">
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="金融投资">金融投资</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="房地产">房地产</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="能源">能源</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="化学化工">化学化工</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="节能环保">节能环保</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="建筑建材">建筑建材</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="矿产冶金">矿产冶金</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="基础设施">基础设施</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="农林牧渔">农林牧渔</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="国防军工">国防军工</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="航空航天">航空航天</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="电气设备">电气设备</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="机械机电">机械机电</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="交通运输">交通运输</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="仓储物流">仓储物流</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="汽车汽配">汽车汽配</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="纺织服装饰品">纺织服装饰品</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="旅游酒店">旅游酒店</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="餐饮休闲娱乐">餐饮休闲娱乐</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="教育培训体育">教育培训体育</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="文化传媒广告">文化传媒广告</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="批发零售">批发零售</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="家电数码">家电数码</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="家居日用">家居日用</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="食品饮料烟草">食品饮料烟草</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="医疗保健">医疗保健</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="生物医药">生物医药</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="IT互联网">IT互联网</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="电子通信">电子通信</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="海洋开发">海洋开发</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="商务贸易">商务贸易</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="家政服务">家政服务</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="园林园艺">园林园艺</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="收藏品">收藏品</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="行政事业机构">行政事业机构</span>
                            <span class="selectItem"><input type="checkbox" name="investIndustry" value="其他行业">其他行业</span>
                        </div>
                    </div>
                    <br/>

                    <div>资金类型：
                        <div class="selectItemGroup">
                            <span class="select-item"><input type="checkbox" value="全部">全部</span>
                            <span class="select-item"><input type="checkbox" value="无担保">无担保</span>
                            <span class="select-item"><input type="checkbox" value="公司/机构担保">公司/机构担保</span>
                            <span class="select-item"><input type="checkbox" value="个人担保">个人担保</span>
                        </div>
                    </div>
                    <br/>

                    <div>金额区间：
                        <div class="selectItem-group">
                            <input type="input" class="sizeSelect">&nbsp;-&nbsp;
                            <input type="input" class="sizeSelect"> 万元
                        </div>
                    </div>
                    <br/>

                    <div>收益率范围：
                        <div class="selectItem-group">
                            <input type="input" class="sizeSelect" name="lowLeastReturnDemand">&nbsp;-&nbsp;
                            <input type="input" class="sizeSelect" name="highLeastReturnDemand"> %
                        </div>
                    </div>
                    <br/>

                    <div>
                        信用等级范围：
                        <div class="selectItem-group">
                            <input type="input" class="sizeSelect" name="lowCreditRank">&nbsp;-&nbsp;
                            <input type="input" class="sizeSelect" name="highCreditRank">
                        </div>
                        <a href="">
                            <input type="submit" value="确定" id="patchConfirmButton">

                        </a>
                    </div>
                </div>
            </div>
            </form>


                <div id="TableList">
                    <table>
                        <tr>
                            <th>产品名称</th>
                            <th>类型</th>
                            <th>地区</th>
                            <th>所属行业</th>
                            <th>资金类型</th>
                            <th>收益率</th>
                            <th class="rightItem">信用等级</th>
                        </tr>

                        <% List<Map<String, Object>> matching = (List<Map<String, Object>>) request.getAttribute("data");
                        %>

                        <% for (int i = 0; i < matching.size(); i++) {%>
                        <tr>
                            <td><a style="color:#000000" href="/financing/getDetail/<%=matching.get(i).get("id")%>" title="">
                                <%=matching.get(i).get("productName")%>
                            </a>
                            </td>
                            <td><%=matching.get(i).get("productType")%>
                            </td>
                            <td><%=matching.get(i).get("registerAddress")%>
                            </td>
                            <td>
                                <div class="layer-credit-level">
                                    <a href="javascript:void(0)"><%=matching.get(i).get("workingFiled")%></a>
                                    <div class="credit-level">
                                        <img src="/public/images/industry-level.png"/>
                                    </div>
                                </div>


                            </td>
                            <%
                                String[] string = {"个人资金","企业资金","天使投资"};
                                int random = (int)(Math.random()*3+1);
                                String investorMoney = string[random];%>
                            <td><%=investorMoney%>
                            </td>
                            <td><%=1 + (int)(Math.random()*100)%>
                            </td>
                            <% int a = (int)(Math.random()*3+1);
                                char c;
                                if(a==1){c  = 'A';}
                                else if(a==2){c='B';}
                                else {c='C';}
                                int b = (int)(Math.random()*3+1);
                                String s="";
                                for(int ii=0;ii<b;ii++){
                                    s+=c;
                                }
                            %>
                            <td>
                                <div class="layer-credit-level">
                                    <a href="javascript:void(0)"> <%=s%></a>
                                    <div class="credit-level">
                                        <img src="/public/images/credit-level.jpg"/>
                                    </div>
                                </div>


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

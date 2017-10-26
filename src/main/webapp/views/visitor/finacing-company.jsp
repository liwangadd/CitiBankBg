<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-header.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/finacing-company.css">
    <script src="/public/javascripts/jq.js"></script>
    <script>
        $(document).ready(function() {
            $('.nav-item').eq(${flag}).addClass('active');
        })
    </script>
    <title>融资企业</title>
</head>

<body>

<body>
<jsp:include page="customer-header.jsp"/>
<div class="wrap">
    <div class="search">
        <span class="tit">企业搜索:</span>
        <input type="text" placeholder="请输入关键词">
        <img src="/public/images/colse.png" class="close">
        <button class="bt_sear">搜索</button>
        <div class="select">
            <ul>
                <li>
                    <span>行业筛选</span>

                    <div class="select1">
                        <input type="text" placeholder="请输入行业">
                        <button>确定</button>
                        <p>热门行业：</p>
                        <a href="#">金融投资</a>
                        <a href="#">房地产</a>
                        <a href="#">能源</a>
                        <a href="#">化学化工</a>
                        <a href="#">节能环保</a></br>
                        <a href="#">IT互联网</a>
                        <a href="#">建筑建材</a>
                        <a href="#">矿产冶金</a>
                        <a href="#">基础设施</a>
                        <a href="#">农林牧渔</a></br>
                        <a href="#">国防军工</a>
                        <a href="#">航空航天</a>
                        <a href="#">电气设备</a>
                        <a href="#">机械机电</a>
                        <a href="#">交通运输</a></br>
                        <a href="#">仓储物流</a>
                        <a href="#">汽车汽配</a>
                        <a href="#">旅游酒店</a>
                        <a href="#">纺织服装饰品</a>
                        <a href="#">餐饮休闲娱乐</a></br>
                        <a href="#">教育培训体育</a>
                        <a href="#">文化传媒广告</a>
                        <a href="#">批发零售</a>
                        <a href="#">家电数码</a>
                        <a href="#">家居日用</a></br>
                        <a href="#">食品饮料烟酒</a>
                        <a href="#">医疗保健</a>
                        <a href="#">生物医药</a>
                        <a href="#">电子通信</a>
                        <a href="#">园艺园林</a>
                    </div>
                </li>
                <li>
                    <span>地区筛选</span>

                    <div class="select2">
                        <input type="text" placeholder="请输入地区">
                        <button>确定</button>
                        <p>热门地区：</p>
                        <a href="#">北京</a>
                        <a href="#">上海</a>
                        <a href="#">广州</a>
                        <a href="#">深圳</a>
                        <a href="#">大连</a></br>
                        <a href="#">杭州</a>
                        <a href="#">沈阳</a>
                        <a href="#">南京</a>
                        <a href="#">天津</a>
                        <a href="#">厦门</a></br>
                        <a href="#">武汉</a>
                        <a href="#">西安</a>
                        <a href="#">太原</a>
                        <a href="#">郑州</a>
                        <a href="#">南宁</a></br>
                        <a href="#">哈尔滨</a>
                        <a href="#">长春</a>
                        <a href="#">昆明</a>
                        <a href="#">石家庄</a>
                        <a href="#">济南</a></br>
                        <a href="#">长沙</a>
                        <a href="#">呼和浩特</a>
                        <a href="#">乌鲁木齐</a>
                        <a href="#">拉萨</a>
                        <a href="#">苏州</a></br>
                        <a href="#">扬州</a>
                        <a href="#">兰州</a>
                        <a href="#">银川</a>
                        <a href="#">西宁</a>
                        <a href="#">桂林</a>
                    </div>
                </li>
                <li>
                    <span>金额筛选</span>

                    <div class="select3">
                        <p>融资金额:</p>
                        <input type="text" class="input1">
                        <span class="line">-</span>
                        <input type="text" class="input2">
                        <span class="danwei">单位：万元</span>
                        </br>
                        <button>确定</button>
                    </div>
                </li>
            </ul>
        </div>
        <!--select-->
    </div>
    <!--search-->
    <table cellSpacing=0 cellPadding=0>
        <tr>
            <th class="photo">公司logo/照片</th>
            <th class="name">公司名称</th>
            <th class="service">主营业务</th>
            <th class="require">融资需求</th>
            <th class="info">公司简介</th>
        </tr>
        <tr>
            <td class="pho">
                <a href="/customer/financing_more/1"> <img src="/public/images/9.jpg "></a>
            </td>
            <td class="namely">
                <a href="/customer/financing_more/1">
                    <span>铱泰有限公司</span></a>
            </td>
            <td class="cata">
                <span>电子通信</span>
            </td>
            <td class="req">
                <span>300万到500万</span>
            </td>
            <td>
                <span>专注于产品的设计和销售，现在的产品主要涵盖有特殊装饰功能的灯饰，电加热取暖器/电壁炉，未来会更加关注于高度智能的机器人</span>
            </td>
        </tr>
        <tr>
            <td class="pho">
                <a href="/customer/financing_more/2"> <img src="/public/images/2.jpg "></a>
            </td>
            <td class="namely">
                <a href="/customer/financing_more/2">
                    <span>仙宗汇饭店</span></a>
            </td>
            <td class="cata">
                <span>餐饮休闲娱乐</span>
            </td>
            <td class="req">
                <span>400万元</span>
            </td>
            <td>
                <span>七星级高标准的商务快餐，主要以高品质原材料，如有机大米，现榨油，经营养师合理搭配，做成的商务快餐。服务人群定位，商圈和会场，展会等。</span>
            </td>
        </tr>
        <tr>
            <td class="pho">
                <a href="/customer/financing_more/3">
                    <img src="/public/images/3.jpg "></a>
            </td>
            <td class="namely">
                <a href="/customer/financing_more/3">
                    <span>书风绿色酒店 </span></a>
            </td>
            <td class="cata">
                <span>旅游酒店</span>
            </td>
            <td class="req">
                <span>3亿元</span>
            </td>
            <td>
                <span>按五星标准投资兴建，集客房、餐饮、会议、休闲、娱乐于一体的大型花园式商务度假酒店</span>
            </td>
        </tr>
        <tr>
            <td class="pho">
                <a href="/customer/financing_more/4">
                    <img src="/public/images/4.jpg "></a>
            </td>
            <td class="namely">
                <a href="/customer/financing_more/4">
                    <span>莱客饭店</span></a>
            </td>
            <td class="cata">
                <span>电子通信</span>
            </td>
            <td class="req">
                <span>300万到500万</span>
            </td>
            <td>
                <span>专注于产品的设计和销售，现在的产品主要涵盖有特殊装饰功能的灯饰，电加热取暖器/电壁炉，未来会更加关注于高度智能的机器人</span>
            </td>
        </tr>
        <tr>
            <td class="pho">
                <a href="/customer/financing_more/5">
                    <img src="/public/images/5.jpg "></a>
            </td>
            <td class="namely">
                <a href="/customer/financing_more/5">
                    <span>线衫饭店</span></a>
            </td>
            <td class="cata">
                <span>  餐饮休闲娱乐</span>
            </td>
            <td class="req">
                <span> 1000万元</span>
            </td>
            <td>
                <span>是一座按五星级标准设计和建造的多功能商务型酒店，高雅、温馨的装饰令房间显宽敞明亮</span>
            </td>
        </tr>
        <tr>
            <td class="pho">
                <a href="/customer/financing_more/6">
                    <img src="/public/images/6.jpg "></a>
            </td>
            <td class="namely">
                <a href="/customer/financing_more/6">
                    <span>宜冠地产</span></a>
            </td>
            <td class="cata">
                <span>房地产</span>
            </td>
            <td class="req">
                <span>3亿-5亿元</span>
            </td>
            <td>
                <span>位于呼和浩特市行政、商务、金融中心如意经济技术开发区（国家级），项目区位优越、交通便利，处于自治区打造的“一街五区”核心，是内蒙古自治区和呼和浩特市党委、政府及有关行政机构所处的办公新区</span>
            </td>
        </tr>
        <tr>
            <td class="pho">
                <a href="/customer/financing_more/7">
                    <img src="/public/images/7.jpg "></a>
            </td>
            <td class="namely">
                <a href="/customer/financing_more/7">
                    <span>杨大有限公司</span></a>
            </td>
            <td class="cata">
                <span>电子通信</span>
            </td>
            <td class="req">
                <span>300万到500万</span>
            </td>
            <td>
                <span>专注于产品的设计和销售，现在的产品主要涵盖有特殊装饰功能的灯饰，电加热取暖器/电壁炉，未来会更加关注于高度智能的机器人</span>
            </td>
        </tr>
        <tr>
            <td class="pho">
                <a href="/customer/financing_more/8">
                    <img src="/public/images/8.jpg "></a>
            </td>
            <td class="namely">
                <a href="/customer/financing_more/8">
                    <span>嘉碧斯化妆品企业</span></a>
            </td>
            <td class="cata">
                <span>化妆品</span>
            </td>
            <td class="req">
                <span>1000万元</span>
            </td>
            <td>
                <span>是一家专业为客户提供以精油芳疗产品为主打的美护商品及相关美容美体服务的公司。主要经营单方精油、复方精油、基础油、按摩油、精油皂、纯露、各类精油添加的美护产品以及线下精油芳疗服务</span>
            </td>
        </tr>
        <tr>
            <td class="pho">
                <a href="/customer/financing_more/9">
                    <img src="/public/images/1.jpg "></a>
            </td>
            <td class="namely">
                <a href="/customer/financing_more/9">
                    <span>盛逸酒店</span></a>
            </td>
            <td class="cata">
                <span>旅游酒店</span>
            </td>
            <td class="req">
                <span>1亿元</span>
            </td>
            <td>
                <span>风格迥异的中、西餐厅布局合理、品位高雅，其中中餐以经营大连海鲜以及极品燕、鲍、翅为主，宴会大厅可同时接纳300人就餐，是举办大型宴会的理想场所；以唐诗宋词命名的31间RTV雅间，装修豪华，各领风骚；西餐夏威夷咖啡厅、城市酒吧、大堂酒廊，别具一格，风情盎然。</span>
            </td>
        </tr>
    </table>
</div>
<!--wrap-->
<div id="footer">
    <div id="foot-list">
    </div>
</div>
</body>

</html>

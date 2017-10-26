<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1"/>
    <title>业务洽谈-历史合同查询</title>
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/business-header.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/business-communication-history-inquiry.css">

</head>
<body>
<jsp:include page="invest-header.jsp"/>

<div id="mainContainer">
    <div id="main">
        <div id="mainContent">
            <a href="javascript:void(0)" onClick="javascript:history.back(-1);">
                <div id="comebackButton">返回上一层<img src="/public/images/back.png"></div>
            </a>

            <div id="searchForm">
                <div id="searchInput">
                    <div id="textClear">
                        <a href=""><img src="/public/images/cancel.png"></a>
                    </div>
                    <input id="searchText" type="text" placeholder="请输入关键字搜索">
                </div>
                <a href="" style="display:inline;">
                    <div id="searchButton">搜索</div>
                </a>

            </div>
            <div id="selectForm">
                <p>排序：</p>
                <select>
                    <option></option>
                    <option>签约时间</option>
                    <option>签约方</option>
                    <option>合约内容</option>
                    <option>状态</option>
                </select>
            </div>
            <!--******* *************************************** table**********************************************-->
            <div id="TableList">
                <table class="hovertable">

                    <tr>
                        <th>接收时间</th>
                        <th>合同发送方</th>
                        <th class="rightItem">操作</th>
                    </tr>

                    <!--*****************全是一样的**************************************************************************************-->
                    <tr>
                        <td><input type="checkbox">2015-01-01</td>
                        <td>新发石材</td>
                        <td><a href="">
                            <div>删除</div>
                        </a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox">2015-01-01</td>
                        <td>新发石材</td>
                        <td><a href="">
                            <div>删除</div>
                        </a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox">2015-01-01</td>
                        <td>新发石材</td>
                        <td><a href="">
                            <div>删除</div>
                        </a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox">2015-01-01</td>
                        <td>新发石材</td>
                        <td><a href="">
                            <div>删除</div>
                        </a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox">2015-01-01</td>
                        <td>新发石材</td>
                        <td><a href="">
                            <div>删除</div>
                        </a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox">2015-01-01</td>
                        <td>新发石材</td>
                        <td><a href="">
                            <div>删除</div>
                        </a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox">2015-01-01</td>
                        <td>新发石材</td>
                        <td><a href="">
                            <div>删除</div>
                        </a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox">2015-01-01</td>
                        <td>新发石材</td>
                        <td><a href="">
                            <div>删除</div>
                        </a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox">2015-01-01</td>
                        <td>新发石材</td>
                        <td><a href="">
                            <div>删除</div>
                        </a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox">2015-01-01</td>
                        <td>新发石材</td>
                        <td><a href="">
                            <div>删除</div>
                        </a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox">2015-01-01</td>
                        <td>新发石材</td>
                        <td><a href="">
                            <div>删除</div>
                        </a></td>
                    </tr>
                </table>
                <a href="">
                    <div id="deleteItemsButton">批量删除</div>
                </a>
            </div>
            <div id="page">
            </div>
        </div>
    </div>
</div>
<div id="footer">
</div>
</body>
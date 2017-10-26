<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1"/>
    <title>个人中心-我的消息</title>
    <link rel="stylesheet" type="text/css" href="../public/stylesheets/business-header.css">
    <link rel="stylesheet" type="text/css" href="../public/stylesheets/customer-footer.css">
    <link rel="stylesheet" type="text/css" href="../public/stylesheets/personal_center_my_message_privately.css">

</head>
<body>
<jsp:include page="invest-header.jsp"/>
<div id="mainContainer">
    <div id="main">
        <div id="sidebarContainer">
            <div id="listTitle">
                <ul id="sidebarTitle">
                    <li class="sidebarItem">我的消息</li>
                </ul>
            </div>
            <div id="listContent">
                <ul id="sidebar">
                    <li class="sidebarItem"><a href="" class="sidebarItem">系统信息</a></li>
                    <li class="sidebarItem"><a href="" class="sidebarItem">私信</a></li>
                    <li class="sidebarItem"><a href="" class="sidebarItem">定向披露</a></li>
                </ul>
            </div>
        </div>
        <div id="mainContent">
            <div id="searchForm">
                <div id="searchInput">
                    <input id="searchText" type="text" placeholder="请输入关键字">
                </div>
                <a href="" style="display:inline;">
                    <div class="searchButton">确定</div>
                </a>

            </div>
            <div id="mainContent_list">
                <div class="table_item">
                    &nbsp;&nbsp;股权人定向披露
                    <img class="img_down" src="../public/images/pick_up.png">
                </div>
                <div class="table_item_text">
                    <div class="pick_up_first">
                        <span>请选择定向披露的对象:</span><br/>

                        <form>
                            <input type="checkbox"/>
                            <label>男</label><br/>
                            <input type="checkbox"/>
                            <label>女</label><br/>
                            <input type="checkbox"/>
                            <label>王森淼</label>
                        </form>
                    </div>
                    <div class="pick_up_second">
                        <form>
                            <label>股份变动及股东变动情况.PDF</label><br/>
                            <label>股份变动及股东变动情况.PDF</label><br/>
                            <label>股份变动及股东变动情况.PDF</label>
                        </form>
                    </div>
                    <div class="inputButton">
                        <a href="" style="display:inline;">
                            <div class="searchButton">确定</div>
                        </a>
                    </div>

                </div>

                <div class="table_item">
                    &nbsp;&nbsp;债权人定向披露
                    <img class="img_down" src="../public/images/pick_up.png">
                </div>
                <div class="table_item_text">
                    <div class="pick_up_first">
                        <span>请选择定向披露的对象:</span><br/>

                        <form>
                            <input type="checkbox"/>
                            <label>男</label><br/>
                            <input type="checkbox"/>
                            <label>女</label><br/>
                            <input type="checkbox"/>
                            <label>王森淼</label>
                        </form>
                    </div>
                    <div class="pick_up_second">
                        <form>
                            <label>股份变动及股东变动情况.PDF</label><br/>
                            <label>股份变动及股东变动情况.PDF</label><br/>
                            <label>股份变动及股东变动情况.PDF</label>
                        </form>
                    </div>
                    <div class="inputButton">
                        <a href="" style="display:inline;">
                            <div class="searchButton">确定</div>
                        </a>
                    </div>

                </div>
            </div>
            <div id="page">
                <div>

                </div>
            </div>
        </div>
    </div>
</div>
<div id="footer">
</div>
</body>

<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1"/>
    <title>预约管理-已完成预约</title>
    <link rel="stylesheet" type="text/css" href="../public/stylesheets/business-header.css">
    <link rel="stylesheet" type="text/css" href="../public/stylesheets/customer-footer.css">
    <link rel="stylesheet" type="text/css" href="../public/stylesheets/reservation-management-finished-reservation.css">

</head>
<body>
<% List<Map<String, Object>> manage_message_finish = (List<Map<String, Object>>) request.getAttribute("manage_message_finish");%>
<jsp:include page="business-header.jsp"/>
<div id="mainContainer">
    <div id="main">
        <jsp:include page="reservation_list_appointment.jsp"/>
        <div id="mainContent">

            <div id="searchForm">
                <p>查询：</p>

                <div id="searchInput">
                    <input id="searchText" type="text" placeholder="请输入关键字搜索">
                </div>
                <a href="" style="display:inline;">
                    <div id="searchButton">确定</div>
                </a>

            </div>
            <div id="selectForm">
                <p>排序：</p>
                <select>
                    <option></option>
                    <option>预约方</option>
                    <option>联系方式</option>
                    <option>预约时间</option>
                    <option>预约提交时间</option>
                    <option>操作</option>
                </select>
            </div>
            <!--******* *************************************** table**********************************************-->
            <div id="TableList">
                <table class="hovertable">

                    <tr>
                        <th>预约方</th>
                        <th>联系方式</th>
                        <th>预约时间</th>
                        <th>&nbsp;预约提交时间</th>
                    </tr>

                    <!--*****************全是一样的**************************************************************************************-->
                    <tr onMouseOver="this.style.backgroundColor='#ffff66';"
                        onMouseOut="this.style.backgroundColor='#d4e3e5';">
                        <%for (int i = 0; i < manage_message_finish.size(); i++) {%>
                        <td><%=manage_message_finish.get(i).get("appointmentName")%>&nbsp;</td>
                        <td>&nbsp;<%= manage_message_finish.get(i).get("contractWay") %>&nbsp;</td>
                        <td>&nbsp;<%= manage_message_finish.get(i).get("appointmentTime") %>&nbsp;</td>
                        <td>&nbsp;<%= manage_message_finish.get(i).get("submitTime") %>&nbsp;&nbsp;</td>
                        <% } %>
                    </tr>

                </table>
                <hr class="hr1"/>
            </div>
            <!--<div id="listcontain">


                  <ul id="Ul_listcontainer">
                          <li class="h1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;内容&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;更多操作</li>
                       <hr class="line1">

                  </ul>
            </div>-->
            <div id="page">
            </div>
        </div>
    </div>
</div>
<div id="footer">
</div>
</body>
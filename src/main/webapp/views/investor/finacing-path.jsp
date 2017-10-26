<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
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
<jsp:include page="invest-header.jsp"/>
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
        <div id="patchPanel">
          <div>
            地区筛选：
            <div class="selectItemGroup">
              <span class="selectItem"><input type="checkbox">地区一</span>
              <span class="selectItem"><input type="checkbox">地区一</span>
              <span class="selectItem"><input type="checkbox">地区一</span>
              <span class="selectItem"><input type="checkbox">地区一</span>
              <span class="selectItem"><input type="checkbox">地区一</span>
              <span class="selectItem"><input type="checkbox">地区一</span>
              <span class="selectItem"><input type="checkbox">地区一</span>
              <span class="selectItem"><input type="checkbox">地区一</span>
              <span class="selectItem"><input type="checkbox">地区一</span>
              <span class="selectItem"><input type="checkbox">地区一</span>
              <span class="selectItem"><input type="checkbox">地区一</span>
              <span class="selectItem"><input type="checkbox">地区一</span>
            </div>
          </div>
          <br />
          <div>
            行业筛选：
            <div class="selectItemGroup">
              <span class="selectItem"><input type="checkbox">行业一</span>
              <span class="selectItem"><input type="checkbox">行业一</span>
              <span class="selectItem"><input type="checkbox">行业一</span>
              <span class="selectItem"><input type="checkbox">行业一</span>
              <span class="selectItem"><input type="checkbox">行业一</span>
              <span class="selectItem"><input type="checkbox">行业一</span>
              <span class="selectItem"><input type="checkbox">行业一</span>
              <span class="selectItem"><input type="checkbox">行业一</span>
              <span class="selectItem"><input type="checkbox">行业一</span>
              <span class="selectItem"><input type="checkbox">行业一</span>
              <span class="selectItem"><input type="checkbox">行业一</span>
              <span class="selectItem"><input type="checkbox">行业一</span>
            </div>
          </div>
          <br />
          <div>
            资金类型：
            <div class="selectItemGroup">
              <span class="select-item"><input type="checkbox">全部</span>
              <span class="select-item"><input type="checkbox">无担保</span>
              <span class="select-item"><input type="checkbox">公司/机构担保</span>
              <span class="select-item"><input type="checkbox">个人担保</span>
            </div>
          </div>
          <br />
          <div>
            金额区间：
            <div class="selectItem-group">
              <input type="input" class="sizeSelect" />&nbsp;-&nbsp;
              <input type="input" class="sizeSelect" /> 万元
            </div>
          </div>
          <br />
          <div>
            收益率范围：
            <div class="selectItem-group">
              <input type="input" class="sizeSelect">&nbsp;-&nbsp; <input
                    type="input" class="sizeSelect"> %
            </div>
          </div>
          <br />
          <div>
            信用等级范围：
            <div class="selectItem-group">
              <input type="text" class="sizeSelect">&nbsp;-&nbsp; <input
                    type="text" class="sizeSelect">
            </div>
            <a href="">
              <div id="patchConfirmButton">确定</div>
            </a>
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

          <% if(matching!=null) for (int i = 0; i < matching.size(); i++) {%>
          <tr>
            <td><a style="color:#000000" href="/financing/getDetail/<%=matching.get(i).get("productName")%>" title="">
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
            <td><%=1 + (int)(Math.random()*100)%>
            </td>
            <td><%=1 + (int)(Math.random()*10)%>
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

<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html >
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="renderer" content="webkit" />
  <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1" />
  <link rel="stylesheet" type="text/css" href="/public/stylesheets/business-header.css" />
  <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css" />
  <link rel="stylesheet" type="text/css" href="/public/stylesheets/release_debt_purchase.css" />
  <title>债权购买</title>
</head>

<body>
<jsp:include page="invest-header.jsp"></jsp:include>
<div id="main_body_m">
  <div id="swap">
    <div id="list">
      <div id="list-title">
        <span>意向发布</span>
      </div>
      <jsp:include page="release-debt-left-nav.jsp"></jsp:include>
    </div>
    <div class="main_body">
      <div id="main_first">
        <div class="body_title">基本信息</div>
        <hr>
        <div class="first">
          <% Map data=(Map)request.getAttribute("data");%>
          <p >
            姓名：<%=data.get("investorName")%><br/>
            所在地区：<%=data.get("investArea")%><br/>
          </p>
        </div>
        <div class="first">
          <p >
            投资地区：<%=data.get("investArea")%><br/>
            <%--资金主体：<%=data.get("fundBody")%><br/>--%>
            投资行业：<%=data.get("investField")%><br/>
          </p>
        </div>
        <form class="input_form" action="/intention/intentionPublish<%--/1--%>" method="post" name="form" >
          <div class="input_text">
              <label>投资金额：</label>
              <input class="input" type="text" name="investMoney" />&nbsp;万
              <br/>
              <label>产品类型：</label>
              <select name="productType">
                <option value="股权">股权</option>
                <option value="债权">债权</option>
              </select>
              <br/>
              <label>资金主体：</label>
              <input class="input" type="text" name="fundBody" />
              <br/>
              <label>投资年限：</label>
              <input class="input" type="text" name="investTime" />&nbsp;年
              <br/>
            </div>
          <div>
              <div class="body_title">更多信息</div>
              <hr>
              <div class="input_text">
                <div class="input_form">
                  <label>最低回报要求:（年利率）</label>
                  <input class="input" type="text" name="leastReturnDemand" />&nbsp;%
                </div>
                <div>
                  <label>风险控制要求:</label>
                  <select name="riskControlDemand">
                    <option value=0>看书</option>
                    <option value=1 selected="selectd">抵押</option>
                    <option value=2>运动</option>
                    <option value=3>购物</option>
                  </select>
                </div>
                <div class="input_form">
                  <label>要求提供文件:</label>
                  <select name="demandFile">
                    <option value="是">是</option>
                    <option value="否">否</option>
                  </select>
                  <br/>
                  <div class="input_textarea"> 投资要求概述: </div>
                  <textarea rows="7" cols="60" name="demandSummarize"></textarea>
                </div>
              </div>
              <div id="button">
                <input type="button" value="发布" id="btn"/>
              </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<div id="footer">
</div>
<script type="text/javascript" src="../public/javascripts/imd.js"></script>
<script type="text/javascript">
  imd.initDocReady(function() {

    imd.Event('#btn').on('click', function(e) {
      var form = document.forms.form,
              data = new FormData(form);
      data.append("productType",2);
      data.append("flag",1);
      imd.ajax({
        type: 'POST',
        async: true,
        url: '/intention/intentionPublish',
        receiveType: 'json',
        data: data,
        success: function(res) {
          alert(res.result);
        },
        error: function(e) {
          alert('网络错误，稍后再试');
        }
      });
    });

  });
</script>
</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1" />

	<title>私募股权详情</title>
     <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-header.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
	<link rel="stylesheet" type="text/css" href="/public/stylesheets/customer_investment_stock.css">
	<link rel="stylesheet" type="text/css" href="/public/stylesheets/reset.css">
	<script src="/public/javascripts/jq.js"></script>
	<script>
		$(document).ready(function() {
			$('.nav-item').eq(${flag}).addClass('active');
		})
	</script>
</head>
<body>
	<jsp:include page="customer-header.jsp"/>
	<div class="wrapper">
		<div class="return">
			<a href="/customer/invest">返回上一层</a>
		</div><!--return-->
		
	
	<div class="title">
		<p>私募股权详情</p>
	</div><!--title-->
	<div class="introduce">
		<p>私募股权融资是指通过私募形式对私有企业，及非上市企业进行的权益性投资，在交易实施过程中附带考虑了将来的退出机制，即通过上市、
        并购或管理层回购等方式，出售持股获利。私募股权投资有助于降低投资者的交易费用，提高投资效率，降低财务成本，融通资金。与风投相比，
        私募融权投资更为青睐规模初定的成长企业，多倾向中长期，投资退出渠道多样化，有IPO、售出（TRADE SALE）、兼并收购（M&A)、
        标的公司管理层回购等</p>
	</div><!--introduce-->
	<div class="detail">
		<div class="gross fl">
			<p class="total">平台累积交易量</p>
			<p><span class="num">8888</span><span class="total">笔</span></p>
		</div><!--gross-->
		<div class="amount fl">
			<p class="total">平台累积交易金额</p>
			<p><span class="num">8888</span><span class="total">亿</span></p>
		</div><!--amount-->
		<div class="situation fl">
			<p class="total" >交易增长情况</p>
			<div class="info">
			<span >近一周</span><br>
			<img src="/public/images/arrow1.png"><br>
			<span>增长率13%</span></div>
			<div class="info">
			<span>近一月</span><br>
			<img src="/public/images/arrow2.png"><br>
			<span>增长率13%</span>
			</div>
			<div class="info">
			<span>近一季</span><br>
			<img src="/public/images/arrow3.png"><br>
			<span>增长率13%</span>
			</div>
		</div><!--situation-->
	</div><!--detail-->
	<div class="progress">
		<p class="tit">私募股权交易流程</p>
		<ul>
            <li ><img  src="/public/images/loan.png"></li>
            <li><img  src="/public/images/time.png"></li>
            <li><img  src="/public/images/number.png"></li>
            <li><img  src="/public/images/sign.png"></li>
            <li><img  src="/public/images/check.png"></li>
            <li><img  src="/public/images/issue.png"></li>
            <li><img  src="/public/images/DC.png"></li>
            <a href="#" class="DC">注册用户</a>
             <a href="#" class="issue">实名认证</a>
             <a href="#" class="check">撮合配对</a>
             <a href="#" class="sign">预约洽谈</a>
             <a href="#" class="number">电子签约</a>
             <a href="#" class="time">在线汇款</a >
              <a href="#" class="loan">投资成功</a>
		</ul>
	</div><!--progress-->
	</div><!--wrapper-->
    <div id="footer">
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1" />

	<title>电子签约</title>
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-header.css">
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
	<link rel="stylesheet" type="text/css" href="/public/stylesheets/signature.css">
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
				<a href="/customer/service">返回上一层</a>
			</div><!--return-->
		
	
		<div class="title">
			<p>电子签约详情</p>
		</div><!--title-->
		<div class="introduce">
			<p>电子签约是一种提供给交易双方线上交易的自动化便捷途径。用户可以在本平台上，通过业务洽谈、协商协议具体内容，依托数字认证、时间戳认证，完成线上交易。实现交易的电子签约流程。</p>
		</div><!--introduce-->
		<div class="detail">
			<div class="gross fl">
				<p class="total">平台累积交易量</p>
				<p>
                	<span class="num">8888</span>
                    <span class="total">笔</span>
                 </p>
			</div><!--gross-->
			<div class="amount fl">
				<p class="total">平台累积交易金额</p>
				<p>
            		<span class="num">8888</span>
                	<span class="total">亿</span>
            	</p>
			</div><!--amount-->
			<div class="situation fl">
				<p class="total" >交易增长情况</p>
				<div class="info">
					<span>近一周</span>
                    	
						<img src="/public/images/arrow1.png">
					<span>增长率13%</span>
            	</div>
				<div class="info">
					<span>近一月</span>
                    	
						<img src="/public/images/arrow2.png">
					<span>增长率13%</span>
				</div>
				<div class="info">
					<span >近一季</span>
                    	
						<img src="/public/images/arrow3.png">
					<span>增长率13%</span>
				</div>
			</div><!--situation-->
		</div><!--detail-->
		<div class="progress">
			<p class="tit">电子签约流程</p>
			<ul>
            	<li >
                	<img  src="/public/images/loan.png">
                </li>
            	<li>
                	<img  src="/public/images/time.png">
                </li>
            	<li>
                	<img  src="/public/images/number.png">
                </li>
            	<li>
                	<img  src="/public/images/sign.png">
                </li>
            	<li>
                	<img  src="/public/images/check.png">
                </li>
            	<li>
                	<img  src="/public/images/issue.png">
                </li>
            	<li>
                	<img  src="/public/images/DC.png">
                </li>
            	<a href="#" class="DC">数字证书认证</a>
            	<a href="#" class="issue">证书下发</a>
           	 	<a href="#" class="check">查看协议</a>
           		<a href="#" class="sign">签订协议</a>
            	<a href="#" class="number">数字认证</a>
            	<a href="#" class="time">时间戳认证</a >
            	<a href="#" class="loan">放款确认</a>
			</ul>
		</div><!--progress-->
	</div><!--wrapper-->
    <div id="footer">
    </div>
</body>
</html>
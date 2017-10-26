<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>

<head>
	<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1" />
	<title>厦门市东林电子有限公司-评估结果</title>
	<link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
	<link rel="stylesheet" type="text/css" href="/public/stylesheets/assess-result.css">
	<script type="text/javascript" src="/public/javascripts/jq.js"></script>
	<script type="text/javascript">
		function showResult() {
			var result = $('#resultContent').html();
			$('#resultContent').html('<img src="/public/images/waiting.gif"/>');
			$('#resultContent').fadeIn();
			setTimeout(function() {
				$('#resultContent').fadeOut('normal', function() {
					$('#resultContent').html(result);
					$('#resultContent').fadeIn();
				});
			}, 1000);
		}
	</script>
</head>
<body>
	<div id="headerContainer">
		<div id="header">
			<div><span id="headTitle"><h1>欢迎使用企业级别评估系统</h1></span><span id="exitButton"><a href="/customer/index">退出</a></span></div>
		</div>
	</div>
	<div id="mainContainer">
		<div id="main">
			<div id="mainContent">
				<h2>厦门市东林电子有限公司</h2>
				<div>
					<table>
						<tr>
							<td>营业执照注册号：420547123457404</td>
							<td>组织机构代码：77654681-268</td>
						</tr>
						<tr>
							<td>流动比率：1.84</td>
							<td>运营资本周转率：0.65</td>
						</tr>
						<tr>
							<td>速动比率：0.91</td>
							<td>全部资本债务化比率：0.111</td>
						</tr>
						<tr>
							<td>产权比率：0.81</td>
							<td>应收账款周转率：2.95</td>
						</tr>
						<tr>
							<td>权益比率：0.52</td>
							<td>固定资产周转率：1.71</td>
						</tr>
						<tr>
							<td>存货周转率：0.83</td>
						</tr>
					</table>
				</div>
				<div id="resultContainer">
					<div id="resultContent">
						<div id="resultTitle">评估结果</div>
						<div id="result">AAA</div>
					</div>
					
				</div>
				<div id="assessButton">
					<a href="javascript:void(0);" onclick="showResult();" style="display:inline;">开始评估</a>
				</div>
			</div>
			<div id="navContent">
				<div id="navTitle">评级详情</div>
				<div id="navList">
					<ul>
						<li><a href="javascript:void(0);">最新评级状况</a></li>
						<li><a href="javascript:void(0);">历史评级记录</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="footer"></div>
</body>
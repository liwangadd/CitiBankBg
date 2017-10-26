<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>

<head>

	<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1" />
	<title>评估</title>
	<link rel="stylesheet" type="text/css" href="/public/stylesheets/customer-footer.css">
	<link rel="stylesheet" type="text/css" href="/public/stylesheets/level-assess.css">
	<script type="text/javascript" src="/public/javascripts/jq.js"></script>
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
				<div id="searchForm">
					<div id="searchInput">
						<div id="textClear">
							<a href="javascript:void(0);"><img src="../public/images/cancel.png"></a>
						</div>
						<input id="searchText" type="text" placeholder="请输入关键字搜索">
					</div>
					<a href="" style="display:inline;">
						<div id="searchButton">确定</div>
					</a>
				</div>
				<div id="selectForm">
					<p>类型：</p>
						<select>
							<option>全部</option>
							<option>股权投资</option>
							<option>债权投资</option>
						</select>
				</div>
				<a href="javascript:void(0);" style="display:inline;color:#2A324B;margin-left:10px;" onclick="$('#patchPanel').slideToggle('slow');">
				显示/隐藏筛选信息
				</a>
				<div id="patchPanel">
					<div>地区筛选：
						<div class="selectItemGroup">
							<span class="selectItem"><input type="checkbox">东北</span>
							<span class="selectItem"><input type="checkbox">华北</span>
							<span class="selectItem"><input type="checkbox">华东</span>
							<span class="selectItem"><input type="checkbox">华南</span>
							<span class="selectItem"><input type="checkbox">华中</span>
							<span class="selectItem"><input type="checkbox">西北</span>
							<span class="selectItem"><input type="checkbox">西南</span>
						</div>
					</div>
					<br/>
					<div>更新时间：
						<div class="selectItemGroup">
							<span class="selectItem"><input type="checkbox">2015年</span>
							<span class="selectItem"><input type="checkbox">2014年</span>
							<span class="selectItem"><input type="checkbox">2013年</span>
							<span class="selectItem"><input type="checkbox">2012年</span>
							<span class="selectItem"><input type="checkbox">2011年</span>
							<span class="selectItem"><input type="checkbox">2011年以前</span>
						</div>
					</div>
				</div> 
				<div id="TableList">
					<table>
						<tr>
							<th>企业名称</th>
							<th>营业执照注册号</th>
							<th>组织机构代码</th>
							<th class="rightItem">资料更新时间</th>
						</tr>
						<tr>
							<td><a href="/customer/assess_1">福建省鑫兴华教育科技有限公司</a></td>
							<td class="shortItem">420103000057404</td>
							<td class="shortItem">77659841-264</td>
							<td class="shortItem">2011-06-09</td>
						</tr>
						<tr>
							<td><a href="/customer/assess_2">厦门市东林电子有限公司</a></td>
							<td class="shortItem">420547123457404</td>
							<td class="shortItem">77654681-268</td>
							<td class="shortItem">2013-12-12</td>
						</tr>
					</table>
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
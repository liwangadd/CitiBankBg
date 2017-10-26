<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page isELIgnored="false" %>
<% Map<String, Object> userInfo = (Map<String, Object>) request.getAttribute("userInfo");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="/public/stylesheets/business-header.css" rel="stylesheet" type="text/css">
    <link href="/public/stylesheets/customer-footer.css" rel="stylesheet" type="text/css">
    <link href="/public/stylesheets/data_management-edit.css" rel="stylesheet" type="text/css">
    <title>资料管理-编辑状态</title>
   <%-- <script>
        document.getElementById("sit").value = "<%= userInfo.get("companyType")%>";
    </script>--%>
</head>
<body>
<jsp:include page="business-header.jsp"/>
<div id="main">
    <div id="title">
        资 料 管 理
    </div>
    <div class="subtitle">
        基本内容
        <div id="back">
            <a href="">返回上一层</a>
        </div>
    </div>
    <hr/>
    <form method="post" action="/company/saveUserInfo" name="form">
    <div class="content">
        <div class="box1">
            <p>
                公司名称：<br/>
                公司类型：<%= userInfo.get("companyType")%><br/>
                所属行业：<%= userInfo.get("workingFiled")%><br/>
                咨询电话：<input id="tel" name="consultPhone" value="<%= userInfo.get("consultPhone")%>"><br/>
                <%--咨询电话：<%= userInfo.get("consultPhone")%><br>--%>
                主营业务：<%= userInfo.get("majorAffair")%><br/>
                盈利模式：
                <select id="sit">
                    <option value="1">关系服务</option>
                    <option value="2">产品标准</option>
                    <option value="3">客户解决方案</option>
                    <option value="4">个性挖掘</option>
                    <option value="5">速度领先</option>
                    <option value="6">数据处理</option>
                    <option value="7">成本占优</option>
                    <option value="8">中转站模式</option>
                    <option value="9">其他</option>
                </select>
                <br/>
            </p>
        </div>
        <div class="box2">
            <p>
                注册资本：<%= userInfo.get("registerCapital")%>万<br/>
                营业执照注册号：<%= userInfo.get("businessLisence")%><br/>
                法人代表：<input id="legal_person" name="legalPresentative" value="<%= userInfo.get("legalPresentative")%>"><br/>
                注册时间：<%= userInfo.get("formedTime")%><br/>
                总部地址：<input id="address" name="baseAddress" value="<%= userInfo.get("baseAddress")%>"><br/>
                当前信用等级：AAA<br/>
            </p>
        </div>
        <div class="box3">
            <div id="img">
                <img src="<%= userInfo.get("logo")%>" style="width: 133px;height:183px">
            </div>
            <div id="modify">
                <a href="">更改</a>
            </div>
        </div>
    </div>
    <div class="subtitle">
        更多信息
    </div>
    <hr/>
    <div class="content" style="height: 700px;position: relative">
        <div style="height: 152px">
            <div class="box1">
                <p>
                    公司细分行业：<%= userInfo.get("subdividedIndustry")%><br/>
                    担保方：<input id="danbaofang" name="guarantor" value="<%= userInfo.get("guarantor")%>"><br/>
                    员工人数：<input id="renshu" name="staffNumber" value="<%= userInfo.get("staffNumber")%>"><br/>
                    相关机构：<input id="xiangguanjigou" name="relatedMechanism" value="<%= userInfo.get("relatedMechanism")%>"><br/>
                </p>
            </div>
            <div class="box2">
                <p>
                    占地面积：<input id="area" name="occupiedArea" value="<%= userInfo.get("occupiedArea")%>"><br/>
                    分厂：<input id="fenchang" name="branch" value="<%= userInfo.get("branch")%>"><br/>
                    子公司：<input id="zigongsi" name="childCompany" value="<%= userInfo.get("childCompany")%>"><br/>
                    驻外办事机构：<input id="banshijigou" name="ServiceAgency" value="<%= userInfo.get("ServiceAgency")%>"><br/>
                </p>
            </div>
            <div class="box3" style="height: 152px"></div>
        </div>
        <div class="textarea">bussinessConcept
            经营理念：<textarea rows="2" cols="80%" id="linian" name="bussinessConcept" style="vertical-align: top" ><%= userInfo.get("bussinessConcept")%></textarea><br/>
        </div>
        <div class="textarea">
            产品服务：<textarea rows="2" cols="80%" id="fuwu" name="productService"
                           style="vertical-align: top"><%= userInfo.get("productService")%></textarea><br/>
        </div>
        <div class="textarea">
            行业概况：<textarea rows="2" cols="80%" id="gaikuang" name="industryOverview"
                           style="vertical-align: top"><%= userInfo.get("industryOverview")%></textarea><br/>
        </div>
        <div class="textarea">
            发展战略：<textarea rows="2" cols="80%" id="zhanlue" name="developmentStrategy"
                           style="vertical-align: top"><%= userInfo.get("developmentStrategy")%></textarea><br/>
        </div>
        <div class="textarea">
            团队描述：<textarea rows="2" cols="80%" id="miaoshu" name="teamDescription"
                           style="vertical-align: top"><%= userInfo.get("teamDescription")%></textarea><br/>
        </div>
        <div class="box1">
            <p>优势与专长：</p>

            <div class="subbox">
                技术优势：<input id="jishuyoushi" name="technologicalAdvantage" value="<%= userInfo.get("technologicalAdvantage")%>"><br/>
                产品优势：<input id="chanpinyoushi" name="productAdvantage" value="<%= userInfo.get("productAdvantage")%>"><br/>
                市场优势：<input id="shichangyoushi" name="marketAdvantage" value="<%= userInfo.get("marketAdvantage")%>"><br/>
            </div>
            <div id="other">
                <p>发展情况：<a href="javascript:void(0);" id="add">点击添加</a></p>
                <div id="layer">
                    <div id="nav-title">
                        <span>x</span>
                    </div>
                    <div id="form-list">
                        <div id="list-tips">
                            <span>请填写公司上一季度的财务数据(单位：万元)</span>
                        </div>
                        <div class="layer-form">
                            <label for="">资产总额：</label>
                            <input type="text" name="" />
                        </div>
                        <div class="layer-form">
                            <label for="">负债总额：</label>
                            <input type="text" name="" />
                        </div>
                        <div class="layer-form">
                            <label for="">平均资产总额：</label>
                            <input type="text" name="" />
                        </div>
                        <div class="layer-form">
                            <label for="">所有者权益总额：</label>
                            <input type="text" name="" />
                        </div>
                        <div class="layer-form">
                            <label for="">流动资产：</label>
                            <input type="text" name="" />
                        </div>
                        <div class="layer-form">
                            <label for="">流动负债：</label>
                            <input type="text" name="" />
                        </div>
                        <div class="layer-form">
                            <label for="">销售收入:</label>
                            <input type="text" name="" />
                        </div>
                        <div class="layer-form">
                            <label for="">当期销售净收入:</label>
                            <input type="text" name="" />
                        </div>
                        <div class="layer-form">
                            <label for="">营业成本：</label>
                            <input type="text" name="" />
                        </div>
                        <div class="layer-form">
                            <label for="">当期现售收入:</label>
                            <input type="text" name="" />
                        </div>
                        <div class="layer-form">
                            <label for="">主营业务收入净额:</label>
                            <input type="text" name="" />
                        </div>
                        <div class="layer-form">
                            <label for="">初期应收帐款余额:</label>
                            <input type="text" name="" />
                        </div>
                        <div class="layer-form">
                            <label for="">期末应收帐款余额:</label>
                            <input type="text" name="" />
                        </div>
                        <div class="layer-form">
                            <label for="">利润额:</label>
                            <input type="text" name="" />
                        </div>
                        <div class="layer-form" id="file-upload">
                            <label for="">上传财务报告:</label>
                            <input type="file" name="" />
                            <span id="btn-file">上传</span>
                        </div>
                        <div id="sure" class="layer-form">
                            <span><a href="javascript:void(0);">确定</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="submit">
            <p><a href="" id="btn">保存</a></p>
        </div>
    </div>
</div>
<div id="footer">
    <div id="foot-list">
    </div>
</div>


<script type="text/javascript" src="../public/javascripts/imd.js"></script>
<script type="text/javascript">

    window.onload = function() {

        var nav_title = document.getElementById('nav-title');
        var sure = document.getElementById('sure');
        var layer = document.getElementById('layer');
        var add = document.getElementById('add');
        nav_title.onclick = function(e) {
            layer.style.display = 'none';
        }

        sure.onclick = function(e) {
            layer.style.display = 'none';
        }

        add.onclick = function(e) {
            layer.style.display = 'block';
        }

        imd.Event('#btn').on('click', function(e) {
            var form = document.forms.form;
            var data = new FormData(form);

            imd.ajax({
                url:'/company/saveUserInfo',
                receiveType: 'json',
                type:'POST',
                async: true,
                success: function(res) {
                    alert(res.result);
                },
                data: data,
                error: function(res) {
                    alert('网络错误，稍后再试');
                }
            });
        });
    };
</script>
</body>
</html>
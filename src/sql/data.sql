/*
Navicat MySQL Data Transfer

Source Server         : lr
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : citibank

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2015-09-05 22:55:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `id` varchar(32) NOT NULL,
  `userId` varchar(32) NOT NULL COMMENT '预约本方id',
  `appointmentId` varchar(32) NOT NULL COMMENT '预约方id',
  `appointmentName` varchar(50) NOT NULL COMMENT '预约方',
  `contractWay` int(11) NOT NULL COMMENT '联系方式',
  `appointmentTime` date NOT NULL COMMENT '预约时间',
  `submitTime` date NOT NULL COMMENT '预约提交时间',
  `finishedTime` date DEFAULT NULL COMMENT '预约完成时间',
  `flag` int(11) NOT NULL COMMENT '标记预约是否完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of appointment
-- ----------------------------
INSERT INTO `appointment` VALUES ('appointment1', 'investor1', 'company1', '李旺', '7247001', '2015-01-02', '2015-02-01', '2015-03-01', '0');
INSERT INTO `appointment` VALUES ('appointment2', 'investor2', 'company2', '刘浩', '7247002', '2015-01-03', '2015-02-02', '2015-03-02', '1');
INSERT INTO `appointment` VALUES ('appointment3', 'investor1', 'company3', '李旺', '7247003', '2015-01-04', '2015-02-03', '2015-03-03', '1');

-- ----------------------------
-- Table structure for attention
-- ----------------------------
DROP TABLE IF EXISTS `attention`;
CREATE TABLE `attention` (
  `id` varchar(32) NOT NULL,
  `attentionState` int(1) NOT NULL COMMENT '关注状态，0为互相不关注，1为一方关注，2为互相关注',
  `productType` int(1) NOT NULL,
  `flag` int(1) NOT NULL COMMENT '标记是企业还是投资者,0为企业1为投资者',
  `userId` varchar(32) NOT NULL COMMENT '关联的用户ID',
  `otherId` varchar(32) NOT NULL COMMENT '关注对方的ID',
  `attStockCreditorId` varchar(32) NOT NULL COMMENT '指向股债券的ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attention
-- ----------------------------
INSERT INTO `attention` VALUES ('attention1', '0', '0', '0', 'investor1', 'company1', 'product1');
INSERT INTO `attention` VALUES ('attention2', '1', '0', '1', 'investor1', 'company2', 'product2');
INSERT INTO `attention` VALUES ('attention3', '2', '0', '1', 'investor2', 'company3', 'product3');

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `companyId` varchar(32) NOT NULL COMMENT '公司id',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `companyCode` varchar(50) NOT NULL COMMENT '公司代码',
  `companyName` varchar(50) NOT NULL COMMENT '公司名称',
  `companyType` int(1) DEFAULT NULL COMMENT '公司类型,0为有限责任公司，1为股份有限公司，2为个人合伙企业，3为个人独资企业，4为其它',
  `registerCapital` int(11) DEFAULT NULL COMMENT '注册资本',
  `businessLisence` varchar(50) DEFAULT NULL COMMENT '营业执照注册号',
  `legalPresentative` varchar(50) DEFAULT NULL COMMENT '法定代表人',
  `formedTime` varchar(50) DEFAULT NULL COMMENT '成立时间',
  `officialWeb` varchar(50) DEFAULT NULL COMMENT '官网地址',
  `baseAddress` varchar(50) DEFAULT NULL COMMENT '总部地址',
  `registerAddress` varchar(50) DEFAULT NULL COMMENT '注册地址',
  `consultPhone` varchar(20) DEFAULT NULL COMMENT '咨询电话',
  `workingFiled` varchar(50) DEFAULT NULL COMMENT '所属行业',
  `majorAffair` varchar(50) DEFAULT NULL COMMENT '主营业务',
  `revenueModels` int(50) DEFAULT NULL COMMENT '盈利模式，0为关系服务，1为产业标准，2为客户解决方案，3为个性挖掘，4为速度领先，5为数据处理，6为成本占优，7为中转站模式，8为其它',
  `teamDescription` varchar(50) DEFAULT NULL COMMENT '团队描述',
  `logo` varchar(255) DEFAULT NULL COMMENT 'logo路径',
  `companyPicture` varchar(255) DEFAULT NULL COMMENT '公司图片路径',
  `bussinessConcept` varchar(100) DEFAULT NULL COMMENT '公司经营理念',
  `scale` varchar(50) DEFAULT NULL COMMENT '规模',
  `occupiedArea` double(20,0) DEFAULT NULL COMMENT '占地面积',
  `guarantor` varchar(20) DEFAULT NULL COMMENT '担保方',
  `patentsHonors` varchar(100) DEFAULT NULL COMMENT '专利与荣誉',
  `subdividedIndustry` varchar(100) DEFAULT NULL COMMENT '细分行业',
  `productService` varchar(100) DEFAULT NULL COMMENT '产品服务',
  `relatedOrganization` varchar(100) DEFAULT NULL COMMENT '相关机构',
  `technologicalAdvantage` varchar(100) DEFAULT NULL COMMENT '技术优势',
  `productAdvantage` varchar(100) DEFAULT NULL COMMENT '产品优势',
  `marketAdvantage` varchar(100) DEFAULT NULL COMMENT '市场优势',
  `industryOverview` varchar(100) DEFAULT NULL COMMENT '行业概况',
  `developmentStrategy` varchar(100) DEFAULT NULL COMMENT '发展战略',
  `financingDemand` varchar(10) DEFAULT NULL COMMENT '融资需求',
  `companyInTroduct` varchar(255) DEFAULT NULL COMMENT '公司简介',
   `branch` varchar(100) DEFAULT NULL COMMENT '分厂',
  `staffNumber` int(11) DEFAULT NULL COMMENT '员工人数',
  `childCompany` varchar(100) DEFAULT NULL COMMENT '子公司',
  `ServiceAgency` varchar(100) DEFAULT NULL COMMENT '驻外办事机构',
  PRIMARY KEY (`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('company1', '569603080@qq.com', '123', '12345678-01', '中雅机电实业有限公司', '0', '100000', '123456789123456', '程志文', '2013-01-02', 'http://www.fesco.com.cn', '北京', '大连', '7256001', '农业', '农业', '0', '精诚团结', 'C:UsersdellDesktop', 'C:UsersdellDesktop', '以科技为向导，以智能为核心', '营业收入过百万', '100', '中国工商银行', '中国环境保护产业骨干企业', '智能开关', '大型活动策划', '国家质检总局', '设备先进', '模式创新', '资源联动，整合推进', '环境噪声与振动污染控制一直是环境保护工作关注的焦点之一，也成为我国环境保护产业发展的热点', '未来五年服务面积覆盖全国', '购买原材料', '中雅机电视野有限公司成立于1995年，在北京、上海、杭州等地设有分支机构和办事处。', '在各大城市都设有分厂', '2000', '大连分公司', '辽宁省驻外省办事处');
INSERT INTO `company` VALUES ('company2', '694940443@qq.com', '123', '98765432-02', '亚洲风影视传媒有限公司', '1', '200000', '987654321123456', '陈慧冰', '2013-01-03', 'http://www.coach.com/default', '天津', '沈阳', '7256002', '工业', '工业', '1', '万众一心', 'C:UsersdellDesktop', 'C:UsersdellDesktop', '以实用为目标', '总资产过千万', '50', '中国建设银行', '吸声体外观专利', '文化传媒', '新闻采访及新闻采编', '国家质检总局', '设备先进', '系统完善', '资源联动，整合推进', '亚洲风少儿电视艺术团，致力于儿童综合素质培养及少儿才艺节目的研发与创作。', '未来五年服务面积覆盖全亚洲', '引进新设备', '亚洲风影视传媒有限公司成立于1980年，在技术上不断突破和创新，是国内最具有影响力的影视传媒公司。', '在各大城市都设有分厂', '3000', '大连分公司', '辽宁省驻外省办事处');
INSERT INTO `company` VALUES ('company3', '260024036@qq.com', '123', '23456789-03', '星尘财富投资有限公司', '2', '300000', '123456789345678', '朱浩天', '2013-01-04', 'http://china.coach.com/', '葫芦岛', '承德', '7256003', '商业', '商业', '2', '具有荣誉感', 'C:UsersdellDesktop', 'C:UsersdellDesktop', '用专业铸就品牌', '净利润过百万', '70', '中国农业银行', '阵列式消声器发明专利', '金融投资', '设备租赁', '国家质检总局', '设备先进', '商圈锁定', '资源联动，整合推进', '大力发展电子商务已经引起高层重视。', '未来五年服务面积覆盖全世界', '招聘新人才', '星尘财富投资有限公司成立于2005年，自成立以来多次获得省级以上荣誉，主键发展为具有一定英雄里的品牌。', '在各大城市都设有分厂', '3500', '大连分公司', '辽宁省驻外省办事处');

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `id` varchar(32) NOT NULL,
  `signTime` datetime NOT NULL COMMENT '签约时间',
  `firstId` varchar(32) NOT NULL COMMENT '甲方id',
  `secondId` varchar(32) NOT NULL COMMENT '乙方id',
  `firstName` varchar(50) NOT NULL COMMENT '甲方名称',
  `secondName` varchar(50) NOT NULL COMMENT '乙方名称',
  `path` varchar(50) NOT NULL COMMENT '合同路径',
  `stockCreditorId` varchar(32) NOT NULL COMMENT '指向股债权的外键',
  `state` int(11) NOT NULL COMMENT '状态，编辑是否完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contract
-- ----------------------------
INSERT INTO `contract` VALUES ('contract1', '2015-04-02 00:00:00', 'investor1', 'company1', '中雅机电视野有限公司', '万胜宇家具有限公司', 'C:UsersdellDesktop', 'product1', '0');
INSERT INTO `contract` VALUES ('contract2', '2015-04-03 00:00:00', 'investor1', 'company2', '亚洲风影视传媒有限公司', '左右家私有限公司', 'C:UsersdellDesktop', 'product2', '1');
INSERT INTO `contract` VALUES ('contract3', '2015-04-04 00:00:00', 'investor2', 'company3', '星尘财富投资有限公司', '四德电子科技有限公司', 'C:UsersdellDesktop', 'product3', '0');

-- ----------------------------
-- Table structure for financedata
-- ----------------------------
DROP TABLE IF EXISTS `financedata`;
CREATE TABLE `financedata` (
  `id` varchar(32) NOT NULL,
  `companyId` varchar(32) NOT NULL COMMENT '指向公司id的外键',
  `totalAsset` int(11) NOT NULL COMMENT '资产总额',
  `averTotalAsset` int(11) NOT NULL COMMENT '平均资产总额',
  `flowAsset` int(11) NOT NULL COMMENT '流动资产',
  `sellIncome` int(11) NOT NULL COMMENT '销售收入',
  `bussinessCost` int(11) NOT NULL COMMENT '营业成本',
  `majorBussinessIncome` int(11) NOT NULL COMMENT '主营业务收入净额',
  `finalReceivables` int(11) NOT NULL COMMENT '期末应收账款',
  `totalDebt` int(11) NOT NULL COMMENT '负债总额',
  `ownerEquity` int(11) NOT NULL COMMENT '所有者权益总额',
  `flowDebt` int(11) NOT NULL COMMENT '流动负债',
  `currentSaleIncome` int(11) NOT NULL COMMENT '当期销售净收入',
  `currentRevenue` int(11) NOT NULL COMMENT '当期现销收入',
  `preReceivables` int(11) NOT NULL COMMENT '期初应收账款余额',
  `profit` int(11) NOT NULL COMMENT '利润额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of financedata
-- ----------------------------
INSERT INTO `financedata` VALUES ('data1', 'company1', '100', '200', '300', '400', '500', '600', '700', '800', '900', '1000', '1100', '1200', '1300', '1400');
INSERT INTO `financedata` VALUES ('data2', 'company2', '200', '300', '400', '500', '600', '700', '800', '900', '1000', '1100', '1200', '1300', '1400', '1500');
INSERT INTO `financedata` VALUES ('data3', 'company3', '300', '400', '500', '600', '700', '800', '900', '1000', '1100', '1200', '1300', '1400', '1500', '1600');

-- ----------------------------
-- Table structure for information
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information` (
  `id` varchar(32) NOT NULL,
  `flag` int(1) NOT NULL COMMENT '标记文件类型0是中心公告，1是私募債列表，2是备案发行公告，3是转让交易报告，4是定期报告，5是临时报告，6是信用报告，7政策资讯，8是市场咨询',
  `fileName` varchar(50) NOT NULL COMMENT '文件名称，用来搜索',
  `path` varchar(255) NOT NULL COMMENT '文件路径',
  `investorId` varchar(32) DEFAULT NULL COMMENT '指向投资者的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of information
-- ----------------------------
INSERT INTO `information` VALUES
  ('0082CDF856DE458AB91A0F0892B76AE8', 0, '关于广东三九军大生物科技有限公司终止挂牌的公告.txt', '14BE4DE2DF86487381755A98D6A69377.txt', NULL),
  ('02C726E3D47049D4A09517A9EA253F91', 6, '关于对广东明家科技股份有限公司的重组问询函.pdf', 'F14784AF4BF048C3AE2F62B2106C189D.pdf', NULL),
  ('0A0E9643623641BA83D783C6C8E283FE', 7, '税务总局：金融企业涉农贷款和中小企业贷款损失扣除条件放宽 .pdf', '88D0EBC6160A4AF4859676FA3DA5ADD8.pdf', NULL),
  ('0B0E04B02D384A6EA9DE91B79539DD21', 4, '宁夏金竹柳园林绿化股份有限公司2015年度中期报告最终版.pdf', 'CA85F89B9AD94C0FA4246063B068AC9D.pdf', NULL),
  ('0B97AA3AD171452EAFB04C7009F6BC1F', 0, '关于2015年春节休市安排的通知.txt', '46F35F048FC44C01835E4CC84D31460A.txt', NULL),
  ('0C873383955042839B74E52E80A8B478', 6, '关于对骅威科技股份有限公司的组问询函.pdf', 'A0C0C3B5C3E44FFA87E81FCABCF414DA.pdf', NULL),
  ('115616E1B70E431DB2AE8438DFE937BF', 7, '安徽省科技型中小企业私募债券融资及风险_谢婷婷.pdf', 'B927A322386F443EA570ED819434919E.pdf', NULL),
  ('1BFE0BF9D1F54D4C902BE1034A5824C9', 2, '天津广成宏盛基础设施投资有限公司2015年宏盛1号私募债券（第一期）发行结果公告.pdf', '010DD766D01E45BC8FBBF9A29EA88C84.pdf', NULL),
  ('1D503BDE83CE444BA7832C81D0CEE7DB', 0, '关于2015年端午节休市安排的通知.txt', '519F3DBE65434949A04BC3AB2827466D.txt', NULL),
  ('1DA1C894F9BB41A39207B12D14BD4203', 3, '普定工业投资开发有限责任公司2014年私募债券（第五期）转让服务公告.pdf', 'D25E03DC0EF24755A68A0EB38D148FC5.pdf', NULL),
  ('226B9E36378D45B29242391D84BAD11B', 5, '天津华泰森淼生物工程技术股份有限公司关于延期披露2015年中期报告的公告.pdf', '4EEF29D7E9C7447382B3DDAF209971B7.pdf', NULL),
  ('28F3D6BBA96E48A1A0D505DF6100B17E', 0, '关于2015年劳动节休市安排的通知.txt', '78E3EE2020624136BC03307B088B1610.txt', NULL),
  ('2C5A7617AE894CD38CADD330844A6868', 3, '2014年私募债券（选择权第五期）转让服务公告.pdf', '2A45AD2C4E5A44E18E74F01901489501.pdf', NULL),
  ('2D883D23FCC242B686E8AE6BD5635FC7', 6, '关于对北大医药股份有限公司的重组询问函.pdf', 'AF950C877F9B4A65B0AE15E892B6CB26.pdf', NULL),
  ('2E4C038B6B144035BB940F3870A4678C', 5, '山东沃特管业股份有限公司关于2015年第三次临时股东大会决议公告的更正公告.pdf', '797533BC25A04D73B0260D778C1CA935.pdf', NULL),
  ('33C33BCE06014C0090E2884739ED1F5B', 7, '关于中国农业银行三农金融事业部涉农贷款营业税优惠政策的通知.pdf', 'F094E29F785F4805AD3CFEE2A5A16468.pdf', NULL),
  ('3ECDB941778A43198ED1C9257A95696E', 4, '宁夏贺兰山万家农业科技股份有限公司2015年度中期报告.pdf', 'CDAB4D7AC6FD456493F23C4BFED54999.pdf', NULL),
  ('3F5E814BDE9645608617DACE3C9963DC', 8, '兖州煤业高管增持超10万股 拟投资超23亿建煤矿.pdf', 'DD1BEC803D2443BFA9622107AF0E219E.pdf', NULL),
  ('436ECD8365884192BE73AB0E32C28DD8', 3, '非公开发行2014年私募债券（选择权第三期）转让服务公告.pdf', 'B020FD0C76CF4767AB3091389EDE7EE4.pdf', NULL),
  ('45565C95D755429E91B26D7CE22FAC8C', 4, '邢台美的客食品股份有限公司2015年度中期报告.pdf', 'FE43A8B3DFB24E70A9E05A4FE8E1F658.pdf', NULL),
  ('48EBAE9D49F54CB8B52D4F9DD46495F4', 3, '天津东丽湖建设发展有限公司2015年建发2号私募债券（第二期）转让服务公告.pdf', '0D7081F4C9864322A2F0DB82B01512E4.pdf', NULL),
  ('4E0770C8A82340D789839A9F05A0343D', 5, '榆缆线缆集团股份有限公司关于董事变更的公告.pdf', '6ACB6A6FDDDB43E586242FF7FF0F3975.pdf', NULL),
  ('515F88F199064BC49E554F1C3EA16DF1', 2, '成都花园水城城乡建设投资非公开发行2014年私募债券（第四期）发行结果公告.pdf', '69474E402ECF421CA5F970954225CACD.pdf', NULL),
  ('55D6BE0CD0AB4EC89C2476D91DC5AE70', 8, '红蜻蜓等6只新股周一上市定位分析 .pdf', '9DAE7E8C25444371A9108B89FD59974F.pdf', NULL),
  ('6072A626AA6247BB8B9C351AF7948DDC', 2, '成都集装箱物流投资开发有限公司2015年集装箱8号私募债券（第一期）发行结果公告.pdf', '209BA3948D564270AC1A492303B5C428.pdf', NULL),
  ('6A6ECA33684540E6AD9BE7A5E7551ED9', 4, '河北同聚祥商贸股份有限公司2015年度中期报告.pdf', '4DDDD40D29E449A1B9021760B0FCD44D.pdf', NULL),
  ('6AF9F09A8A3F43788AE34993EF685545', 6, '绵世股份承诺事项及履行情况详情.pdf', '1E92346722AB4E11ACF9CCC5327B2D97.pdf', NULL),
  ('6BBE7B3DD7124274BBA9F17DBCE98347', 0, '广州股权交易中心关于表彰2014年度优秀会员的决定.txt', '90F4A2B06F5F49EABCD8ECDA22C8C230.txt', NULL),
  ('6F4572639EF445A19853FD8C6E5DD4A5', 2, '深圳正威（集团）有限公司2015年私募债券1号发行结果公告（第二期）.pdf', '9D1A1560DF08477BA175E0BC663F4869.pdf', NULL),
  ('6FB96A4C27CB4BDE8D5C4B12F3912D32', 4, '河北同聚祥商贸股份有限公司2015年度中期报告.pdf', '5A38A88482F14921B2C90C9A9832244D.pdf', NULL),
  ('719AEB3D98954450A472AF6582F48BAE', 0, '关于广州建成工程咨询股份有限公司暂停股份转让的公告.txt', '9E2CDE920B3E46A8915BBD3BC0D0EB12.txt', NULL),
  ('74A924F86CFD41599FBF0563F9FA5333', 2, '普定工业投资开发有限责任公司2014年私募债券（第四期）发行结果公告.pdf', 'E68E6D9D2DFB49F7AF3ECAA4C4A4A89E.pdf', NULL),
  ('753550C7E6E5468DAFA5F237CBD417DC', 6, '关于对万泽实业股份有限公司的重组问询函.pdf', 'BF0B87CCEA5344869C69A276138203A0.pdf', NULL),
  ('7D5D37B4B8EC4C828A6B08840FBA9617', 6, '关于对中水渔业重组报告书补充披露意见的函.pdf', '79B015D6B11B4FF7B15C1EA0484C552D.pdf', NULL),
  ('7E0A38E448D34EADAD94F3423A0C0770', 7, '两部门明确农行三农金融事业部涉农贷款营业税优惠政策 .pdf', 'BE0F4C901FDE4187BDED38FB272A9AFB.pdf', NULL),
  ('855BACAE1C5D4E82A5929702573F1CF2', 2, '天津广成宏盛基础设施投资有限公司2015年宏盛1号私募债券（第二期）发行结果公告.pdf', 'D6A291800E9C4BBFAAFC4C1A7D1F8869.pdf', NULL),
  ('856AC5534E8A44FFA54054C04C86A403', 3, '关于深圳正威（集团）有限公司2015年私募债券1号（第二期）转让服务公告.pdf', '5E15C30D72434F4EB76202DDB78246B0.pdf', NULL),
  ('89325524BA654DEC83AC007B86567B23', 8, '工行与泛欧交易所开展战略合作 .pdf', '54F2CDB17C3144D58FDBB4EB4A489A7D.pdf', NULL),
  ('8A324F3223D44D298E0C03FD0DC50A48', 5, '广西至鑫门业股份有限公司关于延期披露三会公告的说明2015.9.7.pdf', '1AF9F6096EB34CF092C9DAF9E3BF6256.pdf', NULL),
  ('8D427BBE034F47688810FA244F0C5BF8', 2, '深圳正威（集团）有限公司2015年私募债券1号发行结果公告（第一期）.pdf', '5327018B89D0447282F654C35BE70F10.pdf', NULL),
  ('904C5FCA477841EBA4D96D6DC53DD6CC', 4, '许昌永新电气股份有限公司2015年度中期报告.pdf', '3A7AD978427049C9B1628885ACFD0C30.pdf', NULL),
  ('94911DEF21454D058F2C4E4927682F91', 5, '无锡乐天市政工程股份有限公司关于延期披露2015年中期报告的说明.pdf', '0323EF3B4C1C4B2D9981D1C9C2F11518.pdf', NULL),
  ('954F158E90C5410D88E911825B42EE6D', 2, '普定工业投资开发有限责任公司2014年私募债券（第五期）发行结果公告.pdf', '1A80F295B43E454E93F52B4FA8C38DA4.pdf', NULL),
  ('9570B9BD4E744BD6AA5FAF4233AA55B3', 5, '山东通力五金机电股份有限公司关于监事会主席辞职的公告(20150901).pdf', 'D9604BA8650743D9BD2ECD60DF65AB56.pdf', NULL),
  ('99F7A765D7614F4D98C82C05BC75990C', 5, '天同宏基集团股份有限公司关于副总经理辞职的公告(20150906).pdf', 'B645EFAF42C3463D93F416467E28E1C8.pdf', NULL),
  ('9BC915861F9B487B873804FB3BFAE8D2', 3, '天津广成宏盛基础设施投资有限公司2015年宏盛2号私募债券转让服务公告.pdf', '5E9D980F0E424B6693421B70EC537B6F.pdf', NULL),
  ('9FA01C6949CA4911B487F9BB59D02E07', 3, '普定工业投资开发有限责任公司2014年私募债券（第四期）转让服务公告.pdf', '2925099ACF8842DE96E41B1635390BE7.pdf', NULL),
  ('A82FD3A7B4054F4382CAA63BB14131EB', 6, '神州信息承诺事项及履行情况详情.pdf', 'F745EC856E0849A7BB808EB8552F7BB6.pdf', NULL),
  ('A8C21DB765F84934AEC7659126DE45A0', 8, '理财产品发行量维持平稳.pdf', 'AB486C147FCF400F8FD3E80CE85C9204.pdf', NULL),
  ('AA0B360DBAE74552A941190B3A85848E', 8, '赛升药业等3只新股周三申购指南 顶格需83.4万元.pdf', '78AE5107FEA8415894D4D4FDF2DB2C66.pdf', NULL),
  ('AC845D5CC16342E3B038E7C13C92FB35', 8, '2015年上半年社会融资规模增量8.81万亿元 .pdf', '658ACBF1382241D6876FA3F5E19BF1CA.pdf', NULL),
  ('B432B6879701491583DE3A16C35D7890', 3, '天津东丽湖建设发展有限公司2015年建发2号私募债券（第一期）转让服务公告.pdf', '57449D6ED7424983A00BBF934BB89EF6.pdf', NULL),
  ('B7081EE616EE4B06BEB02D30AD5F0956', 6, '《关于对广东省高速公路发展股份有限司的重组问询函》 的回复.pdf', 'AD9AA4915D5F4FC08744B79A4C85B125.pdf', NULL),
  ('BBCFA1C653EE4042A7CB58915368DA81', 6, '关于对宁波慈星股份有限公司的年报问询函.pdf', '8991E3D4F27D4D4B8653666560545E33.pdf', NULL),
  ('BDA605F90C3B4C0D91DCA8EF40625FAF', 8, '3家专业互联网保险公司获批筹建保险机构员工持股正式开闸 .pdf', '5B57C2D21CB74DF8A49C8E6303E0A365.pdf', NULL),
  ('C428A7C3267C438D808C9F939CC2F703', 0, '广州股权交易中心关于组织召开第一届审委会2015年第十九次会议的公告.txt', 'C07ED1F0A7A140D2BD0B48520526A7D2.txt', NULL),
  ('C82B97F192DD4B21943A01B4BBCD0974', 7, '《私募投资基金监督管理暂行办法》（证监会令[105]号）.pdf', 'FE0AA406C5E74E19911442D4A4988F2D.pdf', NULL),
  ('CCAEA8F3534346689CA3A0905E8EB30E', 4, '河北旺四方种业股份有限公司2015年中期报告.pdf', '80FE3AECD09640009DD9C8B2BDFB5BB4.pdf', NULL),
  ('CF76277F403149FCA2C7D8F8D944DE09', 5, '河北益民五金制造股份有限公司关于暂停定期报告信息披露的公告.pdf', 'A87F2AAEF9214E928599AD65AB260B42.pdf', NULL),
  ('D5E8B1C0B9ED4491BC5D121B7DFCA451', 4, '滨河建筑安装工程股份有限公司2015年度中期报告.pdf', 'B7340C627CB2443CB9BCE84E3A16F01B.pdf', NULL),
  ('D7425DD426D148F9BB223DE5C3FEA7A5', 4, '宁夏白浪包装股份有限公司2015年度中期报告.pdf', '7DFA28F68DEA48CD84DF796249B28DC1.pdf', NULL),
  ('DB6952112AB6464E9F817A893344F544', 5, '苏州市建筑装饰股份有限公司关于2014年度分红派息公告（20150906）.pdf', '83F814271ABE4022B190DFB33A00627B.pdf', NULL),
  ('DBE685B6F9384682A96BCC7D06F9CA6B', 2, '瓮安县工业园区投资开发有限责任公司2014年私募债券（第三期）发行结果公告.pdf', '6656FA4F5C98490E9EDA1BCD15FA0D82.pdf', NULL),
  ('DD00458B89694EFE9C4CB7775853ADF9', 0, '关于2015年清明节休市安排的通知.txt', '3EFF0FA1763C4B74841925C42C6815F5.txt', NULL),
  ('DD6E7BF595264138A16F400B3167211D', 0, '关于百城传媒和域码网络终止挂牌的公告.txt', 'A4DA311A0B77473A819ED02F811461D2.txt', NULL),
  ('E2938594F8FB42A1B8558F324A469C4B', 3, '关于深圳正威（集团）有限公司2015年私募债券1号（第一期）转让服务公告.pdf', 'FF63C03A0B964AE989097031E6D8CD2B.pdf', NULL),
  ('E656324227F24A3F8A829344FD4BF37D', 8, '德隆系前高管操盘 深圳惠程证券投资收益剧增.pdf', '4F7309241D4B445A8BAC0950F9B7D928.pdf', NULL),
  ('E8E385783B4F447AA7B5DF0185BFBE07', 2, '双鸭山市大地城市建设开发投资有限公司2015年私募债券（第七期）发行结果公告.pdf', '83E8FA6DD0034E6997D6246540B65A4A.pdf', NULL),
  ('F0D326DF686E4BA880787D32E0B4A9A0', 3, '5 转让服务公告（14大地34）.pdf', 'DB72735073E94DFEA24422377D360034.pdf', NULL),
  ('F48931201A1D4DBFA22027823D3575AA', 0, '关于继续暂停广东百城传媒股份有限公司股份转让的公告.txt', '490A20915C1D4E009FED4FB339AB9F9B.txt', NULL),
  ('FE65D6FDF1F24DA49785545A48B7356F', 8, '方正证券被证监会立案调查 涉嫌信息披露违规.pdf', 'E8E5890DD67D4EA1AF6ABBBC535E88CC.pdf', NULL);
-- ----------------------------
-- Table structure for investor
-- ----------------------------
DROP TABLE IF EXISTS `investor`;
CREATE TABLE `investor` (
  `investorId` varchar(32) NOT NULL COMMENT '投资人id',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `investorName` varchar(20) DEFAULT NULL COMMENT '投资人名称',
  `fundBody` int(10) DEFAULT NULL COMMENT '资金主体，0为个人资金，1为企业资金，2为天使投资，3为VC投资，4为PE投资，5为小额贷款，6为典当公司，7为担保公司，8为金融租赁，9为投资公司，10为商业银行，11为基金公司，12为证券公司，13为信托公司，14为资产管理，15为其它资金',
  `companyName` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `companyCode` varchar(50) DEFAULT NULL COMMENT '公司代码',
  `address` varchar(50) DEFAULT NULL COMMENT '公司地址',
  `registeredCapital` int(11) DEFAULT NULL COMMENT '注册资本',
  `legalRepresentative` varchar(50) DEFAULT NULL COMMENT '法定代表人信息',
  `legalRepresentativeMandator` varchar(50) DEFAULT NULL COMMENT '法定代表人委托人信息',
  `companyScale` varchar(50) DEFAULT NULL COMMENT '公司规模',
  `totalMoney` int(11) DEFAULT NULL COMMENT '拥有资金额',
  `consultPhone` varchar(50) DEFAULT NULL COMMENT '联系方式',
  `companyArea` varchar(50) DEFAULT NULL COMMENT '公司所在地区',
  `investArea` varchar(50) DEFAULT NULL COMMENT '投资地区',
  `investField` varchar(50) DEFAULT NULL COMMENT '投资领域',
  `investStage` varchar(20) DEFAULT NULL COMMENT '投资阶段,0为种子阶段，1为初创阶段，2为拓展前阶段，3为拓展后阶段，4为Pre-IPO',
  `investPeriod` varchar(50) DEFAULT NULL COMMENT '投资周期',
  `investIndustry` varchar(50) DEFAULT NULL COMMENT '投资行业',
  `investMoney` int(11) DEFAULT NULL COMMENT '投资意向金额',
  `investType` varchar(50) DEFAULT NULL COMMENT '投资类型',
  `material` varchar(50) DEFAULT NULL COMMENT '所需材料',
  `investHistory` varchar(50) DEFAULT NULL COMMENT '投资历史',
  `successCase` varchar(50) DEFAULT NULL COMMENT '达成案例',
  `investPreference` int(1) DEFAULT NULL COMMENT '投资偏好，0为传统型，1为前瞻型，2为稳健型，3为新兴型，4为热点型，5为其它',
  `shareholderBackground` varchar(50) DEFAULT NULL COMMENT '股东背景',
  `managedFund` varchar(50) DEFAULT NULL COMMENT '管理基金',
  `logoPath` varchar(255) DEFAULT NULL COMMENT 'logo路径',
  `baseAddress` varchar(50) DEFAULT NULL COMMENT '总部地址',
  `c_position` varchar(20) DEFAULT NULL COMMENT '职位',
  PRIMARY KEY (`investorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of investor
-- ----------------------------
INSERT INTO `investor` VALUES ('investor1', 'liwangadd@gmail.com', 'liwang', '李旺', '0', '大连理工大学', '12345678-09', '大连金州区', '10000', '王森淼', '田熙颖', '2000人', '10000000', '18840801234', '北京', '大连', '电子', '0', '2', '电子', '100000', '0', '商业计划书、相关财务资料', '2014年7月投资中雅机电视野有限公司', '2014年7月投资中雅机电视野有限公司成功', '0', '背景雄厚', '企业资金', '38A9A6C44DBB409298922DB1169666D9.jpg', '北京', 'CEO');
INSERT INTO `investor` VALUES ('investor2', 'liuhaoadd@gmail.com', 'liuhao', '刘浩', '1', '大连理工大学', '98765432-10', '大连金州区', '10000', '田熙颖', '王森淼', '3000人', '25000000', '18840804321', '上海', '大连', '电子', '1', '2', '电子', '100000', '1', '项目计划书、公司证件', '2013年9月投资亚洲风影视传媒有限公司', '2013年9月投资亚洲风影视传媒有限公司成功', '1', '背景雄厚', '个人基金', '38A9A6C44DBB409298922DB1169666D9.jpg', '北京', 'CEO');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` varchar(32) NOT NULL,
  `time` date NOT NULL COMMENT '时间',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `userId` varchar(32) DEFAULT NULL,
  `otherId` varchar(32) DEFAULT NULL,
  `flag` int(1) NOT NULL COMMENT '0代表系统消息，1代表私信',
  `status` int(1) DEFAULT NULL COMMENT '0是未读，1是已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('message1', '2015-09-01', '昨天发给您的文件收到了吗？', 'investor1', 'company1', '0', '1');
INSERT INTO `message` VALUES ('message2', '2015-09-02', '嗯，收到了。', 'investor2', 'company2', '0', '1');
INSERT INTO `message` VALUES ('message3', '2015-09-03', '那您觉得这个方案怎么样呢？', 'investor3', 'company3', '0', '1');
INSERT INTO `message` VALUES ('message4', '2015-09-04', '还不错，挺有创意的。', 'investor4', 'company4', '0', '1');

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('1', '张三', '20');

-- ----------------------------
-- Table structure for stockcreditor
-- ----------------------------
DROP TABLE IF EXISTS `stockcreditor`;
CREATE TABLE `stockcreditor` (
  `id` varchar(32) NOT NULL,
  `productName` varchar(255) NOT NULL COMMENT '股债权名字',
  `investArea` varchar(50)  COMMENT '投资区域',
  `investIndustry` varchar(50)  COMMENT '投资行业',
  `createTime` date  COMMENT '股债权创建时间',
  `investMoney` int(11)  COMMENT '投资金额',
  `investTime` int(11)  COMMENT '投资年限',
  `productType` VARCHAR(50)  COMMENT '产品类型，1为股权，2为债权',
  `stockRate` varchar(50) DEFAULT NULL COMMENT '参股比例',
  `investStage` varchar(50) DEFAULT NULL COMMENT '投资阶段,0为种子阶段，1为初创阶段，2为拓展前阶段，3为拓展后阶段，4为Pre-IPO',
  `leastReturnDemand` varchar(50) DEFAULT NULL COMMENT '最低要求回报',
  `riskControlDemand` VARCHAR(50) DEFAULT NULL COMMENT '风险控制要求，0为抵押，1为担保，2为协议，3为质押，4为留置',
  `demandFile` varchar(50) DEFAULT NULL COMMENT '要求文件',
  `demandSummarize` varchar(50) DEFAULT NULL COMMENT '投资要求概述',
  `creditRank` int(1) DEFAULT NULL COMMENT '信用等级，0为AAA，1为AA，2为A，3为BBB，4为BB，5为B，6为CCC，7为CC，8为C',
  `fundBody` VARCHAR(50)  COMMENT '资金主体，0为个人资金，1为企业资金，2为天使投资，3为VC投资，4为PE投资，5为小额贷款，\r\n  6为典当公司，7为担保公司，8为金融租赁，9为投资公司，10为商业银行，11为基金公司，12为证券公司，13为信托公司，14为资产管理，15为其它资金',
  `flag` int(1)  COMMENT '标记，0为企业模式，1为投资者模式',
  `userId` varchar(32) NOT NULL COMMENT '关联用户外键',
  `exitWay` VARCHAR(200) COMMENT '投资退出方式 ',
  `exitMinTime` INT COMMENT '最短退出年限',
  `bondsman` VARCHAR(200) COMMENT '担保方',
  `investmentMinRequest` INT COMMENT '投资门槛',
  `minAddto` INT COMMENT '最低追加资金',
  `backWay` INT COMMENT '还本付息方式',
  `moneyFrom` INT COMMENT '还款来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stockcreditor
-- ----------------------------
INSERT INTO `stockcreditor` VALUES ('product1', '星尘财富投资有限公司第1期私募债', '大连', '工业', '2015-01-03', '20000', '2', '1', '30%', '0', '12%年', '0', '商业计划书', '要求项目真实可靠，能达到预期的利润，企业有稳定的财务收入。', '0', '1', '0', 'investor1', '股权转让', '1', '中国工商银行', '1000', '500', '1', '1');
INSERT INTO `stockcreditor` VALUES ('product2', '亚洲风影视传媒有限公司第2期私募股权', '沈阳', '医药业', '2015-01-04', '30000', '3', '2', '40%', '1', '10%年', '1', '项目计划书', '业务仅限于上海市范围以内，抵押物为住宅、别墅、商铺、办公楼宇。', '1', '2', '0', 'investor2', '股份回购', '2', '中国建设银行', '2000', '1000', '1', '1');
INSERT INTO `stockcreditor` VALUES ('product3', '中雅机电视野有限公司第3期私募债', '承德', '采矿业', '2015-01-05', '40000', '4', '1', '50%', '2', '15%年', '2', '相关财务资料', '上海某企业资金1000万-7000万提供短期债权融资服务，要求公司经营良好。', '2', '3', '1', 'investor1', '股权转让', '3', '中国农业银行', '1500', '1000', '1', '1');
-- ----------------------------
-- Table structure for `asset`
-- ----------------------------
DROP TABLE IF EXISTS `asset`;
CREATE TABLE `asset` (
  `id` varchar(32) NOT NULL,
  `publishedTime` int(10) DEFAULT NULL COMMENT '发布时长',
  `limit` varchar(32) DEFAULT '' COMMENT '期限',
  `condition` varchar(20) DEFAULT NULL COMMENT '目前状况',
  `type` int(1) DEFAULT NULL COMMENT '1是股权，2是债权',
  `radio` varchar(100) DEFAULT NULL COMMENT '融资占比',
  `name` varchar(200) DEFAULT NULL COMMENT '产品名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asset
-- ----------------------------
INSERT INTO `asset` VALUES ('0', '1', '1年', '1000万', '1', '刘浩购买了300万', '北方债券');
INSERT INTO `asset` VALUES ('1', '15', '2年', '2500万', '1', '王肖购买了500万，马骏辉购买了1000万', '北方债券');
INSERT INTO `asset` VALUES ('10', '18', '2年', '1900万', '2', '杨磊购买了1000万', '北方债券');
INSERT INTO `asset` VALUES ('2', '2', '2年', '1200万', '1', '赵京木购买了200万', '北方债券');
INSERT INTO `asset` VALUES ('3', '3', '2年', '1300万', '1', '李旺购买了450万', '北方债券');
INSERT INTO `asset` VALUES ('4', '7', '1年', '1000万', '1', '王森淼购买了200万', '北方债券');
INSERT INTO `asset` VALUES ('5', '2', '1年', '1500万', '2', '杨磊购买了200万', '北方债券');
INSERT INTO `asset` VALUES ('6', '1', '3年', '5000万', '2', '李旺购买了1000万', '北方债券');
INSERT INTO `asset` VALUES ('7', '2', '3年', '2000万', '2', '马骏辉购买了100万', '北方债券');
INSERT INTO `asset` VALUES ('8', '3', '2年', '1600万', '2', '刘宇购买了200万', '北方债券');
INSERT INTO `asset` VALUES ('9', '7', '2年', '1800万', '2', '赵京木购买了1000万', '北方债券');





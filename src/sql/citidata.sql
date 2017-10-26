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
INSERT INTO `appointment` VALUES ('aa', 'aa', 'aa', '马朝辉', '7247001', '2015-01-02', '2015-02-01', '2015-03-01', '0');
INSERT INTO `appointment` VALUES ('bb', 'bb', 'bb', '马云则', '7247002', '2015-01-03', '2015-02-02', '2015-03-02', '0');
INSERT INTO `appointment` VALUES ('cc', 'cc', 'cc', '马腾飞', '7247003', '2015-01-04', '2015-02-03', '2015-03-03', '0');
INSERT INTO `appointment` VALUES ('dd', 'dd', 'dd', '苗翰林', '7247004', '2015-01-05', '2015-02-04', '2015-03-04', '0');
INSERT INTO `appointment` VALUES ('ee', 'ee', 'ee', '孟世霞', '7247005', '2015-01-06', '2015-02-05', '2015-03-05', '0');
INSERT INTO `appointment` VALUES ('ff', 'ff', 'ff', '孟华帅', '7247006', '2015-01-07', '2015-02-06', '2015-03-06', '0');
INSERT INTO `appointment` VALUES ('gg', 'gg', 'gg', '梦雨轩', '7247007', '2015-01-08', '2015-02-07', '2015-03-07', '0');
INSERT INTO `appointment` VALUES ('hh', 'hh', 'hh', '穆思琪', '7247008', '2015-01-09', '2015-02-08', '2015-03-08', '1');
INSERT INTO `appointment` VALUES ('ii', 'ii', 'ii', '毛海义', '7247009', '2015-01-10', '2015-02-09', '2015-03-09', '1');
INSERT INTO `appointment` VALUES ('jj', 'jj', 'jj', '明万里', '7247010', '2015-01-11', '2015-02-10', '2015-03-10', '1');
INSERT INTO `appointment` VALUES ('kk', 'kk', 'kk', '毛启生', '7247011', '2015-01-12', '2015-02-11', '2015-03-11', '1');
INSERT INTO `appointment` VALUES ('ll', 'll', 'll', '梅庆然', '7247012', '2015-01-13', '2015-02-12', '2015-03-12', '1');
INSERT INTO `appointment` VALUES ('mm', 'mm', 'mm', '潘益龙', '7247013', '2015-01-14', '2015-02-13', '2015-03-13', '1');

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
INSERT INTO `attention` VALUES ('aa', '1', '0', '1', 'a', 'a', 'n');
INSERT INTO `attention` VALUES ('bb', '1', '0', '1', 'b', 'b', 'o');
INSERT INTO `attention` VALUES ('cc', '1', '0', '1', 'c', 'c', 'p');
INSERT INTO `attention` VALUES ('dd', '1', '0', '1', 'd', 'd', 'q');
INSERT INTO `attention` VALUES ('ee', '1', '0', '1', 'e', 'e', 'r');
INSERT INTO `attention` VALUES ('ff', '1', '1', '1', 'f', 'f', 's');
INSERT INTO `attention` VALUES ('gg', '1', '1', '1', 'g', 'g', 't');
INSERT INTO `attention` VALUES ('hh', '2', '1', '1', 'h', 'h', 'u');
INSERT INTO `attention` VALUES ('ii', '2', '1', '0', 'j', 'i', 'v');
INSERT INTO `attention` VALUES ('jj', '2', '1', '0', 'k', 'j', 'w');
INSERT INTO `attention` VALUES ('kk', '2', '1', '0', 'l', 'k', 'x');
INSERT INTO `attention` VALUES ('ll', '2', '1', '0', 'y', 'l', 'y');
INSERT INTO `attention` VALUES ('mm', '2', '1', '0', 'n', 'm', 'z');

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
  `relatedMechanism` varchar(100) DEFAULT NULL COMMENT '相关机构',
  `ServiceAgency` varchar(100) DEFAULT NULL COMMENT '驻外办事机构',
  PRIMARY KEY (`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('a', '569603080@qq.com', 'a', 'aaaa', '中雅机电视野有限公司', '0', '100', '001', '程志文', '2013-01-02', 'http://www.fesco.com.cn', '北京', '大连', '7256001', '农业', '农业', '0', '精诚团结', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `company` VALUES ('b', '694940443@qq.com', 'b', 'bbbb', '亚洲风影视传媒有限公司', '0', '200', '002', '陈慧冰', '2013-01-03', 'http://www.coach.com/default', '天津', '沈阳', '7256002', '工业', '工业', '1', '万众一心', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `company` VALUES ('c', '260024036@qq.com', 'c', 'cccc', '星尘财富投资有限公司', '0', '300', '003', '朱浩天', '2013-01-04', 'http://china.coach.com/', '葫芦岛', '承德', '7256003', '保险业', '保险', '1', '具有荣誉感', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `company` VALUES ('d', '707611428@qq.com', 'd', 'dddd', '华荣包装材料有限公司', '1', '400', '004', '曹正国', '2013-01-05', 'http://mall.jd.com/index-1000002971.html', '唐山', '鞍山', '7256004', '采矿业', '采矿', '2', '具有责任感', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `company` VALUES ('e', '540561063@qq.com', 'e', 'eeee', '移商网信息技术有限公司', '1', '500', '005', '常文君', '2013-01-06', 'http://www.prada.com/', '沧州', '沧州', '7256005', '能源业', '能源', '3', '具有使命感', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `company` VALUES ('f', '793516568@qq.com', 'f', 'ffff', '爱茉莉时装有限公司', '1', '600', '006', '岑雨桐', '2013-01-07', 'http://www.prada.com/hans', '廊坊', '盘锦', '7256006', '广告业', '广告', '4', '具有积极性', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `company` VALUES ('g', '280105138@qq.com', 'g', 'gggg', '万胜宇家具有限公司', '2', '700', '007', '常志强', '2013-01-08', 'http://store.prada.com/hans/CN', '衡水', '朝阳', '7256007', '教育业', '教育', '4', '具有主动性', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `company` VALUES ('h', '853339297@qq.com', 'h', 'hhhh', '左右家私有限公司', '2', '800', '008', '成金荣', '2013-01-09', 'http://www.louisvuitton.com/', '青岛', '锦州', '7256008', '金融业', '金融', '5', '具有创造行', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `company` VALUES ('i', '791088021@qq.com', 'i', 'iiii', '四德电子科技有限公司', '3', '900', '009', '穆红蕾', '2013-01-10', 'http://www.louisvuitton.cn/', '临汾', '长春', '7256009', '医疗业', '医疗', '6', '默契配合', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `company` VALUES ('j', '461913547@qq.com', 'j', 'jjjj', '绿洲食品有限公司', '3', '1000', '010', '崔福军', '2013-01-11', 'http://www.louisvuitton.fr/', '贵阳', '黑龙江', '7256010', '造纸业', '造纸', '7', '不计名利', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `company` VALUES ('k', '739195069@qq.com', 'k', 'kkkk', '仁和路达有限公司', '3', '1100', '011', '车东岳', '2013-01-12', 'http://www.coach.com/', '大连', '上海', '7256011', '出版业', '出版', '7', '同心协力', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `company` VALUES ('l', '595061094@qq.com', 'l', 'llll', '同盛纸业有限公司公司', '4', '1200', '012', '迟浩明', '2013-01-13', 'http://china.coach.com/', '石家庄', '广州', '7256012', '演艺业', '演艺', '7', '充满活力', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `company` VALUES ('m', '835928755@qq.com', 'm', 'mmmm', '威虎照明科技公司', '4', '1300', '013', '苍亦茹', '2013-01-14', 'http://www.coach.com/default', '张家口', '隆化', '7256013', '美容业', '美容', '8', '积极向上', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

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
INSERT INTO `contract` VALUES ('a', '2015-04-02 00:00:00', 'n', 'a', '中雅机电视野有限公司', '万胜宇家具有限公司', 'C:UsersdellDesktop', 'n', '0');
INSERT INTO `contract` VALUES ('b', '2015-04-03 00:00:00', 'o', 'b', '亚洲风影视传媒有限公司', '左右家私有限公司', 'C:UsersdellDesktop', 'o', '0');
INSERT INTO `contract` VALUES ('c', '2015-04-04 00:00:00', 'p', 'c', '星尘财富投资有限公司', '四德电子科技有限公司', 'C:UsersdellDesktop', 'p', '0');
INSERT INTO `contract` VALUES ('d', '2015-04-05 00:00:00', 'q', 'd', '华荣包装材料有限公司', '绿洲食品有限公司', 'C:UsersdellDesktop', 'q', '0');
INSERT INTO `contract` VALUES ('e', '2015-04-06 00:00:00', 'r', 'e', '移商网信息技术有限公司', '仁和路达有限公司', 'C:UsersdellDesktop', 'r', '0');
INSERT INTO `contract` VALUES ('f', '2015-04-07 00:00:00', 's', 'f', '爱茉莉时装有限公司', '同盛纸业有限公司公司', 'C:UsersdellDesktop', 's', '0');
INSERT INTO `contract` VALUES ('g', '2015-04-08 00:00:00', 't', 'g', '万胜宇家具有限公司', '威虎照明科技公司', 'C:UsersdellDesktop', 't', '1');
INSERT INTO `contract` VALUES ('h', '2015-04-09 00:00:00', 'u', 'h', '左右家私有限公司', '爱茉莉时装有限公司', 'C:UsersdellDesktop', 'u', '1');
INSERT INTO `contract` VALUES ('i', '2015-04-10 00:00:00', 'v', 'i', '四德电子科技有限公司', '移商网信息技术有限公司', 'C:UsersdellDesktop', 'v', '1');
INSERT INTO `contract` VALUES ('j', '2015-04-11 00:00:00', 'w', 'j', '绿洲食品有限公司', '华荣包装材料有限公司', 'C:UsersdellDesktop', 'w', '1');
INSERT INTO `contract` VALUES ('k', '2015-04-12 00:00:00', 'x', 'k', '仁和路达有限公司', '星尘财富投资有限公司', 'C:UsersdellDesktop', 'x', '1');
INSERT INTO `contract` VALUES ('l', '2015-04-13 00:00:00', 'y', 'l', '同盛纸业有限公司公司', '亚洲风影视传媒有限公司', 'C:UsersdellDesktop', 'y', '1');
INSERT INTO `contract` VALUES ('m', '2015-04-14 00:00:00', 'z', 'm', '威虎照明科技公司', '中雅机电视野有限公司', 'C:UsersdellDesktop', 'z', '1');

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
INSERT INTO `financedata` VALUES ('a', 'a', '100', '200', '300', '400', '500', '600', '700', '800', '900', '1000', '1100', '1200', '1300', '1400');
INSERT INTO `financedata` VALUES ('b', 'b', '200', '300', '400', '500', '600', '700', '800', '900', '1000', '1100', '1200', '1300', '1400', '1500');
INSERT INTO `financedata` VALUES ('c', 'c', '300', '400', '500', '600', '700', '800', '900', '1000', '1100', '1200', '1300', '1400', '1500', '1600');
INSERT INTO `financedata` VALUES ('d', 'd', '400', '500', '600', '700', '800', '900', '1000', '1100', '1200', '1300', '1400', '1500', '1600', '1700');
INSERT INTO `financedata` VALUES ('e', 'e', '500', '600', '700', '800', '900', '1000', '1100', '1200', '1300', '1400', '1500', '1600', '1700', '1800');
INSERT INTO `financedata` VALUES ('f', 'f', '600', '700', '800', '900', '1000', '1100', '1200', '1300', '1400', '1500', '1600', '1700', '1800', '1900');
INSERT INTO `financedata` VALUES ('g', 'g', '700', '800', '900', '1000', '1100', '1200', '1300', '1400', '1500', '1600', '1700', '1800', '1900', '2000');
INSERT INTO `financedata` VALUES ('h', 'h', '800', '900', '1000', '1100', '1200', '1300', '1400', '1500', '1600', '1700', '1800', '1900', '2000', '2100');
INSERT INTO `financedata` VALUES ('i', 'i', '900', '1000', '1100', '1200', '1300', '1400', '1500', '1600', '1700', '1800', '1900', '2000', '2100', '2200');
INSERT INTO `financedata` VALUES ('j', 'j', '1000', '1100', '1200', '1300', '1400', '1500', '1600', '1700', '1800', '1900', '2000', '2100', '2200', '2300');
INSERT INTO `financedata` VALUES ('k', 'k', '1100', '1200', '1300', '1400', '1500', '1600', '1700', '1800', '1900', '2000', '2100', '2200', '2300', '2400');
INSERT INTO `financedata` VALUES ('l', 'l', '1200', '1300', '1400', '1500', '1600', '1700', '1800', '1900', '2000', '2100', '2200', '2300', '2400', '2500');
INSERT INTO `financedata` VALUES ('m', 'm', '1300', '1400', '1500', '1600', '1700', '1800', '1900', '2000', '2100', '2200', '2300', '2400', '2500', '2600');

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
INSERT INTO `information` VALUES ('0082CDF856DE458AB91A0F0892B76AE8', '0', '关于广东三九军大生物科技有限公司终止挂牌的公告.txt', '14BE4DE2DF86487381755A98D6A69377.txt', null);
INSERT INTO `information` VALUES ('02C726E3D47049D4A09517A9EA253F91', '6', '关于对广东明家科技股份有限公司的重组问询函.pdf', 'F14784AF4BF048C3AE2F62B2106C189D.pdf', null);
INSERT INTO `information` VALUES ('0A0E9643623641BA83D783C6C8E283FE', '7', '税务总局：金融企业涉农贷款和中小企业贷款损失扣除条件放宽 .pdf', '88D0EBC6160A4AF4859676FA3DA5ADD8.pdf', null);
INSERT INTO `information` VALUES ('0B97AA3AD171452EAFB04C7009F6BC1F', '0', '关于2015年春节休市安排的通知.txt', '46F35F048FC44C01835E4CC84D31460A.txt', null);
INSERT INTO `information` VALUES ('0C873383955042839B74E52E80A8B478', '6', '关于对骅威科技股份有限公司的组问询函.pdf', 'A0C0C3B5C3E44FFA87E81FCABCF414DA.pdf', null);
INSERT INTO `information` VALUES ('115616E1B70E431DB2AE8438DFE937BF', '7', '安徽省科技型中小企业私募债券融资及风险_谢婷婷.pdf', 'B927A322386F443EA570ED819434919E.pdf', null);
INSERT INTO `information` VALUES ('1BFE0BF9D1F54D4C902BE1034A5824C9', '2', '天津广成宏盛基础设施投资有限公司2015年宏盛1号私募债券（第一期）发行结果公告.pdf', '010DD766D01E45BC8FBBF9A29EA88C84.pdf', null);
INSERT INTO `information` VALUES ('1D503BDE83CE444BA7832C81D0CEE7DB', '0', '关于2015年端午节休市安排的通知.txt', '519F3DBE65434949A04BC3AB2827466D.txt', null);
INSERT INTO `information` VALUES ('1DA1C894F9BB41A39207B12D14BD4203', '3', '普定工业投资开发有限责任公司2014年私募债券（第五期）转让服务公告.pdf', 'D25E03DC0EF24755A68A0EB38D148FC5.pdf', null);
INSERT INTO `information` VALUES ('28F3D6BBA96E48A1A0D505DF6100B17E', '0', '关于2015年劳动节休市安排的通知.txt', '78E3EE2020624136BC03307B088B1610.txt', null);
INSERT INTO `information` VALUES ('2C5A7617AE894CD38CADD330844A6868', '3', '2014年私募债券（选择权第五期）转让服务公告.pdf', '2A45AD2C4E5A44E18E74F01901489501.pdf', null);
INSERT INTO `information` VALUES ('2D883D23FCC242B686E8AE6BD5635FC7', '6', '关于对北大医药股份有限公司的重组询问函.pdf', 'AF950C877F9B4A65B0AE15E892B6CB26.pdf', null);
INSERT INTO `information` VALUES ('33C33BCE06014C0090E2884739ED1F5B', '7', '关于中国农业银行三农金融事业部涉农贷款营业税优惠政策的通知.pdf', 'F094E29F785F4805AD3CFEE2A5A16468.pdf', null);
INSERT INTO `information` VALUES ('3F5E814BDE9645608617DACE3C9963DC', '8', '兖州煤业高管增持超10万股 拟投资超23亿建煤矿.pdf', 'DD1BEC803D2443BFA9622107AF0E219E.pdf', null);
INSERT INTO `information` VALUES ('436ECD8365884192BE73AB0E32C28DD8', '3', '非公开发行2014年私募债券（选择权第三期）转让服务公告.pdf', 'B020FD0C76CF4767AB3091389EDE7EE4.pdf', null);
INSERT INTO `information` VALUES ('48EBAE9D49F54CB8B52D4F9DD46495F4', '3', '天津东丽湖建设发展有限公司2015年建发2号私募债券（第二期）转让服务公告.pdf', '0D7081F4C9864322A2F0DB82B01512E4.pdf', null);
INSERT INTO `information` VALUES ('515F88F199064BC49E554F1C3EA16DF1', '2', '成都花园水城城乡建设投资非公开发行2014年私募债券（第四期）发行结果公告.pdf', '69474E402ECF421CA5F970954225CACD.pdf', null);
INSERT INTO `information` VALUES ('55D6BE0CD0AB4EC89C2476D91DC5AE70', '8', '红蜻蜓等6只新股周一上市定位分析 .pdf', '9DAE7E8C25444371A9108B89FD59974F.pdf', null);
INSERT INTO `information` VALUES ('6072A626AA6247BB8B9C351AF7948DDC', '2', '成都集装箱物流投资开发有限公司2015年集装箱8号私募债券（第一期）发行结果公告.pdf', '209BA3948D564270AC1A492303B5C428.pdf', null);
INSERT INTO `information` VALUES ('6AF9F09A8A3F43788AE34993EF685545', '6', '绵世股份承诺事项及履行情况详情.pdf', '1E92346722AB4E11ACF9CCC5327B2D97.pdf', null);
INSERT INTO `information` VALUES ('6BBE7B3DD7124274BBA9F17DBCE98347', '0', '广州股权交易中心关于表彰2014年度优秀会员的决定.txt', '90F4A2B06F5F49EABCD8ECDA22C8C230.txt', null);
INSERT INTO `information` VALUES ('6F4572639EF445A19853FD8C6E5DD4A5', '2', '深圳正威（集团）有限公司2015年私募债券1号发行结果公告（第二期）.pdf', '9D1A1560DF08477BA175E0BC663F4869.pdf', null);
INSERT INTO `information` VALUES ('719AEB3D98954450A472AF6582F48BAE', '0', '关于广州建成工程咨询股份有限公司暂停股份转让的公告.txt', '9E2CDE920B3E46A8915BBD3BC0D0EB12.txt', null);
INSERT INTO `information` VALUES ('74A924F86CFD41599FBF0563F9FA5333', '2', '普定工业投资开发有限责任公司2014年私募债券（第四期）发行结果公告.pdf', 'E68E6D9D2DFB49F7AF3ECAA4C4A4A89E.pdf', null);
INSERT INTO `information` VALUES ('753550C7E6E5468DAFA5F237CBD417DC', '6', '关于对万泽实业股份有限公司的重组问询函.pdf', 'BF0B87CCEA5344869C69A276138203A0.pdf', null);
INSERT INTO `information` VALUES ('7D5D37B4B8EC4C828A6B08840FBA9617', '6', '关于对中水渔业重组报告书补充披露意见的函.pdf', '79B015D6B11B4FF7B15C1EA0484C552D.pdf', null);
INSERT INTO `information` VALUES ('7E0A38E448D34EADAD94F3423A0C0770', '7', '两部门明确农行三农金融事业部涉农贷款营业税优惠政策 .pdf', 'BE0F4C901FDE4187BDED38FB272A9AFB.pdf', null);
INSERT INTO `information` VALUES ('855BACAE1C5D4E82A5929702573F1CF2', '2', '天津广成宏盛基础设施投资有限公司2015年宏盛1号私募债券（第二期）发行结果公告.pdf', 'D6A291800E9C4BBFAAFC4C1A7D1F8869.pdf', null);
INSERT INTO `information` VALUES ('856AC5534E8A44FFA54054C04C86A403', '3', '关于深圳正威（集团）有限公司2015年私募债券1号（第二期）转让服务公告.pdf', '5E15C30D72434F4EB76202DDB78246B0.pdf', null);
INSERT INTO `information` VALUES ('89325524BA654DEC83AC007B86567B23', '8', '工行与泛欧交易所开展战略合作 .pdf', '54F2CDB17C3144D58FDBB4EB4A489A7D.pdf', null);
INSERT INTO `information` VALUES ('8D427BBE034F47688810FA244F0C5BF8', '2', '深圳正威（集团）有限公司2015年私募债券1号发行结果公告（第一期）.pdf', '5327018B89D0447282F654C35BE70F10.pdf', null);
INSERT INTO `information` VALUES ('954F158E90C5410D88E911825B42EE6D', '2', '普定工业投资开发有限责任公司2014年私募债券（第五期）发行结果公告.pdf', '1A80F295B43E454E93F52B4FA8C38DA4.pdf', null);
INSERT INTO `information` VALUES ('9BC915861F9B487B873804FB3BFAE8D2', '3', '天津广成宏盛基础设施投资有限公司2015年宏盛2号私募债券转让服务公告.pdf', '5E9D980F0E424B6693421B70EC537B6F.pdf', null);
INSERT INTO `information` VALUES ('9FA01C6949CA4911B487F9BB59D02E07', '3', '普定工业投资开发有限责任公司2014年私募债券（第四期）转让服务公告.pdf', '2925099ACF8842DE96E41B1635390BE7.pdf', null);
INSERT INTO `information` VALUES ('A82FD3A7B4054F4382CAA63BB14131EB', '6', '神州信息承诺事项及履行情况详情.pdf', 'F745EC856E0849A7BB808EB8552F7BB6.pdf', null);
INSERT INTO `information` VALUES ('A8C21DB765F84934AEC7659126DE45A0', '8', '理财产品发行量维持平稳.pdf', 'AB486C147FCF400F8FD3E80CE85C9204.pdf', null);
INSERT INTO `information` VALUES ('AA0B360DBAE74552A941190B3A85848E', '8', '赛升药业等3只新股周三申购指南 顶格需83.4万元.pdf', '78AE5107FEA8415894D4D4FDF2DB2C66.pdf', null);
INSERT INTO `information` VALUES ('AC845D5CC16342E3B038E7C13C92FB35', '8', '2015年上半年社会融资规模增量8.81万亿元 .pdf', '658ACBF1382241D6876FA3F5E19BF1CA.pdf', null);
INSERT INTO `information` VALUES ('B432B6879701491583DE3A16C35D7890', '3', '天津东丽湖建设发展有限公司2015年建发2号私募债券（第一期）转让服务公告.pdf', '57449D6ED7424983A00BBF934BB89EF6.pdf', null);
INSERT INTO `information` VALUES ('B7081EE616EE4B06BEB02D30AD5F0956', '6', '《关于对广东省高速公路发展股份有限司的重组问询函》 的回复.pdf', 'AD9AA4915D5F4FC08744B79A4C85B125.pdf', null);
INSERT INTO `information` VALUES ('BBCFA1C653EE4042A7CB58915368DA81', '6', '关于对宁波慈星股份有限公司的年报问询函.pdf', '8991E3D4F27D4D4B8653666560545E33.pdf', null);
INSERT INTO `information` VALUES ('BDA605F90C3B4C0D91DCA8EF40625FAF', '8', '3家专业互联网保险公司获批筹建保险机构员工持股正式开闸 .pdf', '5B57C2D21CB74DF8A49C8E6303E0A365.pdf', null);
INSERT INTO `information` VALUES ('C428A7C3267C438D808C9F939CC2F703', '0', '广州股权交易中心关于组织召开第一届审委会2015年第十九次会议的公告.txt', 'C07ED1F0A7A140D2BD0B48520526A7D2.txt', null);
INSERT INTO `information` VALUES ('C82B97F192DD4B21943A01B4BBCD0974', '7', '《私募投资基金监督管理暂行办法》（证监会令[105]号）.pdf', 'FE0AA406C5E74E19911442D4A4988F2D.pdf', null);
INSERT INTO `information` VALUES ('DBE685B6F9384682A96BCC7D06F9CA6B', '2', '瓮安县工业园区投资开发有限责任公司2014年私募债券（第三期）发行结果公告.pdf', '6656FA4F5C98490E9EDA1BCD15FA0D82.pdf', null);
INSERT INTO `information` VALUES ('DD00458B89694EFE9C4CB7775853ADF9', '0', '关于2015年清明节休市安排的通知.txt', '3EFF0FA1763C4B74841925C42C6815F5.txt', null);
INSERT INTO `information` VALUES ('DD6E7BF595264138A16F400B3167211D', '0', '关于百城传媒和域码网络终止挂牌的公告.txt', 'A4DA311A0B77473A819ED02F811461D2.txt', null);
INSERT INTO `information` VALUES ('E2938594F8FB42A1B8558F324A469C4B', '3', '关于深圳正威（集团）有限公司2015年私募债券1号（第一期）转让服务公告.pdf', 'FF63C03A0B964AE989097031E6D8CD2B.pdf', null);
INSERT INTO `information` VALUES ('E656324227F24A3F8A829344FD4BF37D', '8', '德隆系前高管操盘 深圳惠程证券投资收益剧增.pdf', '4F7309241D4B445A8BAC0950F9B7D928.pdf', null);
INSERT INTO `information` VALUES ('E8E385783B4F447AA7B5DF0185BFBE07', '2', '双鸭山市大地城市建设开发投资有限公司2015年私募债券（第七期）发行结果公告.pdf', '83E8FA6DD0034E6997D6246540B65A4A.pdf', null);
INSERT INTO `information` VALUES ('F0D326DF686E4BA880787D32E0B4A9A0', '3', '5 转让服务公告（14大地34）.pdf', 'DB72735073E94DFEA24422377D360034.pdf', null);
INSERT INTO `information` VALUES ('F48931201A1D4DBFA22027823D3575AA', '0', '关于继续暂停广东百城传媒股份有限公司股份转让的公告.txt', '490A20915C1D4E009FED4FB339AB9F9B.txt', null);
INSERT INTO `information` VALUES ('FE65D6FDF1F24DA49785545A48B7356F', '8', '方正证券被证监会立案调查 涉嫌信息披露违规.pdf', 'E8E5890DD67D4EA1AF6ABBBC535E88CC.pdf', null);

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
INSERT INTO `investor` VALUES ('292ABC3521394FDEB6F553E5BD0D3C49', 'liwangadd@gmail.com', 'liwang', '李旺', null, '大连理工大学', '1234567890', null, '10000', '张三', '李四', null, null, '010123456789', null, '大连', '电子', '初期', '2', null, null, null, null, null, null, null, null, null, '38A9A6C44DBB409298922DB1169666D9.jpg', '北京', NULL );

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
INSERT INTO `message` VALUES ('a', '2015-09-01', '昨天发给您的文件收到了吗？', 'n', 'a', '0', '1');
INSERT INTO `message` VALUES ('b', '2015-09-02', '嗯，收到了。', 'o', 'b', '0', '1');
INSERT INTO `message` VALUES ('c', '2015-09-03', '那您觉得这个方案怎么样呢？', 'p', 'c', '0', '1');
INSERT INTO `message` VALUES ('d', '2015-09-04', '还不错，挺有创意的。', 'q', 'd', '0', '1');
INSERT INTO `message` VALUES ('e', '2015-09-05', '那您的意见是怎样的？', 'r', 'e', '0', '1');
INSERT INTO `message` VALUES ('f', '2015-09-06', '你明天有时间吗，我们找个地方详谈。', 's', 'f', '1', '0');
INSERT INTO `message` VALUES ('g', '2015-09-07', '好，我时间不紧，按您的时间安排。', 't', 'g', '1', '0');
INSERT INTO `message` VALUES ('h', '2015-09-08', '你明天下午两点，地点你定。', 'u', 'h', '1', '0');
INSERT INTO `message` VALUES ('i', '2015-09-09', '那咱们就在软件学院旁边的咖啡厅吧。', 'v', 'i', '1', '0');
INSERT INTO `message` VALUES ('j', '2015-09-10', 'OK，具体内容见面详谈', 'w', 'j', '1', '0');
INSERT INTO `message` VALUES ('k', '2015-09-11', '好的，期待我们合作愉快。', 'x', 'k', '1', '0');
INSERT INTO `message` VALUES ('l', '2015-09-12', '我也是如此。', 'y', 'l', '1', '0');
INSERT INTO `message` VALUES ('m', '2015-09-13', '明天见。', 'z', 'm', '1', '0');

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
INSERT INTO `person` VALUES ('1', '', '20');

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
/*INSERT INTO `stockcreditor` VALUES ('n', '产品1', '上海', '农业', '2015-01-02', '100', '1', '0', null, null, null, null, null, null, null, '0', '0', 'n');
INSERT INTO `stockcreditor` VALUES ('o', '产品2', '大连', '工业', '2015-01-03', '200', '2', '0', null, null, null, null, null, null, null, '1', '0', 'n');
INSERT INTO `stockcreditor` VALUES ('p', '产品3', '沈阳', '医药业', '2015-01-04', '300', '3', '0', null, null, null, null, null, null, null, '2', '0', 'n');
INSERT INTO `stockcreditor` VALUES ('q', '产品4', '承德', '采矿业', '2015-01-05', '400', '4', '0', null, null, null, null, null, null, null, '3', '0', 'n');
INSERT INTO `stockcreditor` VALUES ('r', '产品5', '北京', '能源业', '2015-01-06', '500', '5', '0', null, null, null, null, null, null, null, '4', '0', 'n');
INSERT INTO `stockcreditor` VALUES ('s', '产品6', '天津', '广告业', '2015-01-07', '600', '6', '0', null, null, null, null, null, null, null, '5', '0', 'n');
INSERT INTO `stockcreditor` VALUES ('t', '产品7', '香港', '教育业', '2015-01-08', '700', '7', '0', null, null, null, null, null, null, null, '6', '0', 'n');
INSERT INTO `stockcreditor` VALUES ('u', '产品8', '石家庄', '金融业', '2015-01-09', '800', '8', '1', null, null, null, null, null, null, null, '7', '0', 'n');
INSERT INTO `stockcreditor` VALUES ('v', '产品9', '廊坊', '医疗业', '2015-01-10', '900', '9', '1', null, null, null, null, null, null, null, '8', '0', 'n');
INSERT INTO `stockcreditor` VALUES ('w', '产品10', '青岛', '造纸业', '2015-01-11', '1000', '10', '1', null, null, null, null, null, null, null, '9', '0', 'n');
INSERT INTO `stockcreditor` VALUES ('x', '产品11', '唐山', '出版业', '2015-01-12', '1100', '11', '1', null, null, null, null, null, null, null, '10', '0', 'n');
INSERT INTO `stockcreditor` VALUES ('y', '产品12', '衡水', '演艺业', '2015-01-13', '1200', '12', '1', null, null, null, null, null, null, null, '11', '0', 'n');
INSERT INTO `stockcreditor` VALUES ('z', '产品13', '保定', '美容业', '2015-01-14', '1300', '13', '1', null, null, null, null, null, null, null, '12', '0', 'n');
*/
INSERT INTO `stockcreditor` VALUES ('product1', '星尘财富投资有限公司第1期私募债', '大连', '工业', '2015-01-03', '20000', '2', '0', '30%', '0', '12%年', '0', '商业计划书', '要求项目真实可靠，能达到预期的利润，企业有稳定的财务收入。', '0', '1', '0', 'investor1', '股权转让', '1', '中国工商银行', '1000', '500', '1', '1');
INSERT INTO `stockcreditor` VALUES ('product2', '亚洲风影视传媒有限公司第2期私募股权', '沈阳', '医药业', '2015-01-04', '30000', '3', '1', '40%', '1', '10%年', '1', '项目计划书', '业务仅限于上海市范围以内，抵押物为住宅、别墅、商铺、办公楼宇。', '1', '2', '0', 'investor1', '股份回购', '2', '中国建设银行', '2000', '1000', '1', '1');
INSERT INTO `stockcreditor` VALUES ('product3', '中雅机电视野有限公司第3期私募债', '承德', '采矿业', '2015-01-05', '40000', '4', '0', '50%', '2', '15%年', '2', '相关财务资料', '上海某企业资金1000万-7000万提供短期债权融资服务，要求公司经营良好。', '2', '3', '1', 'investor1', '股权转让', '3', '中国农业银行', '1500', '1000', '1', '1');
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





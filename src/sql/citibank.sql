-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: citiBank
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `id` varchar(32) NOT NULL,
  `userId` VARCHAR(32) NOT NULL COMMENT '预约本方id',
  `appointmentId` VARCHAR(32) NOT NULL COMMENT '预约方id',
  `appointmentName` varchar(50) NOT NULL COMMENT '预约方',
  `contractWay` int(11) NOT NULL COMMENT '联系方式',
  `appointmentTime` date NOT NULL COMMENT '预约时间',
  `submitTime` date NOT NULL COMMENT '预约提交时间',
  `finishedTime` date DEFAULT NULL COMMENT '预约完成时间',
  `flag` int(11) NOT NULL COMMENT '标记预约是否完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attention`
--

DROP TABLE IF EXISTS `attention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attention` (
  `id` varchar(32) NOT NULL,
  `attentionState` int(1) NOT NULL COMMENT '关注状态，0为互相不关注，1为一方关注，2为互相关注',
  `productType` int(1) NOT NULL,
  `flag` int(1) NOT NULL COMMENT '标记是企业还是投资者,0为企业1为投资者',
  `userId` varchar(32) NOT NULL COMMENT '关联的用户ID',
  `otherId` VARCHAR(32) NOT NULL COMMENT '关注对方的ID',
  `attStockCreditorId` varchar(32) NOT NULL COMMENT '指向股债券的ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attention`
--

LOCK TABLES `attention` WRITE;
/*!40000 ALTER TABLE `attention` DISABLE KEYS */;
/*!40000 ALTER TABLE `attention` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `companyId` varchar(32) NOT NULL COMMENT '公司id',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `companyCode` varchar(50) NOT NULL COMMENT '公司代码',
  `companyName` varchar(50) NOT NULL COMMENT '公司名称',
  `companyType` int(1) COMMENT '公司类型,0为有限责任公司，1为股份有限公司，2为个人合伙企业，3为个人独资企业，4为其它',
  `registerCapital` int(11) COMMENT '注册资本',
  `businessLisence` varchar(50) COMMENT '营业执照注册号',
  `legalPresentative` varchar(50) COMMENT '法定代表人',
  `formedTime` varchar(50) COMMENT '成立时间',
  `officialWeb` varchar(50) DEFAULT NULL COMMENT '官网地址',
  `baseAddress` varchar(50) COMMENT '总部地址',
  `registerAddress` varchar(50) COMMENT '注册地址',
  `consultPhone` varchar(20) COMMENT '咨询电话',
  `workingFiled` varchar(50) COMMENT '所属行业',
  `majorAffair` varchar(50) COMMENT '主营业务',
  `revenueModels` int(50) COMMENT '盈利模式，0为关系服务，1为产业标准，2为客户解决方案，3为个性挖掘，4为速度领先，5为数据处理，6为成本占优，7为中转站模式，8为其它',
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financedata`
--

DROP TABLE IF EXISTS `financedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financedata`
--

LOCK TABLES `financedata` WRITE;
/*!40000 ALTER TABLE `financedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `financedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `information`
--

DROP TABLE IF EXISTS `information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `information` (
  `id` varchar(32) NOT NULL,
  `flag` int(1) NOT NULL COMMENT '标记文件类型0是中心公告，1是私募債列表，2是备案发行公告，3是转让交易报告，4是定期报告，5是临时报告，6是信用报告，7政策资讯，8是市场咨询',
  `fileName` varchar(50) NOT NULL COMMENT '文件名称，用来搜索',
  `path` varchar(255) NOT NULL COMMENT '文件路径',
  `investorId` varchar(32) DEFAULT NULL COMMENT '指向投资者的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `information`
--

LOCK TABLES `information` WRITE;
/*!40000 ALTER TABLE `information` DISABLE KEYS */;
INSERT INTO `information` VALUES ('0082CDF856DE458AB91A0F0892B76AE8',0,'关于广东三九军大生物科技有限公司终止挂牌的公告.txt','14BE4DE2DF86487381755A98D6A69377.txt',NULL),('02C726E3D47049D4A09517A9EA253F91',6,'关于对广东明家科技股份有限公司的重组问询函.pdf','F14784AF4BF048C3AE2F62B2106C189D.pdf',NULL),('0A0E9643623641BA83D783C6C8E283FE',7,'税务总局：金融企业涉农贷款和中小企业贷款损失扣除条件放宽 .pdf','88D0EBC6160A4AF4859676FA3DA5ADD8.pdf',NULL),('0B97AA3AD171452EAFB04C7009F6BC1F',0,'关于2015年春节休市安排的通知.txt','46F35F048FC44C01835E4CC84D31460A.txt',NULL),('0C873383955042839B74E52E80A8B478',6,'关于对骅威科技股份有限公司的组问询函.pdf','A0C0C3B5C3E44FFA87E81FCABCF414DA.pdf',NULL),('115616E1B70E431DB2AE8438DFE937BF',7,'安徽省科技型中小企业私募债券融资及风险_谢婷婷.pdf','B927A322386F443EA570ED819434919E.pdf',NULL),('1BFE0BF9D1F54D4C902BE1034A5824C9',2,'天津广成宏盛基础设施投资有限公司2015年宏盛1号私募债券（第一期）发行结果公告.pdf','010DD766D01E45BC8FBBF9A29EA88C84.pdf',NULL),('1D503BDE83CE444BA7832C81D0CEE7DB',0,'关于2015年端午节休市安排的通知.txt','519F3DBE65434949A04BC3AB2827466D.txt',NULL),('1DA1C894F9BB41A39207B12D14BD4203',3,'普定工业投资开发有限责任公司2014年私募债券（第五期）转让服务公告.pdf','D25E03DC0EF24755A68A0EB38D148FC5.pdf',NULL),('28F3D6BBA96E48A1A0D505DF6100B17E',0,'关于2015年劳动节休市安排的通知.txt','78E3EE2020624136BC03307B088B1610.txt',NULL),('2C5A7617AE894CD38CADD330844A6868',3,'2014年私募债券（选择权第五期）转让服务公告.pdf','2A45AD2C4E5A44E18E74F01901489501.pdf',NULL),('2D883D23FCC242B686E8AE6BD5635FC7',6,'关于对北大医药股份有限公司的重组询问函.pdf','AF950C877F9B4A65B0AE15E892B6CB26.pdf',NULL),('33C33BCE06014C0090E2884739ED1F5B',7,'关于中国农业银行三农金融事业部涉农贷款营业税优惠政策的通知.pdf','F094E29F785F4805AD3CFEE2A5A16468.pdf',NULL),('3F5E814BDE9645608617DACE3C9963DC',8,'兖州煤业高管增持超10万股 拟投资超23亿建煤矿.pdf','DD1BEC803D2443BFA9622107AF0E219E.pdf',NULL),('436ECD8365884192BE73AB0E32C28DD8',3,'非公开发行2014年私募债券（选择权第三期）转让服务公告.pdf','B020FD0C76CF4767AB3091389EDE7EE4.pdf',NULL),('48EBAE9D49F54CB8B52D4F9DD46495F4',3,'天津东丽湖建设发展有限公司2015年建发2号私募债券（第二期）转让服务公告.pdf','0D7081F4C9864322A2F0DB82B01512E4.pdf',NULL),('515F88F199064BC49E554F1C3EA16DF1',2,'成都花园水城城乡建设投资非公开发行2014年私募债券（第四期）发行结果公告.pdf','69474E402ECF421CA5F970954225CACD.pdf',NULL),('55D6BE0CD0AB4EC89C2476D91DC5AE70',8,'红蜻蜓等6只新股周一上市定位分析 .pdf','9DAE7E8C25444371A9108B89FD59974F.pdf',NULL),('6072A626AA6247BB8B9C351AF7948DDC',2,'成都集装箱物流投资开发有限公司2015年集装箱8号私募债券（第一期）发行结果公告.pdf','209BA3948D564270AC1A492303B5C428.pdf',NULL),('6AF9F09A8A3F43788AE34993EF685545',6,'绵世股份承诺事项及履行情况详情.pdf','1E92346722AB4E11ACF9CCC5327B2D97.pdf',NULL),('6BBE7B3DD7124274BBA9F17DBCE98347',0,'广州股权交易中心关于表彰2014年度优秀会员的决定.txt','90F4A2B06F5F49EABCD8ECDA22C8C230.txt',NULL),('6F4572639EF445A19853FD8C6E5DD4A5',2,'深圳正威（集团）有限公司2015年私募债券1号发行结果公告（第二期）.pdf','9D1A1560DF08477BA175E0BC663F4869.pdf',NULL),('719AEB3D98954450A472AF6582F48BAE',0,'关于广州建成工程咨询股份有限公司暂停股份转让的公告.txt','9E2CDE920B3E46A8915BBD3BC0D0EB12.txt',NULL),('74A924F86CFD41599FBF0563F9FA5333',2,'普定工业投资开发有限责任公司2014年私募债券（第四期）发行结果公告.pdf','E68E6D9D2DFB49F7AF3ECAA4C4A4A89E.pdf',NULL),('753550C7E6E5468DAFA5F237CBD417DC',6,'关于对万泽实业股份有限公司的重组问询函.pdf','BF0B87CCEA5344869C69A276138203A0.pdf',NULL),('7D5D37B4B8EC4C828A6B08840FBA9617',6,'关于对中水渔业重组报告书补充披露意见的函.pdf','79B015D6B11B4FF7B15C1EA0484C552D.pdf',NULL),('7E0A38E448D34EADAD94F3423A0C0770',7,'两部门明确农行三农金融事业部涉农贷款营业税优惠政策 .pdf','BE0F4C901FDE4187BDED38FB272A9AFB.pdf',NULL),('855BACAE1C5D4E82A5929702573F1CF2',2,'天津广成宏盛基础设施投资有限公司2015年宏盛1号私募债券（第二期）发行结果公告.pdf','D6A291800E9C4BBFAAFC4C1A7D1F8869.pdf',NULL),('856AC5534E8A44FFA54054C04C86A403',3,'关于深圳正威（集团）有限公司2015年私募债券1号（第二期）转让服务公告.pdf','5E15C30D72434F4EB76202DDB78246B0.pdf',NULL),('89325524BA654DEC83AC007B86567B23',8,'工行与泛欧交易所开展战略合作 .pdf','54F2CDB17C3144D58FDBB4EB4A489A7D.pdf',NULL),('8D427BBE034F47688810FA244F0C5BF8',2,'深圳正威（集团）有限公司2015年私募债券1号发行结果公告（第一期）.pdf','5327018B89D0447282F654C35BE70F10.pdf',NULL),('954F158E90C5410D88E911825B42EE6D',2,'普定工业投资开发有限责任公司2014年私募债券（第五期）发行结果公告.pdf','1A80F295B43E454E93F52B4FA8C38DA4.pdf',NULL),('9BC915861F9B487B873804FB3BFAE8D2',3,'天津广成宏盛基础设施投资有限公司2015年宏盛2号私募债券转让服务公告.pdf','5E9D980F0E424B6693421B70EC537B6F.pdf',NULL),('9FA01C6949CA4911B487F9BB59D02E07',3,'普定工业投资开发有限责任公司2014年私募债券（第四期）转让服务公告.pdf','2925099ACF8842DE96E41B1635390BE7.pdf',NULL),('A82FD3A7B4054F4382CAA63BB14131EB',6,'神州信息承诺事项及履行情况详情.pdf','F745EC856E0849A7BB808EB8552F7BB6.pdf',NULL),('A8C21DB765F84934AEC7659126DE45A0',8,'理财产品发行量维持平稳.pdf','AB486C147FCF400F8FD3E80CE85C9204.pdf',NULL),('AA0B360DBAE74552A941190B3A85848E',8,'赛升药业等3只新股周三申购指南 顶格需83.4万元.pdf','78AE5107FEA8415894D4D4FDF2DB2C66.pdf',NULL),('AC845D5CC16342E3B038E7C13C92FB35',8,'2015年上半年社会融资规模增量8.81万亿元 .pdf','658ACBF1382241D6876FA3F5E19BF1CA.pdf',NULL),('B432B6879701491583DE3A16C35D7890',3,'天津东丽湖建设发展有限公司2015年建发2号私募债券（第一期）转让服务公告.pdf','57449D6ED7424983A00BBF934BB89EF6.pdf',NULL),('B7081EE616EE4B06BEB02D30AD5F0956',6,'《关于对广东省高速公路发展股份有限司的重组问询函》 的回复.pdf','AD9AA4915D5F4FC08744B79A4C85B125.pdf',NULL),('BBCFA1C653EE4042A7CB58915368DA81',6,'关于对宁波慈星股份有限公司的年报问询函.pdf','8991E3D4F27D4D4B8653666560545E33.pdf',NULL),('BDA605F90C3B4C0D91DCA8EF40625FAF',8,'3家专业互联网保险公司获批筹建保险机构员工持股正式开闸 .pdf','5B57C2D21CB74DF8A49C8E6303E0A365.pdf',NULL),('C428A7C3267C438D808C9F939CC2F703',0,'广州股权交易中心关于组织召开第一届审委会2015年第十九次会议的公告.txt','C07ED1F0A7A140D2BD0B48520526A7D2.txt',NULL),('C82B97F192DD4B21943A01B4BBCD0974',7,'《私募投资基金监督管理暂行办法》（证监会令[105]号）.pdf','FE0AA406C5E74E19911442D4A4988F2D.pdf',NULL),('DBE685B6F9384682A96BCC7D06F9CA6B',2,'瓮安县工业园区投资开发有限责任公司2014年私募债券（第三期）发行结果公告.pdf','6656FA4F5C98490E9EDA1BCD15FA0D82.pdf',NULL),('DD00458B89694EFE9C4CB7775853ADF9',0,'关于2015年清明节休市安排的通知.txt','3EFF0FA1763C4B74841925C42C6815F5.txt',NULL),('DD6E7BF595264138A16F400B3167211D',0,'关于百城传媒和域码网络终止挂牌的公告.txt','A4DA311A0B77473A819ED02F811461D2.txt',NULL),('E2938594F8FB42A1B8558F324A469C4B',3,'关于深圳正威（集团）有限公司2015年私募债券1号（第一期）转让服务公告.pdf','FF63C03A0B964AE989097031E6D8CD2B.pdf',NULL),('E656324227F24A3F8A829344FD4BF37D',8,'德隆系前高管操盘 深圳惠程证券投资收益剧增.pdf','4F7309241D4B445A8BAC0950F9B7D928.pdf',NULL),('E8E385783B4F447AA7B5DF0185BFBE07',2,'双鸭山市大地城市建设开发投资有限公司2015年私募债券（第七期）发行结果公告.pdf','83E8FA6DD0034E6997D6246540B65A4A.pdf',NULL),('F0D326DF686E4BA880787D32E0B4A9A0',3,'5 转让服务公告（14大地34）.pdf','DB72735073E94DFEA24422377D360034.pdf',NULL),('F48931201A1D4DBFA22027823D3575AA',0,'关于继续暂停广东百城传媒股份有限公司股份转让的公告.txt','490A20915C1D4E009FED4FB339AB9F9B.txt',NULL),('FE65D6FDF1F24DA49785545A48B7356F',8,'方正证券被证监会立案调查 涉嫌信息披露违规.pdf','E8E5890DD67D4EA1AF6ABBBC535E88CC.pdf',NULL);
/*!40000 ALTER TABLE `information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investor`
--

DROP TABLE IF EXISTS `investor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  PRIMARY KEY (`investorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investor`
--

LOCK TABLES `investor` WRITE;
/*!40000 ALTER TABLE `investor` DISABLE KEYS */;
INSERT INTO `investor` VALUES ('292ABC3521394FDEB6F553E5BD0D3C49','liwangadd@gmail.com','liwang','李旺',NULL,'大连理工大学','1234567890',NULL,10000,'张三','李四',NULL,NULL,'010123456789',NULL,'大连','电子','初期','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'38A9A6C44DBB409298922DB1169666D9.jpg','北京');
/*!40000 ALTER TABLE `investor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` varchar(32) NOT NULL,
  `time` date NOT NULL COMMENT '时间',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `userId` varchar(32) DEFAULT NULL,
  `otherId` varchar(32) DEFAULT NULL,
  `flag` int(1) NOT NULL,
  `status` int(1) DEFAULT NULL COMMENT '0是未读，1是已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'',20);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockcreditor`
--

DROP TABLE IF EXISTS `stockcreditor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stockcreditor` (
  `id` varchar(32) NOT NULL PRIMARY KEY ,
  `productName` varchar(255) NOT NULL COMMENT '股债权名字',
  `investArea` varchar(50) NOT NULL COMMENT '投资区域',
  `investIndustry` varchar(50) NOT NULL COMMENT '投资行业',
  `createTime` date NOT NULL COMMENT '股债权创建时间',
  `investMoney` int(11) NOT NULL COMMENT '投资金额',
  `investTime` int(11) NOT NULL COMMENT '投资年限',
  `productType` int(1) NOT NULL COMMENT '产品类型，1为股权，2为债权',
  `stockRate` varchar(50) DEFAULT NULL COMMENT '参股比例',
  `investStage` varchar(50) DEFAULT NULL COMMENT '投资阶段,0为种子阶段，1为初创阶段，2为拓展前阶段，3为拓展后阶段，4为Pre-IPO',
  `leastReturnDemand` varchar(50) DEFAULT NULL COMMENT '最低要求回报',
  `riskControlDemand` int(1) DEFAULT NULL COMMENT '风险控制要求，0为抵押，1为担保，2为协议，3为质押，4为留置',
  `demandFile` varchar(50) DEFAULT NULL COMMENT '要求文件',
  `demandSummarize` varchar(50) DEFAULT NULL COMMENT '投资要求概述',
  `creditRank` int(1) DEFAULT NULL COMMENT '信用等级，0为AAA，1为AA，2为A，3为BBB，4为BB，5为B，6为CCC，7为CC，8为C',
  `fundBody` int(10) NOT NULL COMMENT '资金主体，0为个人资金，1为企业资金，2为天使投资，3为VC投资，4为PE投资，5为小额贷款，
  6为典当公司，7为担保公司，8为金融租赁，9为投资公司，10为商业银行，11为基金公司，12为证券公司，13为信托公司，14为资产管理，15为其它资金',
  `flag` int(1) NOT NULL COMMENT '标记，0为企业模式，1为投资者模式',
  `userId` varchar(32) NOT NULL COMMENT '关联用户外键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockcreditor`
--

LOCK TABLES `stockcreditor` WRITE;
/*!40000 ALTER TABLE `stockcreditor` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockcreditor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-28 20:57:46

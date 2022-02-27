
DROP DATABASE IF EXISTS `benepay`;

CREATE DATABASE  `benepay` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

USE `pig_codegen`;

-- ----------------------------
-- Table structure for CHARGE_ORDER
-- ----------------------------
DROP TABLE IF EXISTS `CHARGE_ORDER`;
CREATE TABLE `CHARGE_ORDER` (
  `ID` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单ID',
  `ORD_NUM` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '充值流水',
  `ORD_NAME` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单名称',
  `ORD_REMARKS` varchar(900) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单备注',
  `USER_ID` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户ID',
  `CHARGE_ACCOUNT` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '充值户号',
  `BIZ_SRC` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '业务来源',
  `CHANNEL_ID` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '渠道ID',
  `PROD_ID` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品ID',
  `PROD_NAME` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `OFFER_ID` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品ID',
  `OFFER_DESC` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
  `OFFER_FEE` int DEFAULT NULL COMMENT '商品金额',
  `PAY_FEE` int DEFAULT NULL COMMENT '实付金额',
  `PAY_TYPE` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付方式',
  `PAY_ORD_NUM` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付流水号',
  `STATE` int DEFAULT NULL COMMENT '状态',
  `STATE_TIME` datetime DEFAULT NULL COMMENT '状态时间',
  `TENANT_ID` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '租户号',
  `REVISION` int DEFAULT NULL COMMENT '乐观锁',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='充值订单';

-- ----------------------------
-- Table structure for PAY_RESPONE
-- ----------------------------
DROP TABLE IF EXISTS `PAY_RESPONE`;
CREATE TABLE `PAY_RESPONE` (
  `ID` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '响应ID',
  `ORD_ID` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单ID',
  `TRADE_NO` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '流水号',
  `RESP_BODY` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '响应报文',
  `RESP_CHANNEL` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '响应渠道',
  `STATE` int DEFAULT NULL COMMENT '状态',
  `STATE_TIME` datetime DEFAULT NULL COMMENT '状态时间',
  `TENANT_ID` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '租户号',
  `REVISION` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '乐观锁',
  `CREATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='支付回调信息';

SET FOREIGN_KEY_CHECKS = 1;

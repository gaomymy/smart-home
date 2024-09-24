/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : device

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 04/07/2024 09:03:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) COLLATE utf8mb4_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` VALUES (1, 'sys_user', '用户信息表', NULL, NULL, 'SysUser', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'user', '用户信息', 'ruoyi', '0', '/', '{}', 'admin', '2024-07-03 14:02:44', '', '2024-07-03 16:29:11', NULL);
INSERT INTO `gen_table` VALUES (3, 'sys_config', '参数配置表', NULL, NULL, 'SysConfig', 'crud', '', 'com.ruoyi.system', 'system', 'config', '参数配置', 'ruoyi', '0', '/', NULL, 'admin', '2024-07-03 20:48:31', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'sys_dept', '部门表', NULL, NULL, 'SysDept', 'crud', '', 'com.ruoyi.system', 'system', 'dept', '部门', 'ruoyi', '0', '/', NULL, 'admin', '2024-07-03 20:48:31', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (5, 'sys_dict_data', '字典数据表', NULL, NULL, 'SysDictData', 'crud', '', 'com.ruoyi.system', 'system', 'data', '字典数据', 'ruoyi', '0', '/', NULL, 'admin', '2024-07-03 20:48:31', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (6, 'sys_dict_type', '字典类型表', NULL, NULL, 'SysDictType', 'crud', '', 'com.ruoyi.system', 'system', 'type', '字典类型', 'ruoyi', '0', '/', NULL, 'admin', '2024-07-03 20:48:31', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (7, 'sys_job', '定时任务调度表', NULL, NULL, 'SysJob', 'crud', '', 'com.ruoyi.system', 'system', 'job', '定时任务调度', 'ruoyi', '0', '/', NULL, 'admin', '2024-07-03 20:48:32', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (8, 'sys_job_log', '定时任务调度日志表', NULL, NULL, 'SysJobLog', 'crud', '', 'com.ruoyi.system', 'system', 'log', '定时任务调度日志', 'ruoyi', '0', '/', NULL, 'admin', '2024-07-03 20:48:32', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (9, 'sys_logininfor', '系统访问记录', NULL, NULL, 'SysLogininfor', 'crud', '', 'com.ruoyi.system', 'system', 'logininfor', '系统访问记录', 'ruoyi', '0', '/', NULL, 'admin', '2024-07-03 20:48:32', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (10, 'sys_menu', '菜单权限表', NULL, NULL, 'SysMenu', 'crud', '', 'com.ruoyi.system', 'system', 'menu', '菜单权限', 'ruoyi', '0', '/', NULL, 'admin', '2024-07-03 20:48:32', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (11, 'sys_notice', '通知公告表', NULL, NULL, 'SysNotice', 'crud', '', 'com.ruoyi.system', 'system', 'notice', '通知公告', 'ruoyi', '0', '/', NULL, 'admin', '2024-07-03 20:48:32', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (12, 'sys_oper_log', '操作日志记录', NULL, NULL, 'SysOperLog', 'crud', '', 'com.ruoyi.system', 'system', 'log', '操作日志记录', 'ruoyi', '0', '/', NULL, 'admin', '2024-07-03 20:48:32', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (13, 'tb_device', '设备管理表', NULL, NULL, 'TbDevice', 'crud', '', 'com.ruoyi.system', 'system', 'device', '设备管理', 'ruoyi', '0', '/', NULL, 'admin', '2024-07-03 21:05:24', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
INSERT INTO `gen_table_column` VALUES (1, 1, 'user_id', '用户ID', 'bigint', 'Long', 'userId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-03 14:02:44', '', '2024-07-03 16:29:11');
INSERT INTO `gen_table_column` VALUES (2, 1, 'dept_id', '部门ID', 'bigint', 'Long', 'deptId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-07-03 14:02:44', '', '2024-07-03 16:29:11');
INSERT INTO `gen_table_column` VALUES (3, 1, 'user_name', '用户账号', 'varchar(30)', 'String', 'userName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'radio', '', 3, 'admin', '2024-07-03 14:02:44', '', '2024-07-03 16:29:11');
INSERT INTO `gen_table_column` VALUES (4, 1, 'nick_name', '用户昵称', 'varchar(30)', 'String', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-07-03 14:02:44', '', '2024-07-03 16:29:11');
INSERT INTO `gen_table_column` VALUES (5, 1, 'user_type', '用户类型（00系统用户）', 'varchar(2)', 'String', 'userType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2024-07-03 14:02:44', '', '2024-07-03 16:29:11');
INSERT INTO `gen_table_column` VALUES (6, 1, 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-07-03 14:02:44', '', '2024-07-03 16:29:11');
INSERT INTO `gen_table_column` VALUES (7, 1, 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-07-03 14:02:44', '', '2024-07-03 16:29:11');
INSERT INTO `gen_table_column` VALUES (8, 1, 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 8, 'admin', '2024-07-03 14:02:44', '', '2024-07-03 16:29:11');
INSERT INTO `gen_table_column` VALUES (9, 1, 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-07-03 14:02:44', '', '2024-07-03 16:29:11');
INSERT INTO `gen_table_column` VALUES (10, 1, 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-07-03 14:02:44', '', '2024-07-03 16:29:11');
INSERT INTO `gen_table_column` VALUES (11, 1, 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 11, 'admin', '2024-07-03 14:02:44', '', '2024-07-03 16:29:11');
INSERT INTO `gen_table_column` VALUES (12, 1, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2024-07-03 14:02:44', '', '2024-07-03 16:29:11');
INSERT INTO `gen_table_column` VALUES (13, 1, 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-07-03 14:02:44', '', '2024-07-03 16:29:11');
INSERT INTO `gen_table_column` VALUES (14, 1, 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 14, 'admin', '2024-07-03 14:02:44', '', '2024-07-03 16:29:11');
INSERT INTO `gen_table_column` VALUES (15, 1, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2024-07-03 14:02:44', '', '2024-07-03 16:29:11');
INSERT INTO `gen_table_column` VALUES (16, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2024-07-03 14:02:44', '', '2024-07-03 16:29:11');
INSERT INTO `gen_table_column` VALUES (17, 1, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2024-07-03 14:02:44', '', '2024-07-03 16:29:11');
INSERT INTO `gen_table_column` VALUES (18, 1, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2024-07-03 14:02:44', '', '2024-07-03 16:29:11');
INSERT INTO `gen_table_column` VALUES (19, 1, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 19, 'admin', '2024-07-03 14:02:44', '', '2024-07-03 16:29:11');
INSERT INTO `gen_table_column` VALUES (29, 3, 'config_id', '参数主键', 'int', 'Long', 'configId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (30, 3, 'config_name', '参数名称', 'varchar(100)', 'String', 'configName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (31, 3, 'config_key', '参数键名', 'varchar(100)', 'String', 'configKey', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (32, 3, 'config_value', '参数键值', 'varchar(500)', 'String', 'configValue', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (33, 3, 'config_type', '系统内置（Y是 N否）', 'char(1)', 'String', 'configType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (34, 3, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, 3, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, 3, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, 3, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, 4, 'dept_id', '部门id', 'bigint', 'Long', 'deptId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, 4, 'parent_id', '父部门id', 'bigint', 'Long', 'parentId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, 4, 'ancestors', '祖级列表', 'varchar(50)', 'String', 'ancestors', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, 4, 'dept_name', '部门名称', 'varchar(30)', 'String', 'deptName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, 4, 'order_num', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, 4, 'leader', '负责人', 'varchar(20)', 'String', 'leader', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (45, 4, 'phone', '联系电话', 'varchar(11)', 'String', 'phone', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, 4, 'email', '邮箱', 'varchar(50)', 'String', 'email', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (47, 4, 'status', '部门状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (48, 4, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (49, 4, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (50, 4, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (51, 4, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (52, 4, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (53, 5, 'dict_code', '字典编码', 'bigint', 'Long', 'dictCode', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (54, 5, 'dict_sort', '字典排序', 'int', 'Long', 'dictSort', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (55, 5, 'dict_label', '字典标签', 'varchar(100)', 'String', 'dictLabel', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (56, 5, 'dict_value', '字典键值', 'varchar(100)', 'String', 'dictValue', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (57, 5, 'dict_type', '字典类型', 'varchar(100)', 'String', 'dictType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (58, 5, 'css_class', '样式属性（其他样式扩展）', 'varchar(100)', 'String', 'cssClass', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (59, 5, 'list_class', '表格回显样式', 'varchar(100)', 'String', 'listClass', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (60, 5, 'is_default', '是否默认（Y是 N否）', 'char(1)', 'String', 'isDefault', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (61, 5, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (62, 5, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (63, 5, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (64, 5, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (65, 5, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (66, 5, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 14, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (67, 6, 'dict_id', '字典主键', 'bigint', 'Long', 'dictId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (68, 6, 'dict_name', '字典名称', 'varchar(100)', 'String', 'dictName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (69, 6, 'dict_type', '字典类型', 'varchar(100)', 'String', 'dictType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (70, 6, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (71, 6, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (72, 6, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2024-07-03 20:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (73, 6, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (74, 6, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (75, 6, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 9, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (76, 7, 'job_id', '任务ID', 'bigint', 'Long', 'jobId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (77, 7, 'job_name', '任务名称', 'varchar(64)', 'String', 'jobName', '1', '0', '0', '1', NULL, NULL, NULL, 'LIKE', 'input', '', 2, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (78, 7, 'job_group', '任务组名', 'varchar(64)', 'String', 'jobGroup', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 3, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (79, 7, 'invoke_target', '调用目标字符串', 'varchar(500)', 'String', 'invokeTarget', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (80, 7, 'cron_expression', 'cron执行表达式', 'varchar(255)', 'String', 'cronExpression', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (81, 7, 'misfire_policy', '计划执行错误策略（1立即执行 2执行一次 3放弃执行）', 'varchar(20)', 'String', 'misfirePolicy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (82, 7, 'concurrent', '是否并发执行（0允许 1禁止）', 'char(1)', 'String', 'concurrent', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (83, 7, 'status', '状态（0正常 1暂停）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (84, 7, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (85, 7, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (86, 7, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (87, 7, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (88, 7, 'remark', '备注信息', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 13, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (89, 8, 'job_log_id', '任务日志ID', 'bigint', 'Long', 'jobLogId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (90, 8, 'job_name', '任务名称', 'varchar(64)', 'String', 'jobName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (91, 8, 'job_group', '任务组名', 'varchar(64)', 'String', 'jobGroup', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (92, 8, 'invoke_target', '调用目标字符串', 'varchar(500)', 'String', 'invokeTarget', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (93, 8, 'job_message', '日志信息', 'varchar(500)', 'String', 'jobMessage', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (94, 8, 'status', '执行状态（0正常 1失败）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (95, 8, 'exception_info', '异常信息', 'varchar(2000)', 'String', 'exceptionInfo', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 7, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (96, 8, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (97, 9, 'info_id', '访问ID', 'bigint', 'Long', 'infoId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (98, 9, 'user_name', '用户账号', 'varchar(50)', 'String', 'userName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (99, 9, 'ipaddr', '登录IP地址', 'varchar(128)', 'String', 'ipaddr', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (100, 9, 'login_location', '登录地点', 'varchar(255)', 'String', 'loginLocation', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (101, 9, 'browser', '浏览器类型', 'varchar(50)', 'String', 'browser', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (102, 9, 'os', '操作系统', 'varchar(50)', 'String', 'os', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (103, 9, 'status', '登录状态（0成功 1失败）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (104, 9, 'msg', '提示消息', 'varchar(255)', 'String', 'msg', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (105, 9, 'login_time', '访问时间', 'datetime', 'Date', 'loginTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (106, 10, 'menu_id', '菜单ID', 'bigint', 'Long', 'menuId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (107, 10, 'menu_name', '菜单名称', 'varchar(50)', 'String', 'menuName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (108, 10, 'parent_id', '父菜单ID', 'bigint', 'Long', 'parentId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (109, 10, 'order_num', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (110, 10, 'path', '路由地址', 'varchar(200)', 'String', 'path', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (111, 10, 'component', '组件路径', 'varchar(255)', 'String', 'component', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (112, 10, 'query', '路由参数', 'varchar(255)', 'String', 'query', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (113, 10, 'route_name', '路由名称', 'varchar(50)', 'String', 'routeName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 8, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (114, 10, 'is_frame', '是否为外链（0是 1否）', 'int', 'Long', 'isFrame', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (115, 10, 'is_cache', '是否缓存（0缓存 1不缓存）', 'int', 'Long', 'isCache', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (116, 10, 'menu_type', '菜单类型（M目录 C菜单 F按钮）', 'char(1)', 'String', 'menuType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 11, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (117, 10, 'visible', '菜单状态（0显示 1隐藏）', 'char(1)', 'String', 'visible', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (118, 10, 'status', '菜单状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 13, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (119, 10, 'perms', '权限标识', 'varchar(100)', 'String', 'perms', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (120, 10, 'icon', '菜单图标', 'varchar(100)', 'String', 'icon', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (121, 10, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (122, 10, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (123, 10, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (124, 10, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 19, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (125, 10, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 20, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (126, 11, 'notice_id', '公告ID', 'int', 'Long', 'noticeId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (127, 11, 'notice_title', '公告标题', 'varchar(50)', 'String', 'noticeTitle', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (128, 11, 'notice_type', '公告类型（1通知 2公告）', 'char(1)', 'String', 'noticeType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (129, 11, 'notice_content', '公告内容', 'longblob', 'String', 'noticeContent', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'editor', '', 4, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (130, 11, 'status', '公告状态（0正常 1关闭）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (131, 11, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (132, 11, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (133, 11, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (134, 11, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (135, 11, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (136, 12, 'oper_id', '日志主键', 'bigint', 'Long', 'operId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (137, 12, 'title', '模块标题', 'varchar(50)', 'String', 'title', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (138, 12, 'business_type', '业务类型（0其它 1新增 2修改 3删除）', 'int', 'Long', 'businessType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (139, 12, 'method', '方法名称', 'varchar(200)', 'String', 'method', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (140, 12, 'request_method', '请求方式', 'varchar(10)', 'String', 'requestMethod', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (141, 12, 'operator_type', '操作类别（0其它 1后台用户 2手机端用户）', 'int', 'Long', 'operatorType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 6, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (142, 12, 'oper_name', '操作人员', 'varchar(50)', 'String', 'operName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (143, 12, 'dept_name', '部门名称', 'varchar(50)', 'String', 'deptName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 8, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (144, 12, 'oper_url', '请求URL', 'varchar(255)', 'String', 'operUrl', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (145, 12, 'oper_ip', '主机地址', 'varchar(128)', 'String', 'operIp', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (146, 12, 'oper_location', '操作地点', 'varchar(255)', 'String', 'operLocation', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (147, 12, 'oper_param', '请求参数', 'varchar(2000)', 'String', 'operParam', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 12, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (148, 12, 'json_result', '返回参数', 'varchar(2000)', 'String', 'jsonResult', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 13, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (149, 12, 'status', '操作状态（0正常 1异常）', 'int', 'Long', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 14, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (150, 12, 'error_msg', '错误消息', 'varchar(2000)', 'String', 'errorMsg', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 15, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (151, 12, 'oper_time', '操作时间', 'datetime', 'Date', 'operTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 16, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (152, 12, 'cost_time', '消耗时间', 'bigint', 'Long', 'costTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-07-03 20:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (153, 13, 'id', 'id', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-03 21:05:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (154, 13, 'device_name', '设备名称', 'varchar(255)', 'String', 'deviceName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-03 21:05:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (155, 13, 'device_type', '设备类型', 'varchar(255)', 'String', 'deviceType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2024-07-03 21:05:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (156, 13, 'serial_number', '设备序列号', 'varchar(255)', 'String', 'serialNumber', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-07-03 21:05:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (157, 13, 'purchase_date', '购买日期', 'date', 'Date', 'purchaseDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-07-03 21:05:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (158, 13, 'warranty_exp', '保修期截止日期', 'date', 'Date', 'warrantyExp', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2024-07-03 21:05:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (159, 13, 'status', '设备状态', 'varchar(50)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2024-07-03 21:05:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (160, 13, 'location', '设备所在位置', 'varchar(255)', 'String', 'location', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-07-03 21:05:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (161, 13, 'remarks', '备注', 'text', 'String', 'remarks', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 9, 'admin', '2024-07-03 21:05:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (162, 13, 'temperature', '温度', 'varchar(255)', 'String', 'temperature', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-07-03 21:05:24', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-07-03 11:52:58', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-07-03 11:52:58', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-07-03 11:52:58', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-07-03 11:52:58', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2024-07-03 11:52:58', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-07-03 11:52:58', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-03 11:52:58', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-03 11:52:58', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-03 11:52:58', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-03 11:52:58', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-03 11:52:58', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-03 11:52:58', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-03 11:52:58', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-03 11:52:58', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-03 11:52:58', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-03 11:52:58', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '在线', '1', 'sys_device', NULL, 'default', 'N', '0', 'admin', '2024-07-03 14:16:17', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, '维护', '2', 'sys_device', NULL, 'default', 'N', '0', 'admin', '2024-07-03 14:16:26', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 3, '闲置', '3', 'sys_device', NULL, 'default', 'N', '0', 'admin', '2024-07-03 14:17:20', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 1, '电子设备', '1', 'sys_device_type', NULL, 'default', 'N', '0', 'admin', '2024-07-03 16:39:59', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 2, '交换机', '2', 'sys_device_type', NULL, 'default', 'N', '0', 'admin', '2024-07-03 16:40:22', 'admin', '2024-07-03 16:40:30', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '设备状态', 'sys_device', '0', 'admin', '2024-07-03 14:15:02', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '设备类型', 'sys_device_type', '0', 'admin', '2024-07-03 16:04:50', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-07-03 11:52:58', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由名称',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-07-03 11:52:58', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '1', '0', '', 'monitor', 'admin', '2024-07-03 11:52:58', 'admin', '2024-07-04 09:00:54', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '1', '0', '', 'tool', 'admin', '2024-07-03 11:52:58', 'admin', '2024-07-04 09:00:51', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-07-03 11:52:58', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-07-03 11:52:58', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-07-03 11:52:58', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-07-03 11:52:58', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-07-03 11:52:58', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-07-03 11:52:58', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-07-03 11:52:58', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-07-03 11:52:58', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-07-03 11:52:58', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-07-03 11:52:58', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-07-03 11:52:58', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-07-03 11:52:58', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-07-03 11:52:58', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-07-03 11:52:58', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-07-03 11:52:58', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-07-03 11:52:58', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-07-03 11:52:58', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-07-03 11:52:58', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-07-03 11:52:58', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '设备管理', 1, 6, 'device', 'system/device/index', NULL, '', 1, 0, 'C', '0', '0', 'system:device:list', 'swagger', 'admin', '2024-07-03 14:49:26', 'admin', '2024-07-03 20:54:19', '');
INSERT INTO `sys_menu` VALUES (2001, '设备查询', 2000, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:device:query', '#', 'admin', '2024-07-03 14:50:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '新增设备', 2000, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:device:add', '#', 'admin', '2024-07-03 14:50:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, ' 修改设备', 2000, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:device:edit', '#', 'admin', '2024-07-03 14:51:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '删除设备', 2000, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:device:remove', '#', 'admin', '2024-07-03 14:51:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '数据统计', 1, 4, 'statistics', 'system/statistics/index', NULL, '', 1, 0, 'C', '0', '0', 'system:device:DeviceType', 'chart', 'admin', '2024-07-03 17:10:41', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-07-03 11:52:58', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-07-03 11:52:58', '', NULL, '管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-07-03 11:52:58', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-07-03 11:52:58', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-07-03 11:52:58', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-07-03 11:52:58', 'admin', '2024-07-03 20:56:12', '普通角色');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) COLLATE utf8mb4_general_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '密码',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'admin', '00', 'admin@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-07-04 09:02:28', 'admin', '2024-07-03 11:52:58', '', '2024-07-04 09:02:28', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', 'common', '00', 'common@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2024-07-03 11:52:58', 'admin', '2024-07-03 11:52:58', 'admin', '2024-07-03 20:45:20', '测试员');
INSERT INTO `sys_user` VALUES (100, NULL, '111', '111', '00', '', '', '0', '', '$2a$10$penYMfmVXdKTcc2tU9sSJ.ZeLwlEaCQ5IWtdsRnTzu2NtA31vDsMa', '0', '2', '', NULL, '', '2024-07-03 20:39:17', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (101, NULL, 'user1', 'user1', '00', '', '', '0', '', '$2a$10$g1.Uxm7Axcsl9BTSNQfeweJEBr5Ygj4N7WwveDgj/qMVMtssxf.Va', '0', '0', '127.0.0.1', '2024-07-03 21:00:11', 'admin', '2024-07-03 20:46:11', 'admin', '2024-07-03 21:00:10', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (101, 2);
COMMIT;

-- ----------------------------
-- Table structure for tb_device
-- ----------------------------
DROP TABLE IF EXISTS `tb_device`;
CREATE TABLE `tb_device` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `device_name` varchar(255) DEFAULT NULL COMMENT '设备名称',
  `device_type` varchar(255) DEFAULT NULL COMMENT '设备类型',
  `serial_number` varchar(255) DEFAULT NULL COMMENT '设备序列号',
  `purchase_date` date NOT NULL COMMENT '购买日期',
  `warranty_exp` date DEFAULT NULL COMMENT '保修期截止日期',
  `status` varchar(50) DEFAULT NULL COMMENT '设备状态',
  `location` varchar(255) DEFAULT NULL COMMENT '设备所在位置',
  `remarks` text COMMENT '备注',
  `temperature` varchar(255) DEFAULT NULL COMMENT '温度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='设备管理表';

-- ----------------------------
-- Records of tb_device
-- ----------------------------
BEGIN;
INSERT INTO `tb_device` VALUES (1, '22', '2', '22', '2024-07-03', '2024-07-24', '2', '12', '12', '2');
INSERT INTO `tb_device` VALUES (2, '2', '1', '3', '2024-07-01', '2024-07-24', '1', '4', '4', '3');
INSERT INTO `tb_device` VALUES (3, '3', '1', '3', '2024-07-03', '2024-07-03', '1', '2', '2', '3');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

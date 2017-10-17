/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : money

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-10-17 23:38:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dp_admin_access
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_access`;
CREATE TABLE `dp_admin_access` (
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '模型名称',
  `group` varchar(16) NOT NULL DEFAULT '' COMMENT '权限分组标识',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `nid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '授权节点id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='统一授权表';

-- ----------------------------
-- Records of dp_admin_access
-- ----------------------------

-- ----------------------------
-- Table structure for dp_admin_action
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_action`;
CREATE TABLE `dp_admin_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '所属模块名',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '行为标题',
  `remark` varchar(128) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='系统行为表';

-- ----------------------------
-- Records of dp_admin_action
-- ----------------------------
INSERT INTO `dp_admin_action` VALUES ('1', 'user', 'user_add', '添加用户', '添加用户', '', '[user|get_nickname] 添加了用户：[record|get_nickname]', '1', '1480156399', '1480163853');
INSERT INTO `dp_admin_action` VALUES ('2', 'user', 'user_edit', '编辑用户', '编辑用户', '', '[user|get_nickname] 编辑了用户：[details]', '1', '1480164578', '1480297748');
INSERT INTO `dp_admin_action` VALUES ('3', 'user', 'user_delete', '删除用户', '删除用户', '', '[user|get_nickname] 删除了用户：[details]', '1', '1480168582', '1480168616');
INSERT INTO `dp_admin_action` VALUES ('4', 'user', 'user_enable', '启用用户', '启用用户', '', '[user|get_nickname] 启用了用户：[details]', '1', '1480169185', '1480169185');
INSERT INTO `dp_admin_action` VALUES ('5', 'user', 'user_disable', '禁用用户', '禁用用户', '', '[user|get_nickname] 禁用了用户：[details]', '1', '1480169214', '1480170581');
INSERT INTO `dp_admin_action` VALUES ('6', 'user', 'user_access', '用户授权', '用户授权', '', '[user|get_nickname] 对用户：[record|get_nickname] 进行了授权操作。详情：[details]', '1', '1480221441', '1480221563');
INSERT INTO `dp_admin_action` VALUES ('7', 'user', 'role_add', '添加角色', '添加角色', '', '[user|get_nickname] 添加了角色：[details]', '1', '1480251473', '1480251473');
INSERT INTO `dp_admin_action` VALUES ('8', 'user', 'role_edit', '编辑角色', '编辑角色', '', '[user|get_nickname] 编辑了角色：[details]', '1', '1480252369', '1480252369');
INSERT INTO `dp_admin_action` VALUES ('9', 'user', 'role_delete', '删除角色', '删除角色', '', '[user|get_nickname] 删除了角色：[details]', '1', '1480252580', '1480252580');
INSERT INTO `dp_admin_action` VALUES ('10', 'user', 'role_enable', '启用角色', '启用角色', '', '[user|get_nickname] 启用了角色：[details]', '1', '1480252620', '1480252620');
INSERT INTO `dp_admin_action` VALUES ('11', 'user', 'role_disable', '禁用角色', '禁用角色', '', '[user|get_nickname] 禁用了角色：[details]', '1', '1480252651', '1480252651');
INSERT INTO `dp_admin_action` VALUES ('12', 'user', 'attachment_enable', '启用附件', '启用附件', '', '[user|get_nickname] 启用了附件：附件ID([details])', '1', '1480253226', '1480253332');
INSERT INTO `dp_admin_action` VALUES ('13', 'user', 'attachment_disable', '禁用附件', '禁用附件', '', '[user|get_nickname] 禁用了附件：附件ID([details])', '1', '1480253267', '1480253340');
INSERT INTO `dp_admin_action` VALUES ('14', 'user', 'attachment_delete', '删除附件', '删除附件', '', '[user|get_nickname] 删除了附件：附件ID([details])', '1', '1480253323', '1480253323');
INSERT INTO `dp_admin_action` VALUES ('15', 'admin', 'config_add', '添加配置', '添加配置', '', '[user|get_nickname] 添加了配置，[details]', '1', '1480296196', '1480296196');
INSERT INTO `dp_admin_action` VALUES ('16', 'admin', 'config_edit', '编辑配置', '编辑配置', '', '[user|get_nickname] 编辑了配置：[details]', '1', '1480296960', '1480296960');
INSERT INTO `dp_admin_action` VALUES ('17', 'admin', 'config_enable', '启用配置', '启用配置', '', '[user|get_nickname] 启用了配置：[details]', '1', '1480298479', '1480298479');
INSERT INTO `dp_admin_action` VALUES ('18', 'admin', 'config_disable', '禁用配置', '禁用配置', '', '[user|get_nickname] 禁用了配置：[details]', '1', '1480298506', '1480298506');
INSERT INTO `dp_admin_action` VALUES ('19', 'admin', 'config_delete', '删除配置', '删除配置', '', '[user|get_nickname] 删除了配置：[details]', '1', '1480298532', '1480298532');
INSERT INTO `dp_admin_action` VALUES ('20', 'admin', 'database_export', '备份数据库', '备份数据库', '', '[user|get_nickname] 备份了数据库：[details]', '1', '1480298946', '1480298946');
INSERT INTO `dp_admin_action` VALUES ('21', 'admin', 'database_import', '还原数据库', '还原数据库', '', '[user|get_nickname] 还原了数据库：[details]', '1', '1480301990', '1480302022');
INSERT INTO `dp_admin_action` VALUES ('22', 'admin', 'database_optimize', '优化数据表', '优化数据表', '', '[user|get_nickname] 优化了数据表：[details]', '1', '1480302616', '1480302616');
INSERT INTO `dp_admin_action` VALUES ('23', 'admin', 'database_repair', '修复数据表', '修复数据表', '', '[user|get_nickname] 修复了数据表：[details]', '1', '1480302798', '1480302798');
INSERT INTO `dp_admin_action` VALUES ('24', 'admin', 'database_backup_delete', '删除数据库备份', '删除数据库备份', '', '[user|get_nickname] 删除了数据库备份：[details]', '1', '1480302870', '1480302870');
INSERT INTO `dp_admin_action` VALUES ('25', 'admin', 'hook_add', '添加钩子', '添加钩子', '', '[user|get_nickname] 添加了钩子：[details]', '1', '1480303198', '1480303198');
INSERT INTO `dp_admin_action` VALUES ('26', 'admin', 'hook_edit', '编辑钩子', '编辑钩子', '', '[user|get_nickname] 编辑了钩子：[details]', '1', '1480303229', '1480303229');
INSERT INTO `dp_admin_action` VALUES ('27', 'admin', 'hook_delete', '删除钩子', '删除钩子', '', '[user|get_nickname] 删除了钩子：[details]', '1', '1480303264', '1480303264');
INSERT INTO `dp_admin_action` VALUES ('28', 'admin', 'hook_enable', '启用钩子', '启用钩子', '', '[user|get_nickname] 启用了钩子：[details]', '1', '1480303294', '1480303294');
INSERT INTO `dp_admin_action` VALUES ('29', 'admin', 'hook_disable', '禁用钩子', '禁用钩子', '', '[user|get_nickname] 禁用了钩子：[details]', '1', '1480303409', '1480303409');
INSERT INTO `dp_admin_action` VALUES ('30', 'admin', 'menu_add', '添加节点', '添加节点', '', '[user|get_nickname] 添加了节点：[details]', '1', '1480305468', '1480305468');
INSERT INTO `dp_admin_action` VALUES ('31', 'admin', 'menu_edit', '编辑节点', '编辑节点', '', '[user|get_nickname] 编辑了节点：[details]', '1', '1480305513', '1480305513');
INSERT INTO `dp_admin_action` VALUES ('32', 'admin', 'menu_delete', '删除节点', '删除节点', '', '[user|get_nickname] 删除了节点：[details]', '1', '1480305562', '1480305562');
INSERT INTO `dp_admin_action` VALUES ('33', 'admin', 'menu_enable', '启用节点', '启用节点', '', '[user|get_nickname] 启用了节点：[details]', '1', '1480305630', '1480305630');
INSERT INTO `dp_admin_action` VALUES ('34', 'admin', 'menu_disable', '禁用节点', '禁用节点', '', '[user|get_nickname] 禁用了节点：[details]', '1', '1480305659', '1480305659');
INSERT INTO `dp_admin_action` VALUES ('35', 'admin', 'module_install', '安装模块', '安装模块', '', '[user|get_nickname] 安装了模块：[details]', '1', '1480307558', '1480307558');
INSERT INTO `dp_admin_action` VALUES ('36', 'admin', 'module_uninstall', '卸载模块', '卸载模块', '', '[user|get_nickname] 卸载了模块：[details]', '1', '1480307588', '1480307588');
INSERT INTO `dp_admin_action` VALUES ('37', 'admin', 'module_enable', '启用模块', '启用模块', '', '[user|get_nickname] 启用了模块：[details]', '1', '1480307618', '1480307618');
INSERT INTO `dp_admin_action` VALUES ('38', 'admin', 'module_disable', '禁用模块', '禁用模块', '', '[user|get_nickname] 禁用了模块：[details]', '1', '1480307653', '1480307653');
INSERT INTO `dp_admin_action` VALUES ('39', 'admin', 'module_export', '导出模块', '导出模块', '', '[user|get_nickname] 导出了模块：[details]', '1', '1480307682', '1480307682');
INSERT INTO `dp_admin_action` VALUES ('40', 'admin', 'packet_install', '安装数据包', '安装数据包', '', '[user|get_nickname] 安装了数据包：[details]', '1', '1480308342', '1480308342');
INSERT INTO `dp_admin_action` VALUES ('41', 'admin', 'packet_uninstall', '卸载数据包', '卸载数据包', '', '[user|get_nickname] 卸载了数据包：[details]', '1', '1480308372', '1480308372');
INSERT INTO `dp_admin_action` VALUES ('42', 'admin', 'system_config_update', '更新系统设置', '更新系统设置', '', '[user|get_nickname] 更新了系统设置：[details]', '1', '1480309555', '1480309642');

-- ----------------------------
-- Table structure for dp_admin_attachment
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_attachment`;
CREATE TABLE `dp_admin_attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `module` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名，由哪个模块上传的',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文件链接',
  `mime` varchar(128) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `ext` char(8) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT 'sha1 散列值',
  `driver` varchar(16) NOT NULL DEFAULT 'local' COMMENT '上传驱动',
  `download` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of dp_admin_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for dp_admin_config
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_config`;
CREATE TABLE `dp_admin_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '标题',
  `group` varchar(32) NOT NULL DEFAULT '' COMMENT '配置分组',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '类型',
  `value` text NOT NULL COMMENT '配置值',
  `options` text NOT NULL COMMENT '配置项',
  `tips` varchar(256) NOT NULL DEFAULT '' COMMENT '配置提示',
  `ajax_url` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框ajax地址',
  `next_items` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框的下级下拉框名，多个以逗号隔开',
  `param` varchar(32) NOT NULL DEFAULT '' COMMENT '联动下拉框请求参数名',
  `format` varchar(32) NOT NULL DEFAULT '' COMMENT '格式，用于格式文本',
  `table` varchar(32) NOT NULL DEFAULT '' COMMENT '表名，只用于快速联动类型',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '2' COMMENT '联动级别，只用于快速联动类型',
  `key` varchar(32) NOT NULL DEFAULT '' COMMENT '键字段，只用于快速联动类型',
  `option` varchar(32) NOT NULL DEFAULT '' COMMENT '值字段，只用于快速联动类型',
  `pid` varchar(32) NOT NULL DEFAULT '' COMMENT '父级id字段，只用于快速联动类型',
  `ak` varchar(32) NOT NULL DEFAULT '' COMMENT '百度地图appkey',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0禁用，1启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of dp_admin_config
-- ----------------------------
INSERT INTO `dp_admin_config` VALUES ('1', 'web_site_status', '站点开关', 'base', 'switch', '1', '', '站点关闭后将不能访问，后台可正常登录', '', '', '', '', '', '2', '', '', '', '', '1475240395', '1477403914', '1', '1');
INSERT INTO `dp_admin_config` VALUES ('2', 'web_site_title', '站点标题', 'base', 'text', '海豚PHP', '', '调用方式：<code>config(\'web_site_title\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475240646', '1477710341', '2', '1');
INSERT INTO `dp_admin_config` VALUES ('3', 'web_site_slogan', '站点标语', 'base', 'text', '海豚PHP，极简、极速、极致', '', '站点口号，调用方式：<code>config(\'web_site_slogan\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475240994', '1477710357', '3', '1');
INSERT INTO `dp_admin_config` VALUES ('4', 'web_site_logo', '站点LOGO', 'base', 'image', '', '', '', '', '', '', '', '', '2', '', '', '', '', '1475241067', '1475241067', '4', '1');
INSERT INTO `dp_admin_config` VALUES ('5', 'web_site_description', '站点描述', 'base', 'textarea', '', '', '网站描述，有利于搜索引擎抓取相关信息', '', '', '', '', '', '2', '', '', '', '', '1475241186', '1475241186', '6', '1');
INSERT INTO `dp_admin_config` VALUES ('6', 'web_site_keywords', '站点关键词', 'base', 'text', '海豚PHP、PHP开发框架、后台框架', '', '网站搜索引擎关键字', '', '', '', '', '', '2', '', '', '', '', '1475241328', '1475241328', '7', '1');
INSERT INTO `dp_admin_config` VALUES ('7', 'web_site_copyright', '版权信息', 'base', 'text', 'Copyright © 2015-2017 DolphinPHP All rights reserved.', '', '调用方式：<code>config(\'web_site_copyright\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475241416', '1477710383', '8', '1');
INSERT INTO `dp_admin_config` VALUES ('8', 'web_site_icp', '备案信息', 'base', 'text', '', '', '调用方式：<code>config(\'web_site_icp\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475241441', '1477710441', '9', '1');
INSERT INTO `dp_admin_config` VALUES ('9', 'web_site_statistics', '站点统计', 'base', 'textarea', '', '', '网站统计代码，支持百度、Google、cnzz等，调用方式：<code>config(\'web_site_statistics\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475241498', '1477710455', '10', '1');
INSERT INTO `dp_admin_config` VALUES ('10', 'config_group', '配置分组', 'system', 'array', 'base:基本\r\nsystem:系统\r\nupload:上传\r\ndevelop:开发\r\ndatabase:数据库', '', '', '', '', '', '', '', '2', '', '', '', '', '1475241716', '1477649446', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('11', 'form_item_type', '配置类型', 'system', 'array', 'text:单行文本\r\ntextarea:多行文本\r\nstatic:静态文本\r\npassword:密码\r\ncheckbox:复选框\r\nradio:单选按钮\r\ndate:日期\r\ndatetime:日期+时间\r\nhidden:隐藏\r\nswitch:开关\r\narray:数组\r\nselect:下拉框\r\nlinkage:普通联动下拉框\r\nlinkages:快速联动下拉框\r\nimage:单张图片\r\nimages:多张图片\r\nfile:单个文件\r\nfiles:多个文件\r\nueditor:UEditor 编辑器\r\nwangeditor:wangEditor 编辑器\r\neditormd:markdown 编辑器\r\nckeditor:ckeditor 编辑器\r\nicon:字体图标\r\ntags:标签\r\nnumber:数字\r\nbmap:百度地图\r\ncolorpicker:取色器\r\njcrop:图片裁剪\r\nmasked:格式文本\r\nrange:范围\r\ntime:时间', '', '', '', '', '', '', '', '2', '', '', '', '', '1475241835', '1495853193', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('12', 'upload_file_size', '文件上传大小限制', 'upload', 'text', '0', '', '0为不限制大小，单位：kb', '', '', '', '', '', '2', '', '', '', '', '1475241897', '1477663520', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('13', 'upload_file_ext', '允许上传的文件后缀', 'upload', 'tags', 'doc,docx,xls,xlsx,ppt,pptx,pdf,wps,txt,rar,zip,gz,bz2,7z', '', '多个后缀用逗号隔开，不填写则不限制类型', '', '', '', '', '', '2', '', '', '', '', '1475241975', '1477649489', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('14', 'upload_image_size', '图片上传大小限制', 'upload', 'text', '0', '', '0为不限制大小，单位：kb', '', '', '', '', '', '2', '', '', '', '', '1475242015', '1477663529', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('15', 'upload_image_ext', '允许上传的图片后缀', 'upload', 'tags', 'gif,jpg,jpeg,bmp,png', '', '多个后缀用逗号隔开，不填写则不限制类型', '', '', '', '', '', '2', '', '', '', '', '1475242056', '1477649506', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('16', 'list_rows', '分页数量', 'system', 'number', '20', '', '每页的记录数', '', '', '', '', '', '2', '', '', '', '', '1475242066', '1476074507', '101', '1');
INSERT INTO `dp_admin_config` VALUES ('17', 'system_color', '后台配色方案', 'system', 'radio', 'default', 'default:Default\r\namethyst:Amethyst\r\ncity:City\r\nflat:Flat\r\nmodern:Modern\r\nsmooth:Smooth', '', '', '', '', '', '', '2', '', '', '', '', '1475250066', '1477316689', '102', '1');
INSERT INTO `dp_admin_config` VALUES ('18', 'develop_mode', '开发模式', 'develop', 'radio', '1', '0:关闭\r\n1:开启', '', '', '', '', '', '', '2', '', '', '', '', '1476864205', '1476864231', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('19', 'app_trace', '显示页面Trace', 'develop', 'radio', '0', '0:否\r\n1:是', '', '', '', '', '', '', '2', '', '', '', '', '1476866355', '1476866355', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('21', 'data_backup_path', '数据库备份根路径', 'database', 'text', './data/', '', '路径必须以 / 结尾', '', '', '', '', '', '2', '', '', '', '', '1477017745', '1477018467', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('22', 'data_backup_part_size', '数据库备份卷大小', 'database', 'text', '20971520', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '', '', '', '', '', '2', '', '', '', '', '1477017886', '1477017886', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('23', 'data_backup_compress', '数据库备份文件是否启用压缩', 'database', 'radio', '1', '0:否\r\n1:是', '压缩备份文件需要PHP环境支持 <code>gzopen</code>, <code>gzwrite</code>函数', '', '', '', '', '', '2', '', '', '', '', '1477017978', '1477018172', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('24', 'data_backup_compress_level', '数据库备份文件压缩级别', 'database', 'radio', '9', '1:最低\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '', '', '', '', '', '2', '', '', '', '', '1477018083', '1477018083', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('25', 'top_menu_max', '顶部导航模块数量', 'system', 'text', '10', '', '设置顶部导航默认显示的模块数量', '', '', '', '', '', '2', '', '', '', '', '1477579289', '1477579289', '103', '1');
INSERT INTO `dp_admin_config` VALUES ('26', 'web_site_logo_text', '站点LOGO文字', 'base', 'image', '', '', '', '', '', '', '', '', '2', '', '', '', '', '1477620643', '1477620643', '5', '1');
INSERT INTO `dp_admin_config` VALUES ('27', 'upload_image_thumb', '缩略图尺寸', 'upload', 'text', '', '', '不填写则不生成缩略图，如需生成 <code>300x300</code> 的缩略图，则填写 <code>300,300</code> ，请注意，逗号必须是英文逗号', '', '', '', '', '', '2', '', '', '', '', '1477644150', '1477649513', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('28', 'upload_image_thumb_type', '缩略图裁剪类型', 'upload', 'radio', '1', '1:等比例缩放\r\n2:缩放后填充\r\n3:居中裁剪\r\n4:左上角裁剪\r\n5:右下角裁剪\r\n6:固定尺寸缩放', '该项配置只有在启用生成缩略图时才生效', '', '', '', '', '', '2', '', '', '', '', '1477646271', '1477649521', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('29', 'upload_thumb_water', '添加水印', 'upload', 'switch', '0', '', '', '', '', '', '', '', '2', '', '', '', '', '1477649648', '1477649648', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('30', 'upload_thumb_water_pic', '水印图片', 'upload', 'image', '', '', '只有开启水印功能才生效', '', '', '', '', '', '2', '', '', '', '', '1477656390', '1477656390', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('31', 'upload_thumb_water_position', '水印位置', 'upload', 'radio', '9', '1:左上角\r\n2:上居中\r\n3:右上角\r\n4:左居中\r\n5:居中\r\n6:右居中\r\n7:左下角\r\n8:下居中\r\n9:右下角', '只有开启水印功能才生效', '', '', '', '', '', '2', '', '', '', '', '1477656528', '1477656528', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('32', 'upload_thumb_water_alpha', '水印透明度', 'upload', 'text', '50', '', '请输入0~100之间的数字，数字越小，透明度越高', '', '', '', '', '', '2', '', '', '', '', '1477656714', '1477661309', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('33', 'wipe_cache_type', '清除缓存类型', 'system', 'checkbox', 'TEMP_PATH', 'TEMP_PATH:应用缓存\r\nLOG_PATH:应用日志\r\nCACHE_PATH:项目模板缓存', '清除缓存时，要删除的缓存类型', '', '', '', '', '', '2', '', '', '', '', '1477727305', '1477727305', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('34', 'captcha_signin', '后台验证码开关', 'system', 'switch', '0', '', '后台登录时是否需要验证码', '', '', '', '', '', '2', '', '', '', '', '1478771958', '1478771958', '99', '1');
INSERT INTO `dp_admin_config` VALUES ('35', 'home_default_module', '前台默认模块', 'system', 'select', 'index', '', '前台默认访问的模块，该模块必须有Index控制器和index方法', '', '', '', '', '', '0', '', '', '', '', '1486714723', '1486715620', '104', '1');
INSERT INTO `dp_admin_config` VALUES ('36', 'minify_status', '开启minify', 'system', 'switch', '0', '', '开启minify会压缩合并js、css文件，可以减少资源请求次数，如果不支持minify，可关闭', '', '', '', '', '', '0', '', '', '', '', '1487035843', '1487035843', '99', '1');
INSERT INTO `dp_admin_config` VALUES ('37', 'upload_driver', '上传驱动', 'upload', 'radio', 'local', 'local:本地', '图片或文件上传驱动', '', '', '', '', '', '0', '', '', '', '', '1501488567', '1501490821', '100', '1');

-- ----------------------------
-- Table structure for dp_admin_hook
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_hook`;
CREATE TABLE `dp_admin_hook` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `plugin` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子来自哪个插件',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子描述',
  `system` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统钩子',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='钩子表';

-- ----------------------------
-- Records of dp_admin_hook
-- ----------------------------
INSERT INTO `dp_admin_hook` VALUES ('1', 'admin_index', '', '后台首页', '1', '1468174214', '1477757518', '1');
INSERT INTO `dp_admin_hook` VALUES ('2', 'plugin_index_tab_list', '', '插件扩展tab钩子', '1', '1468174214', '1468174214', '1');
INSERT INTO `dp_admin_hook` VALUES ('3', 'module_index_tab_list', '', '模块扩展tab钩子', '1', '1468174214', '1468174214', '1');
INSERT INTO `dp_admin_hook` VALUES ('4', 'page_tips', '', '每个页面的提示', '1', '1468174214', '1468174214', '1');
INSERT INTO `dp_admin_hook` VALUES ('5', 'signin_footer', '', '登录页面底部钩子', '1', '1479269315', '1479269315', '1');
INSERT INTO `dp_admin_hook` VALUES ('6', 'signin_captcha', '', '登录页面验证码钩子', '1', '1479269315', '1479269315', '1');
INSERT INTO `dp_admin_hook` VALUES ('7', 'signin', '', '登录控制器钩子', '1', '1479386875', '1479386875', '1');
INSERT INTO `dp_admin_hook` VALUES ('8', 'upload_attachment', '', '附件上传钩子', '1', '1501493808', '1501493808', '1');
INSERT INTO `dp_admin_hook` VALUES ('9', 'page_plugin_js', '', '页面插件js钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `dp_admin_hook` VALUES ('10', 'page_plugin_css', '', '页面插件css钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `dp_admin_hook` VALUES ('11', 'signin_sso', '', '单点登录钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `dp_admin_hook` VALUES ('12', 'signout_sso', '', '单点退出钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `dp_admin_hook` VALUES ('13', 'user_add', '', '添加用户钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `dp_admin_hook` VALUES ('14', 'user_edit', '', '编辑用户钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `dp_admin_hook` VALUES ('15', 'user_delete', '', '删除用户钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `dp_admin_hook` VALUES ('16', 'user_enable', '', '启用用户钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `dp_admin_hook` VALUES ('17', 'user_disable', '', '禁用用户钩子', '1', '1503633591', '1503633591', '1');

-- ----------------------------
-- Table structure for dp_admin_hook_plugin
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_hook_plugin`;
CREATE TABLE `dp_admin_hook_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子id',
  `plugin` varchar(32) NOT NULL DEFAULT '' COMMENT '插件标识',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='钩子-插件对应表';

-- ----------------------------
-- Records of dp_admin_hook_plugin
-- ----------------------------
INSERT INTO `dp_admin_hook_plugin` VALUES ('1', 'admin_index', 'SystemInfo', '1477757503', '1477757503', '1', '1');
INSERT INTO `dp_admin_hook_plugin` VALUES ('2', 'admin_index', 'DevTeam', '1477755780', '1477755780', '2', '1');

-- ----------------------------
-- Table structure for dp_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_log`;
CREATE TABLE `dp_admin_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` longtext NOT NULL COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of dp_admin_log
-- ----------------------------
INSERT INTO `dp_admin_log` VALUES ('1', '35', '1', '2130706433', 'admin_module', '0', '超级管理员 安装了模块：金币', '1', '1506092169');
INSERT INTO `dp_admin_log` VALUES ('2', '30', '1', '2130706433', 'admin_menu', '214', '超级管理员 添加了节点：所属模块(money),所属节点ID(0),节点标题(金币),节点链接(money/index/index)', '1', '1506092196');
INSERT INTO `dp_admin_log` VALUES ('3', '30', '1', '2130706433', 'admin_menu', '215', '超级管理员 添加了节点：所属模块(money),所属节点ID(214),节点标题(金币管理),节点链接()', '1', '1506092215');
INSERT INTO `dp_admin_log` VALUES ('4', '30', '1', '2130706433', 'admin_menu', '216', '超级管理员 添加了节点：所属模块(money),所属节点ID(215),节点标题(金币明细),节点链接(money/index/index)', '1', '1506092245');
INSERT INTO `dp_admin_log` VALUES ('5', '30', '1', '2130706433', 'admin_menu', '223', '超级管理员 添加了节点：所属模块(money),所属节点ID(215),节点标题(交易类型管理),节点链接(money/type/index)', '1', '1506220723');
INSERT INTO `dp_admin_log` VALUES ('6', '32', '1', '2130706433', 'admin_menu', '223', '超级管理员 删除了节点：节点ID(223),节点标题(交易类型管理),节点链接(money/type/index)', '1', '1506220741');
INSERT INTO `dp_admin_log` VALUES ('7', '30', '1', '2130706433', 'admin_menu', '224', '超级管理员 添加了节点：所属模块(money),所属节点ID(215),节点标题(交易类型管理),节点链接(money/type/index)', '1', '1506220765');
INSERT INTO `dp_admin_log` VALUES ('8', '31', '1', '2130706433', 'admin_menu', '216', '超级管理员 编辑了节点：节点ID(216)', '1', '1507609047');
INSERT INTO `dp_admin_log` VALUES ('9', '31', '1', '2130706433', 'admin_menu', '215', '超级管理员 编辑了节点：节点ID(215)', '1', '1507609064');
INSERT INTO `dp_admin_log` VALUES ('10', '30', '1', '2130706433', 'admin_menu', '231', '超级管理员 添加了节点：所属模块(money),所属节点ID(215),节点标题(支付方式管理),节点链接(money/paytpye/index)', '1', '1507609272');
INSERT INTO `dp_admin_log` VALUES ('11', '32', '1', '2130706433', 'admin_menu', '231', '超级管理员 删除了节点：节点ID(231),节点标题(支付方式管理),节点链接(money/paytpye/index)', '1', '1507609465');
INSERT INTO `dp_admin_log` VALUES ('12', '30', '1', '2130706433', 'admin_menu', '238', '超级管理员 添加了节点：所属模块(money),所属节点ID(215),节点标题(支付方式管理),节点链接(money/pay_tpye/index)', '1', '1507609490');
INSERT INTO `dp_admin_log` VALUES ('13', '30', '1', '2130706433', 'admin_menu', '245', '超级管理员 添加了节点：所属模块(money),所属节点ID(215),节点标题(资金统计),节点链接(money/statistics/index)', '1', '1507711101');
INSERT INTO `dp_admin_log` VALUES ('14', '31', '1', '2130706433', 'admin_menu', '245', '超级管理员 编辑了节点：节点ID(245)', '1', '1507711126');
INSERT INTO `dp_admin_log` VALUES ('15', '30', '1', '2130706433', 'admin_menu', '252', '超级管理员 添加了节点：所属模块(money),所属节点ID(245),节点标题(图表),节点链接(money/statistics/echarts)', '1', '1507776126');
INSERT INTO `dp_admin_log` VALUES ('16', '31', '1', '2130706433', 'admin_menu', '216', '超级管理员 编辑了节点：节点ID(216)', '1', '1507777199');
INSERT INTO `dp_admin_log` VALUES ('17', '31', '1', '2130706433', 'admin_menu', '245', '超级管理员 编辑了节点：节点ID(245)', '1', '1508205318');
INSERT INTO `dp_admin_log` VALUES ('18', '31', '1', '2130706433', 'admin_menu', '214', '超级管理员 编辑了节点：节点ID(214)', '1', '1508205338');
INSERT INTO `dp_admin_log` VALUES ('19', '31', '1', '2130706433', 'admin_menu', '214', '超级管理员 编辑了节点：节点ID(214)', '1', '1508205705');
INSERT INTO `dp_admin_log` VALUES ('20', '31', '1', '2130706433', 'admin_menu', '214', '超级管理员 编辑了节点：节点ID(214)', '1', '1508205826');
INSERT INTO `dp_admin_log` VALUES ('21', '31', '1', '2130706433', 'admin_menu', '214', '超级管理员 编辑了节点：节点ID(214)', '1', '1508205965');
INSERT INTO `dp_admin_log` VALUES ('22', '31', '1', '2130706433', 'admin_menu', '245', '超级管理员 编辑了节点：节点ID(245)', '1', '1508207411');
INSERT INTO `dp_admin_log` VALUES ('23', '30', '1', '2130706433', 'admin_menu', '253', '超级管理员 添加了节点：所属模块(money),所属节点ID(215),节点标题(收入项),节点链接(money/income/index)', '1', '1508222957');
INSERT INTO `dp_admin_log` VALUES ('24', '31', '1', '2130706433', 'admin_menu', '253', '超级管理员 编辑了节点：节点ID(253)', '1', '1508225223');

-- ----------------------------
-- Table structure for dp_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_menu`;
CREATE TABLE `dp_admin_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级菜单id',
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '模块名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '菜单标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url_type` varchar(16) NOT NULL DEFAULT '' COMMENT '链接类型（link：外链，module：模块）',
  `url_value` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `url_target` varchar(16) NOT NULL DEFAULT '_self' COMMENT '链接打开方式：_blank,_self',
  `online_hide` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '网站上线后是否隐藏',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `system_menu` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统菜单，系统菜单不可删除',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `params` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=260 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of dp_admin_menu
-- ----------------------------
INSERT INTO `dp_admin_menu` VALUES ('1', '0', 'admin', '首页', 'fa fa-fw fa-home', 'module_admin', 'admin/index/index', '_self', '0', '1467617722', '1507789618', '1', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('2', '1', 'admin', '快捷操作', 'fa fa-fw fa-folder-open-o', 'module_admin', '', '_self', '0', '1467618170', '1477710695', '1', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('3', '2', 'admin', '清空缓存', 'fa fa-fw fa-trash-o', 'module_admin', 'admin/index/wipecache', '_self', '0', '1467618273', '1489049773', '3', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('4', '0', 'admin', '系统', 'fa fa-fw fa-gear', 'module_admin', 'admin/system/index', '_self', '0', '1467618361', '1507789618', '2', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('5', '4', 'admin', '系统功能', 'si si-wrench', 'module_admin', '', '_self', '0', '1467618441', '1477710695', '1', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('6', '5', 'admin', '系统设置', 'fa fa-fw fa-wrench', 'module_admin', 'admin/system/index', '_self', '0', '1467618490', '1477710695', '1', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('7', '5', 'admin', '配置管理', 'fa fa-fw fa-gears', 'module_admin', 'admin/config/index', '_self', '0', '1467618618', '1477710695', '2', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('8', '7', 'admin', '新增', '', 'module_admin', 'admin/config/add', '_self', '0', '1467618648', '1477710695', '1', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('9', '7', 'admin', '编辑', '', 'module_admin', 'admin/config/edit', '_self', '0', '1467619566', '1477710695', '2', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('10', '7', 'admin', '删除', '', 'module_admin', 'admin/config/delete', '_self', '0', '1467619583', '1477710695', '3', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('11', '7', 'admin', '启用', '', 'module_admin', 'admin/config/enable', '_self', '0', '1467619609', '1477710695', '4', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('12', '7', 'admin', '禁用', '', 'module_admin', 'admin/config/disable', '_self', '0', '1467619637', '1477710695', '5', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('13', '5', 'admin', '节点管理', 'fa fa-fw fa-bars', 'module_admin', 'admin/menu/index', '_self', '0', '1467619882', '1477710695', '3', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('14', '13', 'admin', '新增', '', 'module_admin', 'admin/menu/add', '_self', '0', '1467619902', '1477710695', '1', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('15', '13', 'admin', '编辑', '', 'module_admin', 'admin/menu/edit', '_self', '0', '1467620331', '1477710695', '2', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('16', '13', 'admin', '删除', '', 'module_admin', 'admin/menu/delete', '_self', '0', '1467620363', '1477710695', '3', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('17', '13', 'admin', '启用', '', 'module_admin', 'admin/menu/enable', '_self', '0', '1467620386', '1477710695', '4', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('18', '13', 'admin', '禁用', '', 'module_admin', 'admin/menu/disable', '_self', '0', '1467620404', '1477710695', '5', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('19', '68', 'user', '权限管理', 'fa fa-fw fa-key', 'module_admin', '', '_self', '0', '1467688065', '1477710702', '1', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('20', '19', 'user', '用户管理', 'fa fa-fw fa-user', 'module_admin', 'user/index/index', '_self', '0', '1467688137', '1477710702', '1', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('21', '20', 'user', '新增', '', 'module_admin', 'user/index/add', '_self', '0', '1467688177', '1477710702', '1', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('22', '20', 'user', '编辑', '', 'module_admin', 'user/index/edit', '_self', '0', '1467688202', '1477710702', '2', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('23', '20', 'user', '删除', '', 'module_admin', 'user/index/delete', '_self', '0', '1467688219', '1477710702', '3', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('24', '20', 'user', '启用', '', 'module_admin', 'user/index/enable', '_self', '0', '1467688238', '1477710702', '4', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('25', '20', 'user', '禁用', '', 'module_admin', 'user/index/disable', '_self', '0', '1467688256', '1477710702', '5', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('211', '64', 'admin', '日志详情', '', 'module_admin', 'admin/log/details', '_self', '0', '1480299320', '1480299320', '100', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('32', '4', 'admin', '扩展中心', 'si si-social-dropbox', 'module_admin', '', '_self', '0', '1467688853', '1477710695', '2', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('33', '32', 'admin', '模块管理', 'fa fa-fw fa-th-large', 'module_admin', 'admin/module/index', '_self', '0', '1467689008', '1477710695', '1', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('34', '33', 'admin', '导入', '', 'module_admin', 'admin/module/import', '_self', '0', '1467689153', '1477710695', '1', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('35', '33', 'admin', '导出', '', 'module_admin', 'admin/module/export', '_self', '0', '1467689173', '1477710695', '2', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('36', '33', 'admin', '安装', '', 'module_admin', 'admin/module/install', '_self', '0', '1467689192', '1477710695', '3', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('37', '33', 'admin', '卸载', '', 'module_admin', 'admin/module/uninstall', '_self', '0', '1467689241', '1477710695', '4', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('38', '33', 'admin', '启用', '', 'module_admin', 'admin/module/enable', '_self', '0', '1467689294', '1477710695', '5', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('39', '33', 'admin', '禁用', '', 'module_admin', 'admin/module/disable', '_self', '0', '1467689312', '1477710695', '6', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('40', '33', 'admin', '更新', '', 'module_admin', 'admin/module/update', '_self', '0', '1467689341', '1477710695', '7', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('41', '32', 'admin', '插件管理', 'fa fa-fw fa-puzzle-piece', 'module_admin', 'admin/plugin/index', '_self', '0', '1467689527', '1477710695', '2', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('42', '41', 'admin', '导入', '', 'module_admin', 'admin/plugin/import', '_self', '0', '1467689650', '1477710695', '1', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('43', '41', 'admin', '导出', '', 'module_admin', 'admin/plugin/export', '_self', '0', '1467689665', '1477710695', '2', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('44', '41', 'admin', '安装', '', 'module_admin', 'admin/plugin/install', '_self', '0', '1467689680', '1477710695', '3', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('45', '41', 'admin', '卸载', '', 'module_admin', 'admin/plugin/uninstall', '_self', '0', '1467689700', '1477710695', '4', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('46', '41', 'admin', '启用', '', 'module_admin', 'admin/plugin/enable', '_self', '0', '1467689730', '1477710695', '5', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('47', '41', 'admin', '禁用', '', 'module_admin', 'admin/plugin/disable', '_self', '0', '1467689747', '1477710695', '6', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('48', '41', 'admin', '设置', '', 'module_admin', 'admin/plugin/config', '_self', '0', '1467689789', '1477710695', '7', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('49', '41', 'admin', '管理', '', 'module_admin', 'admin/plugin/manage', '_self', '0', '1467689846', '1477710695', '8', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('50', '5', 'admin', '附件管理', 'fa fa-fw fa-cloud-upload', 'module_admin', 'admin/attachment/index', '_self', '0', '1467690161', '1477710695', '4', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('51', '70', 'admin', '文件上传', '', 'module_admin', 'admin/attachment/upload', '_self', '0', '1467690240', '1489049773', '1', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('52', '50', 'admin', '下载', '', 'module_admin', 'admin/attachment/download', '_self', '0', '1467690334', '1477710695', '2', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('53', '50', 'admin', '启用', '', 'module_admin', 'admin/attachment/enable', '_self', '0', '1467690352', '1477710695', '3', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('54', '50', 'admin', '禁用', '', 'module_admin', 'admin/attachment/disable', '_self', '0', '1467690369', '1477710695', '4', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('55', '50', 'admin', '删除', '', 'module_admin', 'admin/attachment/delete', '_self', '0', '1467690396', '1477710695', '5', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('56', '41', 'admin', '删除', '', 'module_admin', 'admin/plugin/delete', '_self', '0', '1467858065', '1477710695', '11', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('57', '41', 'admin', '编辑', '', 'module_admin', 'admin/plugin/edit', '_self', '0', '1467858092', '1477710695', '10', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('60', '41', 'admin', '新增', '', 'module_admin', 'admin/plugin/add', '_self', '0', '1467858421', '1477710695', '9', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('61', '41', 'admin', '执行', '', 'module_admin', 'admin/plugin/execute', '_self', '0', '1467879016', '1477710695', '14', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('62', '13', 'admin', '保存', '', 'module_admin', 'admin/menu/save', '_self', '0', '1468073039', '1477710695', '6', '1', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('64', '5', 'admin', '系统日志', 'fa fa-fw fa-book', 'module_admin', 'admin/log/index', '_self', '0', '1476111944', '1477710695', '6', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('65', '5', 'admin', '数据库管理', 'fa fa-fw fa-database', 'module_admin', 'admin/database/index', '_self', '0', '1476111992', '1477710695', '8', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('66', '32', 'admin', '数据包管理', 'fa fa-fw fa-database', 'module_admin', 'admin/packet/index', '_self', '0', '1476112326', '1477710695', '4', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('67', '19', 'user', '角色管理', 'fa fa-fw fa-users', 'module_admin', 'user/role/index', '_self', '0', '1476113025', '1477710702', '3', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('68', '0', 'user', '用户', 'fa fa-fw fa-user', 'module_admin', 'user/index/index', '_self', '0', '1476193348', '1507789618', '3', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('69', '32', 'admin', '钩子管理', 'fa fa-fw fa-anchor', 'module_admin', 'admin/hook/index', '_self', '0', '1476236193', '1477710695', '3', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('70', '2', 'admin', '后台首页', 'fa fa-fw fa-tachometer', 'module_admin', 'admin/index/index', '_self', '0', '1476237472', '1489049773', '1', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('71', '67', 'user', '新增', '', 'module_admin', 'user/role/add', '_self', '0', '1476256935', '1477710702', '1', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('72', '67', 'user', '编辑', '', 'module_admin', 'user/role/edit', '_self', '0', '1476256968', '1477710702', '2', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('73', '67', 'user', '删除', '', 'module_admin', 'user/role/delete', '_self', '0', '1476256993', '1477710702', '3', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('74', '67', 'user', '启用', '', 'module_admin', 'user/role/enable', '_self', '0', '1476257023', '1477710702', '4', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('75', '67', 'user', '禁用', '', 'module_admin', 'user/role/disable', '_self', '0', '1476257046', '1477710702', '5', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('76', '20', 'user', '授权', '', 'module_admin', 'user/index/access', '_self', '0', '1476375187', '1477710702', '6', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('77', '69', 'admin', '新增', '', 'module_admin', 'admin/hook/add', '_self', '0', '1476668971', '1477710695', '1', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('78', '69', 'admin', '编辑', '', 'module_admin', 'admin/hook/edit', '_self', '0', '1476669006', '1477710695', '2', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('79', '69', 'admin', '删除', '', 'module_admin', 'admin/hook/delete', '_self', '0', '1476669375', '1477710695', '3', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('80', '69', 'admin', '启用', '', 'module_admin', 'admin/hook/enable', '_self', '0', '1476669427', '1477710695', '4', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('81', '69', 'admin', '禁用', '', 'module_admin', 'admin/hook/disable', '_self', '0', '1476669564', '1477710695', '5', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('183', '66', 'admin', '安装', '', 'module_admin', 'admin/packet/install', '_self', '0', '1476851362', '1477710695', '1', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('184', '66', 'admin', '卸载', '', 'module_admin', 'admin/packet/uninstall', '_self', '0', '1476851382', '1477710695', '2', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('185', '5', 'admin', '行为管理', 'fa fa-fw fa-bug', 'module_admin', 'admin/action/index', '_self', '0', '1476882441', '1477710695', '7', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('186', '185', 'admin', '新增', '', 'module_admin', 'admin/action/add', '_self', '0', '1476884439', '1477710695', '1', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('187', '185', 'admin', '编辑', '', 'module_admin', 'admin/action/edit', '_self', '0', '1476884464', '1477710695', '2', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('188', '185', 'admin', '启用', '', 'module_admin', 'admin/action/enable', '_self', '0', '1476884493', '1477710695', '3', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('189', '185', 'admin', '禁用', '', 'module_admin', 'admin/action/disable', '_self', '0', '1476884534', '1477710695', '4', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('190', '185', 'admin', '删除', '', 'module_admin', 'admin/action/delete', '_self', '0', '1476884551', '1477710695', '5', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('191', '65', 'admin', '备份数据库', '', 'module_admin', 'admin/database/export', '_self', '0', '1476972746', '1477710695', '1', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('192', '65', 'admin', '还原数据库', '', 'module_admin', 'admin/database/import', '_self', '0', '1476972772', '1477710695', '2', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('193', '65', 'admin', '优化表', '', 'module_admin', 'admin/database/optimize', '_self', '0', '1476972800', '1477710695', '3', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('194', '65', 'admin', '修复表', '', 'module_admin', 'admin/database/repair', '_self', '0', '1476972825', '1477710695', '4', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('195', '65', 'admin', '删除备份', '', 'module_admin', 'admin/database/delete', '_self', '0', '1476973457', '1477710695', '5', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('210', '41', 'admin', '快速编辑', '', 'module_admin', 'admin/plugin/quickedit', '_self', '0', '1477713981', '1477713981', '100', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('209', '185', 'admin', '快速编辑', '', 'module_admin', 'admin/action/quickedit', '_self', '0', '1477713939', '1477713939', '100', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('208', '7', 'admin', '快速编辑', '', 'module_admin', 'admin/config/quickedit', '_self', '0', '1477713808', '1477713808', '100', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('207', '69', 'admin', '快速编辑', '', 'module_admin', 'admin/hook/quickedit', '_self', '0', '1477713770', '1477713770', '100', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('212', '2', 'admin', '个人设置', 'fa fa-fw fa-user', 'module_admin', 'admin/index/profile', '_self', '0', '1489049767', '1489049773', '2', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('213', '70', 'admin', '检查版本更新', '', 'module_admin', 'admin/index/checkupdate', '_self', '0', '1490588610', '1490588610', '100', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('214', '0', 'money', '资产管理', 'fa fa-fw fa-money', 'module_admin', 'money/index/index', '_self', '0', '1506092197', '1508205965', '4', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('215', '214', 'money', '资金管理', '', 'module_admin', '', '_self', '0', '1506092215', '1507609064', '1', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('216', '215', 'money', '资金流水明细', '', 'module_admin', 'money/index/index', '_self', '0', '1506092245', '1507777199', '1', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('217', '216', 'money', '新增', '', 'module_admin', 'money/index/add', '_self', '0', '1506092245', '1506092245', '1', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('218', '216', 'money', '编辑', '', 'module_admin', 'money/index/edit', '_self', '0', '1506092245', '1506092245', '1', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('219', '216', 'money', '删除', '', 'module_admin', 'money/index/delete', '_self', '0', '1506092245', '1506092245', '1', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('220', '216', 'money', '启用', '', 'module_admin', 'money/index/enable', '_self', '0', '1506092245', '1506092245', '1', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('221', '216', 'money', '禁用', '', 'module_admin', 'money/index/disable', '_self', '0', '1506092245', '1506092245', '1', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('222', '216', 'money', '快速编辑', '', 'module_admin', 'money/index/quickedit', '_self', '0', '1506092245', '1506092245', '1', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('224', '215', 'money', '交易类型管理', '', 'module_admin', 'money/type/index', '_self', '0', '1506220765', '1506220765', '2', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('225', '224', 'money', '新增', '', 'module_admin', 'money/type/add', '_self', '0', '1506220765', '1506220765', '2', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('226', '224', 'money', '编辑', '', 'module_admin', 'money/type/edit', '_self', '0', '1506220765', '1506220765', '2', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('227', '224', 'money', '删除', '', 'module_admin', 'money/type/delete', '_self', '0', '1506220765', '1506220765', '2', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('228', '224', 'money', '启用', '', 'module_admin', 'money/type/enable', '_self', '0', '1506220765', '1506220765', '2', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('229', '224', 'money', '禁用', '', 'module_admin', 'money/type/disable', '_self', '0', '1506220765', '1506220765', '2', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('230', '224', 'money', '快速编辑', '', 'module_admin', 'money/type/quickedit', '_self', '0', '1506220765', '1506220765', '2', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('243', '238', 'money', '禁用', '', 'module_admin', 'money/pay_tpye/disable', '_self', '0', '1507609490', '1507609490', '3', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('242', '238', 'money', '启用', '', 'module_admin', 'money/pay_tpye/enable', '_self', '0', '1507609490', '1507609490', '3', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('241', '238', 'money', '删除', '', 'module_admin', 'money/pay_tpye/delete', '_self', '0', '1507609490', '1507609490', '3', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('240', '238', 'money', '编辑', '', 'module_admin', 'money/pay_tpye/edit', '_self', '0', '1507609490', '1507609490', '3', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('239', '238', 'money', '新增', '', 'module_admin', 'money/pay_tpye/add', '_self', '0', '1507609490', '1507609490', '3', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('238', '215', 'money', '支付方式管理', '', 'module_admin', 'money/pay_tpye/index', '_self', '0', '1507609490', '1507609490', '3', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('244', '238', 'money', '快速编辑', '', 'module_admin', 'money/pay_tpye/quickedit', '_self', '0', '1507609490', '1507609490', '3', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('245', '215', 'money', '负债项统计', '', 'module_admin', 'money/statistics/index', '_self', '0', '1507711101', '1508207411', '4', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('246', '245', 'money', '新增', '', 'module_admin', 'money/statistics/add', '_self', '0', '1507711101', '1507711101', '5', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('247', '245', 'money', '编辑', '', 'module_admin', 'money/statistics/edit', '_self', '0', '1507711101', '1507711101', '5', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('248', '245', 'money', '删除', '', 'module_admin', 'money/statistics/delete', '_self', '0', '1507711101', '1507711101', '5', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('249', '245', 'money', '启用', '', 'module_admin', 'money/statistics/enable', '_self', '0', '1507711101', '1507711101', '5', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('250', '245', 'money', '禁用', '', 'module_admin', 'money/statistics/disable', '_self', '0', '1507711101', '1507711101', '5', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('251', '245', 'money', '快速编辑', '', 'module_admin', 'money/statistics/quickedit', '_self', '0', '1507711101', '1507711101', '5', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('252', '245', 'money', '图表', '', 'module_admin', 'money/statistics/echarts', '_self', '0', '1507776126', '1507776126', '1', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('253', '215', 'money', '收入项统计', '', 'module_admin', 'money/income/index', '_self', '0', '1508222957', '1508225223', '5', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('254', '253', 'money', '新增', '', 'module_admin', 'money/income/add', '_self', '0', '1508222957', '1508222957', '5', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('255', '253', 'money', '编辑', '', 'module_admin', 'money/income/edit', '_self', '0', '1508222957', '1508222957', '5', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('256', '253', 'money', '删除', '', 'module_admin', 'money/income/delete', '_self', '0', '1508222957', '1508222957', '5', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('257', '253', 'money', '启用', '', 'module_admin', 'money/income/enable', '_self', '0', '1508222957', '1508222957', '5', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('258', '253', 'money', '禁用', '', 'module_admin', 'money/income/disable', '_self', '0', '1508222957', '1508222957', '5', '0', '1', '');
INSERT INTO `dp_admin_menu` VALUES ('259', '253', 'money', '快速编辑', '', 'module_admin', 'money/income/quickedit', '_self', '0', '1508222957', '1508222957', '5', '0', '1', '');

-- ----------------------------
-- Table structure for dp_admin_module
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_module`;
CREATE TABLE `dp_admin_module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名称（标识）',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '模块标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `description` text NOT NULL COMMENT '描述',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者主页',
  `config` text COMMENT '配置信息',
  `access` text COMMENT '授权配置',
  `version` varchar(16) NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) NOT NULL DEFAULT '' COMMENT '模块唯一标识符',
  `system_module` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统模块',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='模块表';

-- ----------------------------
-- Records of dp_admin_module
-- ----------------------------
INSERT INTO `dp_admin_module` VALUES ('1', 'admin', '系统', 'fa fa-fw fa-gear', '系统模块，DolphinPHP的核心模块', 'DolphinPHP', 'http://www.dolphinphp.com', '', '', '1.0.0', 'admin.dolphinphp.module', '1', '1468204902', '1468204902', '100', '1');
INSERT INTO `dp_admin_module` VALUES ('2', 'user', '用户', 'fa fa-fw fa-user', '用户模块，DolphinPHP自带模块', 'DolphinPHP', 'http://www.dolphinphp.com', '', '', '1.0.0', 'user.dolphinphp.module', '1', '1468204902', '1468204902', '100', '1');
INSERT INTO `dp_admin_module` VALUES ('3', 'money', '资产管理', '', '资产模块', 'dears', '', '', '', '1.0.0', 'money.admin.index', '0', '1506092169', '1508205493', '100', '1');

-- ----------------------------
-- Table structure for dp_admin_packet
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_packet`;
CREATE TABLE `dp_admin_packet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '数据包名',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '数据包标题',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者url',
  `version` varchar(16) NOT NULL,
  `tables` text NOT NULL COMMENT '数据表名',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='数据包表';

-- ----------------------------
-- Records of dp_admin_packet
-- ----------------------------

-- ----------------------------
-- Table structure for dp_admin_plugin
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_plugin`;
CREATE TABLE `dp_admin_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '插件名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '插件标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `description` text NOT NULL COMMENT '插件描述',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者主页',
  `config` text NOT NULL COMMENT '配置信息',
  `version` varchar(16) NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) NOT NULL DEFAULT '' COMMENT '插件唯一标识符',
  `admin` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of dp_admin_plugin
-- ----------------------------
INSERT INTO `dp_admin_plugin` VALUES ('1', 'SystemInfo', '系统环境信息', 'fa fa-fw fa-info-circle', '在后台首页显示服务器信息', '蔡伟明', 'http://www.caiweiming.com', '{\"display\":\"1\",\"width\":\"6\"}', '1.0.0', 'system_info.ming.plugin', '0', '1477757503', '1477757503', '100', '1');
INSERT INTO `dp_admin_plugin` VALUES ('2', 'DevTeam', '开发团队成员信息', 'fa fa-fw fa-users', '开发团队成员信息', '蔡伟明', 'http://www.caiweiming.com', '{\"display\":\"1\",\"width\":\"6\"}', '1.0.0', 'dev_team.ming.plugin', '0', '1477755780', '1477755780', '100', '1');

-- ----------------------------
-- Table structure for dp_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_role`;
CREATE TABLE `dp_admin_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级角色',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '角色描述',
  `menu_auth` text NOT NULL COMMENT '菜单权限',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `access` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否可登录后台',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of dp_admin_role
-- ----------------------------
INSERT INTO `dp_admin_role` VALUES ('1', '0', '超级管理员', '系统默认创建的角色，拥有最高权限', '', '0', '1476270000', '1468117612', '1', '1');

-- ----------------------------
-- Table structure for dp_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_user`;
CREATE TABLE `dp_admin_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(96) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `email_bind` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否绑定邮箱地址',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `mobile_bind` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否绑定手机号码',
  `avatar` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '头像',
  `money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `role` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `group` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '部门id',
  `signup_ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '注册ip',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次登录时间',
  `last_login_ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '登录ip',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态：0禁用，1启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of dp_admin_user
-- ----------------------------
INSERT INTO `dp_admin_user` VALUES ('1', 'admin', '超级管理员', '$2y$10$Brw6wmuSLIIx3Yabid8/Wu5l8VQ9M/H/CG3C9RqN9dUCwZW3ljGOK', '', '0', '', '0', '0', '0.00', '0', '1', '0', '0', '1476065410', '1508243437', '1508243437', '2130706433', '100', '1');

-- ----------------------------
-- Table structure for dp_balance
-- ----------------------------
DROP TABLE IF EXISTS `dp_balance`;
CREATE TABLE `dp_balance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL COMMENT '支付方式名称',
  `balance` decimal(10,2) NOT NULL COMMENT '可用余额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='余额种类表';

-- ----------------------------
-- Records of dp_balance
-- ----------------------------
INSERT INTO `dp_balance` VALUES ('1', '微信', '60.65');
INSERT INTO `dp_balance` VALUES ('2', '支付宝', '880.37');
INSERT INTO `dp_balance` VALUES ('3', '招商银行', '0.19');
INSERT INTO `dp_balance` VALUES ('4', '农业银行', '16.92');
INSERT INTO `dp_balance` VALUES ('5', '中国银行', '7157.75');
INSERT INTO `dp_balance` VALUES ('6', '现金', '10.00');
INSERT INTO `dp_balance` VALUES ('7', '平安证券', '2128.20');

-- ----------------------------
-- Table structure for dp_money_details
-- ----------------------------
DROP TABLE IF EXISTS `dp_money_details`;
CREATE TABLE `dp_money_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `money` decimal(10,2) NOT NULL COMMENT '交易金额',
  `description` varchar(100) NOT NULL COMMENT '交易描述',
  `typeid` int(10) NOT NULL COMMENT '交易类型id',
  `type_pid` int(10) NOT NULL COMMENT '交易大类型id',
  `balanceid` int(10) NOT NULL COMMENT '支付 || 收款类型id',
  `create_time` char(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='金币详情表';

-- ----------------------------
-- Records of dp_money_details
-- ----------------------------
INSERT INTO `dp_money_details` VALUES ('1', '-14.00', '午餐 兰州拉面', '3', '1', '1', '1507379674');
INSERT INTO `dp_money_details` VALUES ('2', '-131.80', '电影票 3张', '103', '5', '1', '1507464327');
INSERT INTO `dp_money_details` VALUES ('3', '-10.00', '晚餐 腌面', '7', '1', '1', '1507464378');
INSERT INTO `dp_money_details` VALUES ('5', '-3.50', '早餐 稀饭鸡蛋', '2', '1', '2', '1507556103');
INSERT INTO `dp_money_details` VALUES ('6', '-14.00', '午餐 快餐', '3', '1', '2', '1507556165');
INSERT INTO `dp_money_details` VALUES ('7', '-48.00', '送父亲大人 车载手机支架', '105', '12', '2', '1507556196');
INSERT INTO `dp_money_details` VALUES ('8', '-887.00', '房租 + 水电费', '9', '6', '2', '1507556214');
INSERT INTO `dp_money_details` VALUES ('9', '-11.00', '晚餐 排骨面', '7', '1', '1', '1507556231');
INSERT INTO `dp_money_details` VALUES ('10', '-3.50', '早餐 稀饭鸡蛋', '2', '1', '2', '1507600251');
INSERT INTO `dp_money_details` VALUES ('12', '-12.00', '午餐 快餐', '3', '1', '2', '1507616304');
INSERT INTO `dp_money_details` VALUES ('13', '-10.00', '晚餐 燃面', '7', '1', '1', '1507639020');
INSERT INTO `dp_money_details` VALUES ('14', '-7.50', '水果 香蕉', '107', '4', '1', '1507639090');
INSERT INTO `dp_money_details` VALUES ('15', '-3.50', '早餐 稀饭鸡蛋', '2', '1', '2', '1507687622');
INSERT INTO `dp_money_details` VALUES ('24', '-10.00', '午餐 快餐', '3', '1', '2', '1507705936');
INSERT INTO `dp_money_details` VALUES ('41', '-20.00', '礼物 女神生日送腾讯会员一个月', '106', '12', '1', '1507716154');
INSERT INTO `dp_money_details` VALUES ('42', '1000.00', '[收款]支付宝收到中国银行的转账,收款金额100元,手续费0元', '108', '100', '2', '1507716512');
INSERT INTO `dp_money_details` VALUES ('43', '-1000.00', '[转账]中国银行向支付宝发起转账,转账金额100元,手续费0元', '108', '100', '5', '1507716512');
INSERT INTO `dp_money_details` VALUES ('44', '-6.00', '小吃 肉夹馍', '102', '4', '1', '1507722318');
INSERT INTO `dp_money_details` VALUES ('45', '-7.00', '晚餐 青菜面', '7', '1', '1', '1507723146');
INSERT INTO `dp_money_details` VALUES ('46', '-20.00', '桶装水', '110', '6', '6', '1507726119');
INSERT INTO `dp_money_details` VALUES ('47', '-3.50', '早餐 稀饭鸡蛋', '2', '1', '2', '1507772274');
INSERT INTO `dp_money_details` VALUES ('48', '-10.00', '午餐 快餐', '3', '1', '2', '1507787963');
INSERT INTO `dp_money_details` VALUES ('49', '-53.00', '礼物 补偿女神生日的下午茶', '106', '12', '1', '1507788016');
INSERT INTO `dp_money_details` VALUES ('50', '-7.00', '晚餐 凉皮', '7', '1', '1', '1507811450');
INSERT INTO `dp_money_details` VALUES ('51', '-2.62', '早餐 稀饭鸡蛋', '2', '1', '2', '1507858124');
INSERT INTO `dp_money_details` VALUES ('52', '1000.00', '[收款]平安证券收到中国银行的转账,收款金额为:1000元,手续费为:0元', '109', '100', '7', '1507864439');
INSERT INTO `dp_money_details` VALUES ('53', '-1000.00', '[转账]中国银行向平安证券发起转账,转账金额为:-1000元,手续费为:0元', '109', '100', '5', '1507864439');
INSERT INTO `dp_money_details` VALUES ('54', '-12.00', '午餐 快餐', '3', '1', '2', '1507875275');
INSERT INTO `dp_money_details` VALUES ('55', '-26.89', '零食', '101', '4', '1', '1507908563');
INSERT INTO `dp_money_details` VALUES ('56', '-86.75', '晚餐 四人组聚会餐', '8', '1', '2', '1507908720');
INSERT INTO `dp_money_details` VALUES ('57', '-26.00', '小吃 酸奶芒果', '102', '4', '2', '1507908796');
INSERT INTO `dp_money_details` VALUES ('58', '-3.50', '早餐 豆浆鸡蛋', '2', '1', '1', '1507935828');
INSERT INTO `dp_money_details` VALUES ('59', '-2.00', '矿泉水', '111', '4', '2', '1507938017');
INSERT INTO `dp_money_details` VALUES ('60', '-20.00', '裤子 泳裤', '117', '115', '1', '1507959751');
INSERT INTO `dp_money_details` VALUES ('61', '-50.00', '公交卡充值', '114', '6', '1', '1508061139');
INSERT INTO `dp_money_details` VALUES ('63', '-45.90', '雨伞', '119', '115', '1', '1508064772');
INSERT INTO `dp_money_details` VALUES ('64', '0.41', '微信红包', '121', '120', '1', '1508064910');
INSERT INTO `dp_money_details` VALUES ('65', '-1.00', '伏鑫手机充电', '123', '122', '1', '1507897325');
INSERT INTO `dp_money_details` VALUES ('66', '-5.00', '洗衣粉', '124', '115', '1', '1507907064');
INSERT INTO `dp_money_details` VALUES ('67', '-8.00', '衣架', '125', '115', '1', '1507907064');
INSERT INTO `dp_money_details` VALUES ('68', '-10.00', '晚餐 猪杂汤面', '7', '1', '1', '1508074292');
INSERT INTO `dp_money_details` VALUES ('69', '-3.50', '早餐 稀饭鸡蛋', '2', '1', '2', '1508116991');
INSERT INTO `dp_money_details` VALUES ('70', '-10.00', '午餐 快餐', '3', '1', '2', '1508129584');
INSERT INTO `dp_money_details` VALUES ('71', '-3.50', '早餐 稀饭鸡蛋', '2', '1', '2', '1508203862');
INSERT INTO `dp_money_details` VALUES ('72', '-13.00', '晚餐 肥肠面', '7', '1', '1', '1508155492');
INSERT INTO `dp_money_details` VALUES ('73', '-12.00', '午餐 快餐', '3', '1', '2', '1508216050');
INSERT INTO `dp_money_details` VALUES ('74', '-6.60', '零食 公司肉松饼+面包+辣条', '101', '4', '1', '1508216079');
INSERT INTO `dp_money_details` VALUES ('75', '-10.00', '晚餐 炸酱面', '7', '1', '1', '1508243949');

-- ----------------------------
-- Table structure for dp_type
-- ----------------------------
DROP TABLE IF EXISTS `dp_type`;
CREATE TABLE `dp_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typename` char(30) NOT NULL COMMENT '类型名称',
  `pid` int(10) NOT NULL,
  `sort` tinyint(1) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COMMENT='交易类型表';

-- ----------------------------
-- Records of dp_type
-- ----------------------------
INSERT INTO `dp_type` VALUES ('1', '吃饭饭', '0', '10');
INSERT INTO `dp_type` VALUES ('2', '早餐', '1', '11');
INSERT INTO `dp_type` VALUES ('3', '午餐', '1', '12');
INSERT INTO `dp_type` VALUES ('4', '非正餐食物', '0', '20');
INSERT INTO `dp_type` VALUES ('5', '娱乐', '0', '30');
INSERT INTO `dp_type` VALUES ('6', '固定负债项', '0', '40');
INSERT INTO `dp_type` VALUES ('7', '晚餐', '1', '13');
INSERT INTO `dp_type` VALUES ('8', '聚会餐', '1', '14');
INSERT INTO `dp_type` VALUES ('9', '房租水电', '6', '41');
INSERT INTO `dp_type` VALUES ('10', '手机话费', '6', '42');
INSERT INTO `dp_type` VALUES ('11', '宽带', '6', '43');
INSERT INTO `dp_type` VALUES ('12', '礼物', '0', '50');
INSERT INTO `dp_type` VALUES ('108', '充值转账', '100', '101');
INSERT INTO `dp_type` VALUES ('100', '转账', '0', '100');
INSERT INTO `dp_type` VALUES ('101', '零食', '4', '21');
INSERT INTO `dp_type` VALUES ('102', '小吃', '4', '22');
INSERT INTO `dp_type` VALUES ('103', '看电影', '5', '31');
INSERT INTO `dp_type` VALUES ('105', '亲情礼物', '12', '51');
INSERT INTO `dp_type` VALUES ('106', '友情礼物', '12', '52');
INSERT INTO `dp_type` VALUES ('107', '水果', '4', '23');
INSERT INTO `dp_type` VALUES ('109', '证券转账', '100', '102');
INSERT INTO `dp_type` VALUES ('110', '桶装水', '6', '44');
INSERT INTO `dp_type` VALUES ('111', '水', '4', '24');
INSERT INTO `dp_type` VALUES ('112', '衣服', '0', '60');
INSERT INTO `dp_type` VALUES ('113', '泳裤', '112', '61');
INSERT INTO `dp_type` VALUES ('114', '公交卡', '6', '45');
INSERT INTO `dp_type` VALUES ('115', '生活必须物品', '0', '70');
INSERT INTO `dp_type` VALUES ('116', '衣服', '115', '71');
INSERT INTO `dp_type` VALUES ('117', '裤子', '115', '72');
INSERT INTO `dp_type` VALUES ('118', '鞋子', '115', '73');
INSERT INTO `dp_type` VALUES ('119', '雨伞', '115', '74');
INSERT INTO `dp_type` VALUES ('120', '收入项', '0', '1');
INSERT INTO `dp_type` VALUES ('121', '抢红包', '120', '2');
INSERT INTO `dp_type` VALUES ('122', '其他支出项', '0', '80');
INSERT INTO `dp_type` VALUES ('123', '共享充电宝', '122', '81');
INSERT INTO `dp_type` VALUES ('124', '洗衣粉', '115', '75');
INSERT INTO `dp_type` VALUES ('125', '衣架', '115', '76');

-- ----------------------------
-- Table structure for today_deal
-- ----------------------------
DROP TABLE IF EXISTS `today_deal`;
CREATE TABLE `today_deal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deal_money` char(10) NOT NULL COMMENT '交易总金额',
  `deal_count` int(10) NOT NULL COMMENT '交易次数',
  `balance` char(10) NOT NULL COMMENT '余额',
  `create_time` char(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='日统计表';

-- ----------------------------
-- Records of today_deal
-- ----------------------------

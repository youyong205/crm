CREATE TABLE  `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(64) NOT NULL  COMMENT '登陆名',
  `password` varchar(64) NOT NULL COMMENT '用户密码',
  `realName` varchar(64) NOT NULL COMMENT '真实姓名',
  `shopId` int(11) NOT NULL COMMENT '搜索商户ID',
  `creationDate` datetime NOT NULL COMMENT '创建时间',
  `modifyDate` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `ix_userName` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户基本信息';

CREATE TABLE  `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL  COMMENT '角色名称',
  `des` varchar(64) NOT NULL  COMMENT '角色描述',
  `creationDate` datetime NOT NULL COMMENT '创建时间',
  `modifyDate` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色基本信息';

CREATE TABLE  `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) NOT NULL  COMMENT '资源模块',
  `name` varchar(64) NOT NULL  COMMENT '资源名称',
  `des` varchar(64) NOT NULL  COMMENT '资源描述',
  `creationDate` datetime NOT NULL COMMENT '创建时间',
  `modifyDate` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统资源基本信息';

CREATE TABLE `userRole`(
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  `creationDate` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关系';

CREATE TABLE `roleResource`(
  `roleId` int(11) NOT NULL,
  `resourceId` int(11) NOT NULL,
  `creationDate` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`roleId`,`resourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色资源关系';

CREATE TABLE  `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) NOT NULL  COMMENT '模块名',
  `operation` varchar(64) NOT NULL COMMENT '操作名',
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `detail` varchar(1024) NOT NULL COMMENT '操作内容',
  `creationDate` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `ix_module_operation` (`module`,`operation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户操作日志';

CREATE TABLE  `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bossId` int(11) NOT NULL  COMMENT '老板ID',
  `name` varchar(64) NOT NULL  COMMENT '名称',
  `address` varchar(64) NOT NULL  COMMENT '地址',
  `area` double NOT NULL  COMMENT '面积',
  `rent` double NOT NULL  COMMENT '房租',
  `staff1` int(11) NOT NULL  COMMENT '前厅员⼯工总数',
  `salary1` int(11) NOT NULL  COMMENT '前厅员工薪资',
  `staff2` int(11) NOT NULL  COMMENT '后厅员⼯工总数',
  `salary2` int(11) NOT NULL  COMMENT '后厅员工薪资',
  `sales` int(11) NOT NULL  COMMENT '上月应用总额',
  `purchase` int(11) NOT NULL  COMMENT '上月采购总额',
  `interest` double NOT NULL COMMENT '上月毛利率',
  `creationDate` datetime NOT NULL COMMENT '创建时间',
  `modifyDate` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户基本信息';

CREATE TABLE  `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopId` int(11) NOT NULL  COMMENT '商户ID',
  `name` varchar(64) NOT NULL  COMMENT '名称',
  `price` double NOT NULL  COMMENT '价格',
  `count` int(11) NOT NULL  COMMENT '售卖数量',
  `detail` varchar(1024) NOT NULL COMMENT '详细信息',
  `creationDate` datetime NOT NULL COMMENT '创建时间',
  `modifyDate` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单基本信息';

CREATE TABLE  `orderInfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopId` int(11) NOT NULL  COMMENT '商户ID',
  `period` datetime NOT NULL  COMMENT '时间',
  `type` int(11) NOT NULL  COMMENT '类型',
  `weather` int(11) NOT NULL  COMMENT '天气类型',
  `money1` double NOT NULL  COMMENT '现金价格',
  `money2` double NOT NULL  COMMENT '刷卡价格',
  `money3` double NOT NULL  COMMENT '团购价格',
  `tableNumber` int(11) NOT NULL  COMMENT '桌数',
  `number` int(11) NOT NULL  COMMENT '人数',
  `detail` varchar(1024) NOT NULL COMMENT '详细信息',
  `creationDate` datetime NOT NULL COMMENT '创建时间',
  `modifyDate` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单基本信息';

CREATE TABLE  `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopId` int(11) NOT NULL  COMMENT '商户ID',
  `period` datetime NOT NULL  COMMENT '时间',
  `money` double NOT NULL  COMMENT '价格',
  `number` int(11) NOT NULL  COMMENT '人数',
  `creationDate` datetime NOT NULL COMMENT '创建时间',
  `modifyDate` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shopId_period` (`shopId`,`period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报表基本信息';


insert into resource values(1,"用户模块","详情","",now(),now());
insert into resource values(2,"用户模块","新增","",now(),now());
insert into resource values(3,"用户模块","编辑","",now(),now());
insert into resource values(4,"用户模块","删除","",now(),now());
insert into resource values(5,"角色模块","详情","",now(),now());
insert into resource values(6,"角色模块","新增","",now(),now());
insert into resource values(7,"角色模块","编辑","",now(),now());
insert into resource values(8,"角色模块","删除","",now(),now());
insert into resource values(9,"资源模块","详情","",now(),now());
insert into resource values(10,"资源模块","新增","",now(),now());
insert into resource values(11,"资源模块","编辑","",now(),now());
insert into resource values(12,"资源模块","删除","",now(),now());
insert into resource values(13,"日志模块","详情","",now(),now());
insert into resource values(14,"日志模块","新增","",now(),now());
insert into resource values(15,"日志模块","编辑","",now(),now());
insert into resource values(16,"日志模块","删除","",now(),now());
insert into resource values(17,"商户模块","详情","",now(),now());
insert into resource values(18,"商户模块","新增","",now(),now());
insert into resource values(19,"商户模块","编辑","",now(),now());
insert into resource values(21,"商户模块","删除","",now(),now());
insert into resource values(22,"菜单模块","详情","",now(),now());
insert into resource values(23,"菜单模块","新增","",now(),now());
insert into resource values(24,"菜单模块","编辑","",now(),now());
insert into resource values(25,"菜单模块","删除","",now(),now());
insert into resource values(26,"订单模块","详情","",now(),now());
insert into resource values(27,"订单模块","新增","",now(),now());
insert into resource values(28,"订单模块","编辑","",now(),now());
insert into resource values(29,"订单模块","删除","",now(),now());
insert into resource values(30,"报表模块","详情","",now(),now());
insert into resource values(31,"员工模块","详情","",now(),now());
insert into resource values(32,"员工模块","新增","",now(),now());
insert into resource values(33,"员工模块","编辑","",now(),now());
insert into resource values(34,"员工模块","删除","",now(),now());








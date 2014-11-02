CREATE TABLE  `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(64) NOT NULL  COMMENT '登陆名',
  `password` varchar(64) NOT NULL COMMENT '用户密码',
  `realName` varchar(64) NOT NULL COMMENT '真实姓名',
  `role` int(11) NOT NULL COMMENT '1/管理员,2/数据录入员,３/普通用户',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报表基本信息';











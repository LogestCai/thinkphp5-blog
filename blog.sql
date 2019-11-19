/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : money

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-11-19 15:34:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `think_admin`
-- ----------------------------
DROP TABLE IF EXISTS `think_admin`;
CREATE TABLE `think_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `username` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '管理员名',
  `password` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '密码',
  `portrait` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像',
  `loginnum` int(11) DEFAULT '0' COMMENT '登陆次数',
  `last_login_ip` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '最后登录IP',
  `last_login_time` int(11) DEFAULT NULL COMMENT '最后登录时间',
  `real_name` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '真实姓名',
  `phone` varchar(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机号',
  `status` int(1) DEFAULT NULL COMMENT '状态 1：开启  2:禁用',
  `groupid` int(11) DEFAULT '1' COMMENT '用户角色id',
  `create_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='后台管理员表';

-- ----------------------------
-- Records of think_admin
-- ----------------------------
INSERT INTO `think_admin` VALUES ('1', 'admin', '4dc94196fd5bd03a167758456ba47fb9', '/uploads/face/20181116/63a0f7d99db522e14873f9b0b4e7ff85.png', '1783', '127.0.0.1', '1574143326', 'PC', '13057633120', '1', '1', '1523792661', '1542614290');
INSERT INTO `think_admin` VALUES ('2', 'kevin', '4dc94196fd5bd03a167758456ba47fb9', '/uploads/face/20181116/8470a4efd862cbad73754f9ca7a5596f.png', '288', '127.0.0.1', '1572830901', 'SDSA', '13057633125', '1', '2', '1523792666', '1572394833');

-- ----------------------------
-- Table structure for `think_adv`
-- ----------------------------
DROP TABLE IF EXISTS `think_adv`;
CREATE TABLE `think_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '广告标题',
  `link_url` varchar(200) NOT NULL DEFAULT '' COMMENT '链接地址',
  `group` int(11) NOT NULL DEFAULT '0' COMMENT '广告分类分组',
  `img_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `description` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '广告类型1:轮播图广告;2:静态图片广告;3:文字广告',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `expir_time` datetime DEFAULT NULL COMMENT '到期时间',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `start_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_adv
-- ----------------------------
INSERT INTO `think_adv` VALUES ('1', '首页轮播图1', 'http://www.baidu.com', '1', '/uploads/images/20191108/27f2ae7afde63a5aa01ba5b925d694cf.jpg', '这是首页的轮播图1', '2', '2019-11-08 12:37:30', '2019-11-19 14:05:07', '2019-11-30 22:35:35', '1', '2019-11-08 12:35:35');
INSERT INTO `think_adv` VALUES ('2', '首页轮播图2', 'http://www.baidu.com', '1', '/uploads/images/20191108/fb2d226499fc512863a9d419b425619d.jpg', '这是首页轮播图2', '1', '2019-11-08 12:38:28', '2019-11-08 12:38:28', '2019-11-16 15:35:32', '1', '2019-11-08 12:35:32');
INSERT INTO `think_adv` VALUES ('3', '首页轮播图3', 'http://www.baidu.com', '1', '/uploads/images/20191108/41f5a75a5fc1d44fa3292c3f26488b3d.jpg', '', '1', '2019-11-08 12:39:09', '2019-11-08 12:39:09', '2019-11-23 19:35:30', '1', '2019-11-08 12:35:30');

-- ----------------------------
-- Table structure for `think_adv_group`
-- ----------------------------
DROP TABLE IF EXISTS `think_adv_group`;
CREATE TABLE `think_adv_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_adv_group
-- ----------------------------
INSERT INTO `think_adv_group` VALUES ('1', '首页轮播图');
INSERT INTO `think_adv_group` VALUES ('2', '列表页广告');
INSERT INTO `think_adv_group` VALUES ('3', '分服务3');
INSERT INTO `think_adv_group` VALUES ('4', '发的8');
INSERT INTO `think_adv_group` VALUES ('5', '发的发的');

-- ----------------------------
-- Table structure for `think_article`
-- ----------------------------
DROP TABLE IF EXISTS `think_article`;
CREATE TABLE `think_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章逻辑ID',
  `title` varchar(255) NOT NULL COMMENT '文章标题',
  `cate_id` int(11) NOT NULL DEFAULT '1' COMMENT '文章类别',
  `photo` text COMMENT '文章图片',
  `remark` varchar(256) DEFAULT '' COMMENT '文章描述',
  `keyword` varchar(32) DEFAULT '' COMMENT '文章关键字',
  `content` text NOT NULL COMMENT '文章内容',
  `ora_content` text,
  `editor` varchar(30) NOT NULL DEFAULT 'editormd',
  `views` int(11) NOT NULL DEFAULT '1' COMMENT '浏览量',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '文章类型',
  `is_tui` int(1) DEFAULT '0' COMMENT '是否推荐',
  `from` varchar(16) NOT NULL DEFAULT '' COMMENT '来源',
  `writer` varchar(64) NOT NULL COMMENT '作者',
  `ip` varchar(16) NOT NULL,
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 1：开启   2：关闭',
  `music` varchar(255) DEFAULT NULL COMMENT '音频',
  `is_pub` tinyint(1) NOT NULL DEFAULT '0',
  `pub_time` datetime DEFAULT NULL,
  `is_hot` tinyint(1) NOT NULL DEFAULT '0',
  `is_img` tinyint(1) NOT NULL DEFAULT '0',
  `orderby` mediumint(8) NOT NULL DEFAULT '50',
  `tags` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `a_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of think_article
-- ----------------------------
INSERT INTO `think_article` VALUES ('106', 'VIM编辑器使用命令', '10', '/uploads/images/20191119/6fd9dee544109c8c87659da126ee0b8b.jpg', '是的否v多少否v是大V发v', '方式大V发v是待v', '<blockquote>\r\n<p> vi的基本概念</p>\r\n</blockquote>\r\n<p>基本上vi可以分为三种状态，分别是<br>命令模式（command mode）<br>插入模式（Insert mode）<br>底行模式（last line mode）<br>1) 命令行模式command mode）<br>控制屏幕光标的移动，字符、字或行的删除，移动复制某区段及进入Insert mode下，或者到 last line mode。<br>2) 插入模式（Insert mode）<br>只有在Insert mode下，才可以做文字输入，按[ESC]键可回到命令行模式。<br>3) 底行模式（last line mode）<br>将文件保存或退出vi，也可以设置编辑环境，如寻找字符串、列出行号……等。<br>不过一般我们在使用时把vi简化成两个模式，就是将底行模式（last line mode）也算入命令行模式command mode）。</p>\r\n<blockquote>\r\n<p>2、vi的基本操作</p>\r\n</blockquote>\r\n<p>a) 进入vi<br>在系统提示符号输入vi及文件名称后，就进入vi全屏幕编辑画面：<br>$ vi myfile<br>不过有一点要特别注意，就是您进入vi之后，是处于[命令行模式（command mode）]，您要切换到[插入模式（Insert mode）]才能够输入文字。初次使用vi的人都会想先用上下左右键移动光标，结果电脑一直哔哔叫，把自己气个半死，所以进入vi后，先不要乱动，转换到 [插入模式（Insert mode）]再说吧！<br>b) 切换至插入模式（Insert mode）编辑文件<br>在[命令行模式（command mode）]下按一下字母i就可以进入[插入模式（Insert mode）]，这时候你就可以开始输入文字了。<br>c) Insert 的切换<br>您目前处于[插入模式（Insert mode）]，您就只能一直输入文字，如果您发现输错了字！想用光标键往回移动，将该字删除，就要先按一下[ESC]键转到[命令行模式（command mode）]再删除文字。<br>d) 退出vi及保存文件<br>命令行模式下保存并退出：输入ZZ<br>在[命令行模式（command mode）]下，按一下[：]冒号键进入[Last line mode]，例如：<br>: w filename （输入 [w filename]将文章以指定的文件名filename保存）<br>: wq (输入[wq]，存盘并退出vi)<br>: q! (输入q!， 不存盘强制退出vi)<br>:x (执行保存并退出vi编辑器)</p>\r\n<blockquote>\r\n<p>3、命令行模式（command mode）功能键</p>\r\n</blockquote>\r\n<p>1）. 插入模式<br>按切换进入插入模式，按“i”进入插入模式后是从光标当前位置开始输入文件；<br>按[a]进入插入模式后，是从目前光标所在位置的下一个位置开始输入文字；<br>按[o]进入插入模式后，是插入新的一行，从行首开始输入文字。<br>2）. 从插入模式切换为命令行模式<br>按[ESC]键。<br>3）. 移动光标<br>vi可以直接用键盘上的光标来上下左右移动，但正规的vi是用小写英文字母[h]、[j]、[k]、[l]，分别控制光标左、下、上、右移一格。<br>按[ctrl]+[b]：屏幕往“后”移动一页。<br>按[ctrl]+[f]：屏幕往“前”移动一页。<br>按[ctrl]+[u]：屏幕往“后”移动半页。<br>按[ctrl]+[d]：屏幕往“前”移动半页。<br>按[gg]：移动到文章的首行。(可能只在Vim中有效)<br>按[G]：移动到文章的最后。<br>按[$]：移动到光标所在行的“行尾”。<br>按[^]：移动到光标所在行的“行首”<br>按[w]：光标跳到下个字的开头<br>按[e]：光标跳到下个字的字尾<br>按[b]：光标回到上个字的开头<br>按[#l]：光标移到该行的第#个位置，如：5l,56l。<br>Vi还提供了三个关于光标在全屏幕上移动并且文件本身不发生滚动的命令。它们分别是H、M和L命令。<br>(1)H命令<br>该命令将光标移至屏幕首行的行首（即左上角），也就是当前屏幕的第一行，而不是整个文件的第一行。利用此命令可以快速将光标移至屏幕顶部。若在H命令之前加上数字n，则将光标移至第n行的行首。值得一提的是，使用命令dH将会删除从光标当前所在行至所显示屏幕首行的全部内容。<br>(2)M命令<br>该命令将光标移至屏幕显示文件的中间行的行首。即如果当前屏幕已经充满,则移动到整个屏幕的中间行；如果并未充满，则移动到文本的那些行的中间行。利用此命令可以快速地将光标从屏幕的任意位置移至屏幕显示文件的中间行的行首。例如，在上面屏幕显示的情况下（不论光标在屏幕的何处），在命令模式下，输入命令M之后，光标都将移到add这一行的字母a上。同样值得一提的是，使用命令dM将会删除从光标当前所在行至屏幕显示文件的中间行的全部内容。<br>(3)L命令<br>当文件显示内容超过一屏时，该命令将光标移至屏幕上的最底行的行首；当文件显示内容不足一屏时，该命令将光标移至文件的最后一行的行首。可见，利用此命令可以快速准确地将光标移至屏幕底部或文件的最后一行。若在L命令之前加上数字n，则将光标移至从屏幕底部算起第n行的行首。同样值得一提的是，使用命令dL将会删除从光标当前行至屏幕底行的全部内容。<br>4）. 删除文字<br>[x]：每按一次，删除光标所在位置的“后面”一个字符。<br>[#x]：例如，[6x]表示删除光标所在位置的“后面”6个字符。<br>[X]：大写的X，每按一次，删除光标所在位置的“前面”一个字符。<br>[#X]：例如，[20X]表示删除光标所在位置的“前面”20个字符。<br>[dd]：删除光标所在行。<br>[#dd]：从光标所在行开始删除#行<br>5）. 复制<br>[yw]：将光标所在之处到字尾的字符复制到缓冲区中。<br>[#yw]：复制#个字到缓冲区<br>[yy]：复制光标所在行到缓冲区。<br>[#yy]：例如，[6yy]表示拷贝从光标所在的该行“往下数”6行文字。<br>[p]：将缓冲区内的字符贴到光标所在位置。注意：所有与“y”有关的复制命令都必须与“p”配合才能完成复制与粘贴功能。<br>6）. 替换<br>[r]：替换光标所在处的字符。<br>[R]：替换光标所到之处的字符，直到按下[ESC]键为止。<br>7）. 恢复上一次操作<br>[u]：如果您误执行一个命令，可以马上按下，回到上一个操作。按多次“u”可以执行多次回复。<br>8）. 更改<br>[cw]：更改光标所在处的字到字尾处<br>[c#w]：例如，[c3w]表示更改3个字<br>9）.撤销更改<br>[u]：撤销上一次更改，可以一直按[u]，一直撤销到最旧修改状态。<br>[ctrl]+[r]：恢复撤销的更改，可以一直按该组合键达到最新的改变。<br>10）. 跳至指定的行<br>[ctrl]+[g]列出光标所在行的行号。<br>[#G]：例如，[15G]，表示移动光标至文章的第15行行首。</p>\r\n<blockquote>\r\n<p>4、Last line mode下命令简介</p>\r\n</blockquote>\r\n<p>在使用[last line mode]之前，请记住先按[ESC]键确定您已经处于[command mode]下后，再按[：]冒号即可进入[last line mode]。<br>A) 列出行号<br>[set nu]：输入[set nu]后，会在文件中的每一行前面列出行号。<br>B) 跳到文件中的某一行<br>[#]：[#]号表示一个数字，在冒号后输入一个数字，再按回车键就会跳到该行了，如输入数字15，再回车，就会跳到文章的第15行。<br>C) 查找字符<br>[/关键字]：先按[/]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往后寻找到您要的关键字为止。<br>[?关键字]：先按[?]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往前寻找到您要的关键字为止。<br>D) 保存文件<br>[w]：在冒号输入字母[w]就可以将文件保存起来。<br>E) 离开vi<br>[q]：按[q]就是退出，如果无法离开vi，可以在[q]后跟一个[!]强制离开vi。<br>[wq]：一般建议离开时，搭配[w]一起使用，这样在退出的时候还可以保存文件，可以在后面再跟[！]强制保存退出。<br>[ZZ]：保存并退出vi。</p>\r\n', '>  vi的基本概念\r\n\r\n基本上vi可以分为三种状态，分别是\r\n命令模式（command mode）\r\n插入模式（Insert mode）\r\n底行模式（last line mode）\r\n1) 命令行模式command mode）\r\n控制屏幕光标的移动，字符、字或行的删除，移动复制某区段及进入Insert mode下，或者到 last line mode。\r\n2) 插入模式（Insert mode）\r\n只有在Insert mode下，才可以做文字输入，按[ESC]键可回到命令行模式。\r\n3) 底行模式（last line mode）\r\n将文件保存或退出vi，也可以设置编辑环境，如寻找字符串、列出行号……等。\r\n不过一般我们在使用时把vi简化成两个模式，就是将底行模式（last line mode）也算入命令行模式command mode）。\r\n> 2、vi的基本操作\r\n\r\na) 进入vi\r\n在系统提示符号输入vi及文件名称后，就进入vi全屏幕编辑画面：\r\n$ vi myfile\r\n不过有一点要特别注意，就是您进入vi之后，是处于[命令行模式（command mode）]，您要切换到[插入模式（Insert mode）]才能够输入文字。初次使用vi的人都会想先用上下左右键移动光标，结果电脑一直哔哔叫，把自己气个半死，所以进入vi后，先不要乱动，转换到 [插入模式（Insert mode）]再说吧！\r\nb) 切换至插入模式（Insert mode）编辑文件\r\n在[命令行模式（command mode）]下按一下字母i就可以进入[插入模式（Insert mode）]，这时候你就可以开始输入文字了。\r\nc) Insert 的切换\r\n您目前处于[插入模式（Insert mode）]，您就只能一直输入文字，如果您发现输错了字！想用光标键往回移动，将该字删除，就要先按一下[ESC]键转到[命令行模式（command mode）]再删除文字。\r\nd) 退出vi及保存文件\r\n命令行模式下保存并退出：输入ZZ\r\n在[命令行模式（command mode）]下，按一下[：]冒号键进入[Last line mode]，例如：\r\n: w filename （输入 [w filename]将文章以指定的文件名filename保存）\r\n: wq (输入[wq]，存盘并退出vi)\r\n: q! (输入q!， 不存盘强制退出vi)\r\n:x (执行保存并退出vi编辑器)\r\n> 3、命令行模式（command mode）功能键\r\n\r\n1）. 插入模式\r\n按切换进入插入模式，按“i”进入插入模式后是从光标当前位置开始输入文件；\r\n按[a]进入插入模式后，是从目前光标所在位置的下一个位置开始输入文字；\r\n按[o]进入插入模式后，是插入新的一行，从行首开始输入文字。\r\n2）. 从插入模式切换为命令行模式\r\n按[ESC]键。\r\n3）. 移动光标\r\nvi可以直接用键盘上的光标来上下左右移动，但正规的vi是用小写英文字母[h]、[j]、[k]、[l]，分别控制光标左、下、上、右移一格。\r\n按[ctrl]+[b]：屏幕往“后”移动一页。\r\n按[ctrl]+[f]：屏幕往“前”移动一页。\r\n按[ctrl]+[u]：屏幕往“后”移动半页。\r\n按[ctrl]+[d]：屏幕往“前”移动半页。\r\n按[gg]：移动到文章的首行。(可能只在Vim中有效)\r\n按[G]：移动到文章的最后。\r\n按[$]：移动到光标所在行的“行尾”。\r\n按[^]：移动到光标所在行的“行首”\r\n按[w]：光标跳到下个字的开头\r\n按[e]：光标跳到下个字的字尾\r\n按[b]：光标回到上个字的开头\r\n按[#l]：光标移到该行的第#个位置，如：5l,56l。\r\nVi还提供了三个关于光标在全屏幕上移动并且文件本身不发生滚动的命令。它们分别是H、M和L命令。\r\n(1)H命令\r\n该命令将光标移至屏幕首行的行首（即左上角），也就是当前屏幕的第一行，而不是整个文件的第一行。利用此命令可以快速将光标移至屏幕顶部。若在H命令之前加上数字n，则将光标移至第n行的行首。值得一提的是，使用命令dH将会删除从光标当前所在行至所显示屏幕首行的全部内容。\r\n(2)M命令\r\n该命令将光标移至屏幕显示文件的中间行的行首。即如果当前屏幕已经充满,则移动到整个屏幕的中间行；如果并未充满，则移动到文本的那些行的中间行。利用此命令可以快速地将光标从屏幕的任意位置移至屏幕显示文件的中间行的行首。例如，在上面屏幕显示的情况下（不论光标在屏幕的何处），在命令模式下，输入命令M之后，光标都将移到add这一行的字母a上。同样值得一提的是，使用命令dM将会删除从光标当前所在行至屏幕显示文件的中间行的全部内容。\r\n(3)L命令\r\n当文件显示内容超过一屏时，该命令将光标移至屏幕上的最底行的行首；当文件显示内容不足一屏时，该命令将光标移至文件的最后一行的行首。可见，利用此命令可以快速准确地将光标移至屏幕底部或文件的最后一行。若在L命令之前加上数字n，则将光标移至从屏幕底部算起第n行的行首。同样值得一提的是，使用命令dL将会删除从光标当前行至屏幕底行的全部内容。\r\n4）. 删除文字\r\n[x]：每按一次，删除光标所在位置的“后面”一个字符。\r\n[#x]：例如，[6x]表示删除光标所在位置的“后面”6个字符。\r\n[X]：大写的X，每按一次，删除光标所在位置的“前面”一个字符。\r\n[#X]：例如，[20X]表示删除光标所在位置的“前面”20个字符。\r\n[dd]：删除光标所在行。\r\n[#dd]：从光标所在行开始删除#行\r\n5）. 复制\r\n[yw]：将光标所在之处到字尾的字符复制到缓冲区中。\r\n[#yw]：复制#个字到缓冲区\r\n[yy]：复制光标所在行到缓冲区。\r\n[#yy]：例如，[6yy]表示拷贝从光标所在的该行“往下数”6行文字。\r\n[p]：将缓冲区内的字符贴到光标所在位置。注意：所有与“y”有关的复制命令都必须与“p”配合才能完成复制与粘贴功能。\r\n6）. 替换\r\n[r]：替换光标所在处的字符。\r\n[R]：替换光标所到之处的字符，直到按下[ESC]键为止。\r\n7）. 恢复上一次操作\r\n[u]：如果您误执行一个命令，可以马上按下，回到上一个操作。按多次“u”可以执行多次回复。\r\n8）. 更改\r\n[cw]：更改光标所在处的字到字尾处\r\n[c#w]：例如，[c3w]表示更改3个字\r\n9）.撤销更改\r\n[u]：撤销上一次更改，可以一直按[u]，一直撤销到最旧修改状态。\r\n[ctrl]+[r]：恢复撤销的更改，可以一直按该组合键达到最新的改变。\r\n10）. 跳至指定的行\r\n[ctrl]+[g]列出光标所在行的行号。\r\n[#G]：例如，[15G]，表示移动光标至文章的第15行行首。\r\n> 4、Last line mode下命令简介\r\n\r\n在使用[last line mode]之前，请记住先按[ESC]键确定您已经处于[command mode]下后，再按[：]冒号即可进入[last line mode]。\r\nA) 列出行号\r\n[set nu]：输入[set nu]后，会在文件中的每一行前面列出行号。\r\nB) 跳到文件中的某一行\r\n[#]：[#]号表示一个数字，在冒号后输入一个数字，再按回车键就会跳到该行了，如输入数字15，再回车，就会跳到文章的第15行。\r\nC) 查找字符\r\n[/关键字]：先按[/]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往后寻找到您要的关键字为止。\r\n[?关键字]：先按[?]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往前寻找到您要的关键字为止。\r\nD) 保存文件\r\n[w]：在冒号输入字母[w]就可以将文件保存起来。\r\nE) 离开vi\r\n[q]：按[q]就是退出，如果无法离开vi，可以在[q]后跟一个[!]强制离开vi。\r\n[wq]：一般建议离开时，搭配[w]一起使用，这样在退出的时候还可以保存文件，可以在后面再跟[！]强制保存退出。\r\n[ZZ]：保存并退出vi。', 'editormd', '2', '1', '1', '', '的是否v的深V的否v', '', '1524704994', '2019', '1', 'http://health.xuanwumobile.com/uploads/music/20180929/4e190d5d24aa5f93b7eb08aafa33017f.mp3', '1', '2019-11-04 13:07:46', '1', '1', '50', 'LINUX');
INSERT INTO `think_article` VALUES ('110', 'git使用说明', '7', '/uploads/images/20191119/627ec51860a9024a79e4095382a7b7a2.jpg', '的否v待v是待v', '大师分散', '<ol>\r\n<li><p>创建git资源库<br> git init —bare 库名称</p>\r\n</li><li><p>在用户文件夹下把资源clone下来<br> git clone &lt;仓库目录&gt; /g/software/repository/git/itheima &lt;用户目录&gt; .<br> 注意：clone时候用户目录必须为空</p>\r\n</li><li><p>创建一个文件，纳入到版本控制中。<br> git add &lt;文件名&gt;<br> 第一次执行会出警告：warning: LF will be replaced by CRLF in readme.txt.</p>\r\n<pre><code>                 The file will have its original line endings in your working directory.\r\n</code></pre><p> 警告处理：需要配置用户信息</p>\r\n<pre><code>             git config user.name = &quot;zhangsan&quot;\r\n             git config user.email = &quot;<a href=\"mailto:itheima@gmail.com\">itheima@gmail.com</a>&quot;\r\n</code></pre></li><li><p>提交到本地版本库里。<br> git commit &lt;文件名&gt;</p>\r\n</li><li><p>推送到远程共享版本库中<br> git push origin master</p>\r\n</li><li><p>切换用户，拉取最新的文件<br> git pull</p>\r\n<p> git pull 之后有冲突:</p>\r\n</li></ol>\r\n<p>$ git pull<br>remote: Counting objects: 5, done.<br>remote: Compressing objects: 100% (2/2), done.<br>remote: Total 3 (delta 0), reused 0 (delta 0)<br>Unpacking objects: 100% (3/3), done.<br>From g:/software/repository/git/itheima26<br>   50db030..a04027a  master     -&gt; origin/master<br>Auto-merging readme.txt<br>CONFLICT (content): Merge conflict in readme.txt<br>Automatic merge failed; fix conflicts and then commit the result.</p>\r\n<p>解决方法:<br>1.git mergetool<br>    调用上面命令之后会提示你输入编辑方法,输入:beyond compare 进入编辑器.</p>\r\n<p>2.编辑完之后.调用git commit -a 把当前目录中所有都提交到本地库中.</p>\r\n<p>3.git push origin master 提交到远程库中.</p>\r\n', '1. 创建git资源库\r\n	git init --bare 库名称\r\n	\r\n2. 在用户文件夹下把资源clone下来\r\n	git clone <仓库目录> /g/software/repository/git/itheima <用户目录> .\r\n	注意：clone时候用户目录必须为空\r\n\r\n3. 创建一个文件，纳入到版本控制中。\r\n	git add <文件名>\r\n	第一次执行会出警告：warning: LF will be replaced by CRLF in readme.txt.\r\n						The file will have its original line endings in your working directory.\r\n	警告处理：需要配置用户信息\r\n					git config user.name = \"zhangsan\"\r\n					git config user.email = \"itheima@gmail.com\"\r\n					\r\n4. 提交到本地版本库里。\r\n	git commit <文件名>\r\n	\r\n5. 推送到远程共享版本库中\r\n	git push origin master\r\n	\r\n6. 切换用户，拉取最新的文件\r\n	git pull\r\n	\r\n	git pull 之后有冲突:\r\n\r\n$ git pull\r\nremote: Counting objects: 5, done.\r\nremote: Compressing objects: 100% (2/2), done.\r\nremote: Total 3 (delta 0), reused 0 (delta 0)\r\nUnpacking objects: 100% (3/3), done.\r\nFrom g:/software/repository/git/itheima26\r\n   50db030..a04027a  master     -> origin/master\r\nAuto-merging readme.txt\r\nCONFLICT (content): Merge conflict in readme.txt\r\nAutomatic merge failed; fix conflicts and then commit the result.\r\n\r\n\r\n解决方法:\r\n1.git mergetool\r\n	调用上面命令之后会提示你输入编辑方法,输入:beyond compare 进入编辑器.\r\n\r\n2.编辑完之后.调用git commit -a 把当前目录中所有都提交到本地库中.\r\n\r\n3.git push origin master 提交到远程库中.', 'editormd', '0', '1', '1', '', '发深V是待v多少的', '', '1526293877', '2019', '1', 'http://health.xuanwumobile.com/uploads/music/20180929/4e190d5d24aa5f93b7eb08aafa33017f.mp3', '1', '2019-11-04 13:02:22', '1', '1', '50', 'GIT,版本控制');
INSERT INTO `think_article` VALUES ('111', '撒大声地多所', '2', '/uploads/images/20191119/09a5cecec5905657541367ba49de8045.jpg', '而违反为人父', '让他给我扔', '<blockquote>\r\n<p> vi的基本概念</p>\r\n</blockquote>\r\n<p>基本上vi可以分为三种状态，分别是<br>命令模式（command mode）<br>插入模式（Insert mode）<br>底行模式（last line mode）<br>1) 命令行模式command mode）<br>控制屏幕光标的移动，字符、字或行的删除，移动复制某区段及进入Insert mode下，或者到 last line mode。<br>2) 插入模式（Insert mode）<br>只有在Insert mode下，才可以做文字输入，按[ESC]键可回到命令行模式。<br>3) 底行模式（last line mode）<br>将文件保存或退出vi，也可以设置编辑环境，如寻找字符串、列出行号……等。<br>不过一般我们在使用时把vi简化成两个模式，就是将底行模式（last line mode）也算入命令行模式command mode）。</p>\r\n<blockquote>\r\n<p>2、vi的基本操作</p>\r\n</blockquote>\r\n<p>a) 进入vi<br>在系统提示符号输入vi及文件名称后，就进入vi全屏幕编辑画面：<br>$ vi myfile<br>不过有一点要特别注意，就是您进入vi之后，是处于[命令行模式（command mode）]，您要切换到[插入模式（Insert mode）]才能够输入文字。初次使用vi的人都会想先用上下左右键移动光标，结果电脑一直哔哔叫，把自己气个半死，所以进入vi后，先不要乱动，转换到 [插入模式（Insert mode）]再说吧！<br>b) 切换至插入模式（Insert mode）编辑文件<br>在[命令行模式（command mode）]下按一下字母i就可以进入[插入模式（Insert mode）]，这时候你就可以开始输入文字了。<br>c) Insert 的切换<br>您目前处于[插入模式（Insert mode）]，您就只能一直输入文字，如果您发现输错了字！想用光标键往回移动，将该字删除，就要先按一下[ESC]键转到[命令行模式（command mode）]再删除文字。<br>d) 退出vi及保存文件<br>命令行模式下保存并退出：输入ZZ<br>在[命令行模式（command mode）]下，按一下[：]冒号键进入[Last line mode]，例如：<br>: w filename （输入 [w filename]将文章以指定的文件名filename保存）<br>: wq (输入[wq]，存盘并退出vi)<br>: q! (输入q!， 不存盘强制退出vi)<br>:x (执行保存并退出vi编辑器)</p>\r\n<blockquote>\r\n<p>3、命令行模式（command mode）功能键</p>\r\n</blockquote>\r\n<p>1）. 插入模式<br>按切换进入插入模式，按“i”进入插入模式后是从光标当前位置开始输入文件；<br>按[a]进入插入模式后，是从目前光标所在位置的下一个位置开始输入文字；<br>按[o]进入插入模式后，是插入新的一行，从行首开始输入文字。<br>2）. 从插入模式切换为命令行模式<br>按[ESC]键。<br>3）. 移动光标<br>vi可以直接用键盘上的光标来上下左右移动，但正规的vi是用小写英文字母[h]、[j]、[k]、[l]，分别控制光标左、下、上、右移一格。<br>按[ctrl]+[b]：屏幕往“后”移动一页。<br>按[ctrl]+[f]：屏幕往“前”移动一页。<br>按[ctrl]+[u]：屏幕往“后”移动半页。<br>按[ctrl]+[d]：屏幕往“前”移动半页。<br>按[gg]：移动到文章的首行。(可能只在Vim中有效)<br>按[G]：移动到文章的最后。<br>按[$]：移动到光标所在行的“行尾”。<br>按[^]：移动到光标所在行的“行首”<br>按[w]：光标跳到下个字的开头<br>按[e]：光标跳到下个字的字尾<br>按[b]：光标回到上个字的开头<br>按[#l]：光标移到该行的第#个位置，如：5l,56l。<br>Vi还提供了三个关于光标在全屏幕上移动并且文件本身不发生滚动的命令。它们分别是H、M和L命令。<br>(1)H命令<br>该命令将光标移至屏幕首行的行首（即左上角），也就是当前屏幕的第一行，而不是整个文件的第一行。利用此命令可以快速将光标移至屏幕顶部。若在H命令之前加上数字n，则将光标移至第n行的行首。值得一提的是，使用命令dH将会删除从光标当前所在行至所显示屏幕首行的全部内容。<br>(2)M命令<br>该命令将光标移至屏幕显示文件的中间行的行首。即如果当前屏幕已经充满,则移动到整个屏幕的中间行；如果并未充满，则移动到文本的那些行的中间行。利用此命令可以快速地将光标从屏幕的任意位置移至屏幕显示文件的中间行的行首。例如，在上面屏幕显示的情况下（不论光标在屏幕的何处），在命令模式下，输入命令M之后，光标都将移到add这一行的字母a上。同样值得一提的是，使用命令dM将会删除从光标当前所在行至屏幕显示文件的中间行的全部内容。<br>(3)L命令<br>当文件显示内容超过一屏时，该命令将光标移至屏幕上的最底行的行首；当文件显示内容不足一屏时，该命令将光标移至文件的最后一行的行首。可见，利用此命令可以快速准确地将光标移至屏幕底部或文件的最后一行。若在L命令之前加上数字n，则将光标移至从屏幕底部算起第n行的行首。同样值得一提的是，使用命令dL将会删除从光标当前行至屏幕底行的全部内容。<br>4）. 删除文字<br>[x]：每按一次，删除光标所在位置的“后面”一个字符。<br>[#x]：例如，[6x]表示删除光标所在位置的“后面”6个字符。<br>[X]：大写的X，每按一次，删除光标所在位置的“前面”一个字符。<br>[#X]：例如，[20X]表示删除光标所在位置的“前面”20个字符。<br>[dd]：删除光标所在行。<br>[#dd]：从光标所在行开始删除#行<br>5）. 复制<br>[yw]：将光标所在之处到字尾的字符复制到缓冲区中。<br>[#yw]：复制#个字到缓冲区<br>[yy]：复制光标所在行到缓冲区。<br>[#yy]：例如，[6yy]表示拷贝从光标所在的该行“往下数”6行文字。<br>[p]：将缓冲区内的字符贴到光标所在位置。注意：所有与“y”有关的复制命令都必须与“p”配合才能完成复制与粘贴功能。<br>6）. 替换<br>[r]：替换光标所在处的字符。<br>[R]：替换光标所到之处的字符，直到按下[ESC]键为止。<br>7）. 恢复上一次操作<br>[u]：如果您误执行一个命令，可以马上按下，回到上一个操作。按多次“u”可以执行多次回复。<br>8）. 更改<br>[cw]：更改光标所在处的字到字尾处<br>[c#w]：例如，[c3w]表示更改3个字<br>9）.撤销更改<br>[u]：撤销上一次更改，可以一直按[u]，一直撤销到最旧修改状态。<br>[ctrl]+[r]：恢复撤销的更改，可以一直按该组合键达到最新的改变。<br>10）. 跳至指定的行<br>[ctrl]+[g]列出光标所在行的行号。<br>[#G]：例如，[15G]，表示移动光标至文章的第15行行首。</p>\r\n<blockquote>\r\n<p>4、Last line mode下命令简介</p>\r\n</blockquote>\r\n<p>在使用[last line mode]之前，请记住先按[ESC]键确定您已经处于[command mode]下后，再按[：]冒号即可进入[last line mode]。<br>A) 列出行号<br>[set nu]：输入[set nu]后，会在文件中的每一行前面列出行号。<br>B) 跳到文件中的某一行<br>[#]：[#]号表示一个数字，在冒号后输入一个数字，再按回车键就会跳到该行了，如输入数字15，再回车，就会跳到文章的第15行。<br>C) 查找字符<br>[/关键字]：先按[/]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往后寻找到您要的关键字为止。<br>[?关键字]：先按[?]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往前寻找到您要的关键字为止。<br>D) 保存文件<br>[w]：在冒号输入字母[w]就可以将文件保存起来。<br>E) 离开vi<br>[q]：按[q]就是退出，如果无法离开vi，可以在[q]后跟一个[!]强制离开vi。<br>[wq]：一般建议离开时，搭配[w]一起使用，这样在退出的时候还可以保存文件，可以在后面再跟[！]强制保存退出。<br>[ZZ]：保存并退出vi。</p>\r\n', '>  vi的基本概念\r\n\r\n基本上vi可以分为三种状态，分别是\r\n命令模式（command mode）\r\n插入模式（Insert mode）\r\n底行模式（last line mode）\r\n1) 命令行模式command mode）\r\n控制屏幕光标的移动，字符、字或行的删除，移动复制某区段及进入Insert mode下，或者到 last line mode。\r\n2) 插入模式（Insert mode）\r\n只有在Insert mode下，才可以做文字输入，按[ESC]键可回到命令行模式。\r\n3) 底行模式（last line mode）\r\n将文件保存或退出vi，也可以设置编辑环境，如寻找字符串、列出行号……等。\r\n不过一般我们在使用时把vi简化成两个模式，就是将底行模式（last line mode）也算入命令行模式command mode）。\r\n> 2、vi的基本操作\r\n\r\na) 进入vi\r\n在系统提示符号输入vi及文件名称后，就进入vi全屏幕编辑画面：\r\n$ vi myfile\r\n不过有一点要特别注意，就是您进入vi之后，是处于[命令行模式（command mode）]，您要切换到[插入模式（Insert mode）]才能够输入文字。初次使用vi的人都会想先用上下左右键移动光标，结果电脑一直哔哔叫，把自己气个半死，所以进入vi后，先不要乱动，转换到 [插入模式（Insert mode）]再说吧！\r\nb) 切换至插入模式（Insert mode）编辑文件\r\n在[命令行模式（command mode）]下按一下字母i就可以进入[插入模式（Insert mode）]，这时候你就可以开始输入文字了。\r\nc) Insert 的切换\r\n您目前处于[插入模式（Insert mode）]，您就只能一直输入文字，如果您发现输错了字！想用光标键往回移动，将该字删除，就要先按一下[ESC]键转到[命令行模式（command mode）]再删除文字。\r\nd) 退出vi及保存文件\r\n命令行模式下保存并退出：输入ZZ\r\n在[命令行模式（command mode）]下，按一下[：]冒号键进入[Last line mode]，例如：\r\n: w filename （输入 [w filename]将文章以指定的文件名filename保存）\r\n: wq (输入[wq]，存盘并退出vi)\r\n: q! (输入q!， 不存盘强制退出vi)\r\n:x (执行保存并退出vi编辑器)\r\n> 3、命令行模式（command mode）功能键\r\n\r\n1）. 插入模式\r\n按切换进入插入模式，按“i”进入插入模式后是从光标当前位置开始输入文件；\r\n按[a]进入插入模式后，是从目前光标所在位置的下一个位置开始输入文字；\r\n按[o]进入插入模式后，是插入新的一行，从行首开始输入文字。\r\n2）. 从插入模式切换为命令行模式\r\n按[ESC]键。\r\n3）. 移动光标\r\nvi可以直接用键盘上的光标来上下左右移动，但正规的vi是用小写英文字母[h]、[j]、[k]、[l]，分别控制光标左、下、上、右移一格。\r\n按[ctrl]+[b]：屏幕往“后”移动一页。\r\n按[ctrl]+[f]：屏幕往“前”移动一页。\r\n按[ctrl]+[u]：屏幕往“后”移动半页。\r\n按[ctrl]+[d]：屏幕往“前”移动半页。\r\n按[gg]：移动到文章的首行。(可能只在Vim中有效)\r\n按[G]：移动到文章的最后。\r\n按[$]：移动到光标所在行的“行尾”。\r\n按[^]：移动到光标所在行的“行首”\r\n按[w]：光标跳到下个字的开头\r\n按[e]：光标跳到下个字的字尾\r\n按[b]：光标回到上个字的开头\r\n按[#l]：光标移到该行的第#个位置，如：5l,56l。\r\nVi还提供了三个关于光标在全屏幕上移动并且文件本身不发生滚动的命令。它们分别是H、M和L命令。\r\n(1)H命令\r\n该命令将光标移至屏幕首行的行首（即左上角），也就是当前屏幕的第一行，而不是整个文件的第一行。利用此命令可以快速将光标移至屏幕顶部。若在H命令之前加上数字n，则将光标移至第n行的行首。值得一提的是，使用命令dH将会删除从光标当前所在行至所显示屏幕首行的全部内容。\r\n(2)M命令\r\n该命令将光标移至屏幕显示文件的中间行的行首。即如果当前屏幕已经充满,则移动到整个屏幕的中间行；如果并未充满，则移动到文本的那些行的中间行。利用此命令可以快速地将光标从屏幕的任意位置移至屏幕显示文件的中间行的行首。例如，在上面屏幕显示的情况下（不论光标在屏幕的何处），在命令模式下，输入命令M之后，光标都将移到add这一行的字母a上。同样值得一提的是，使用命令dM将会删除从光标当前所在行至屏幕显示文件的中间行的全部内容。\r\n(3)L命令\r\n当文件显示内容超过一屏时，该命令将光标移至屏幕上的最底行的行首；当文件显示内容不足一屏时，该命令将光标移至文件的最后一行的行首。可见，利用此命令可以快速准确地将光标移至屏幕底部或文件的最后一行。若在L命令之前加上数字n，则将光标移至从屏幕底部算起第n行的行首。同样值得一提的是，使用命令dL将会删除从光标当前行至屏幕底行的全部内容。\r\n4）. 删除文字\r\n[x]：每按一次，删除光标所在位置的“后面”一个字符。\r\n[#x]：例如，[6x]表示删除光标所在位置的“后面”6个字符。\r\n[X]：大写的X，每按一次，删除光标所在位置的“前面”一个字符。\r\n[#X]：例如，[20X]表示删除光标所在位置的“前面”20个字符。\r\n[dd]：删除光标所在行。\r\n[#dd]：从光标所在行开始删除#行\r\n5）. 复制\r\n[yw]：将光标所在之处到字尾的字符复制到缓冲区中。\r\n[#yw]：复制#个字到缓冲区\r\n[yy]：复制光标所在行到缓冲区。\r\n[#yy]：例如，[6yy]表示拷贝从光标所在的该行“往下数”6行文字。\r\n[p]：将缓冲区内的字符贴到光标所在位置。注意：所有与“y”有关的复制命令都必须与“p”配合才能完成复制与粘贴功能。\r\n6）. 替换\r\n[r]：替换光标所在处的字符。\r\n[R]：替换光标所到之处的字符，直到按下[ESC]键为止。\r\n7）. 恢复上一次操作\r\n[u]：如果您误执行一个命令，可以马上按下，回到上一个操作。按多次“u”可以执行多次回复。\r\n8）. 更改\r\n[cw]：更改光标所在处的字到字尾处\r\n[c#w]：例如，[c3w]表示更改3个字\r\n9）.撤销更改\r\n[u]：撤销上一次更改，可以一直按[u]，一直撤销到最旧修改状态。\r\n[ctrl]+[r]：恢复撤销的更改，可以一直按该组合键达到最新的改变。\r\n10）. 跳至指定的行\r\n[ctrl]+[g]列出光标所在行的行号。\r\n[#G]：例如，[15G]，表示移动光标至文章的第15行行首。\r\n> 4、Last line mode下命令简介\r\n\r\n在使用[last line mode]之前，请记住先按[ESC]键确定您已经处于[command mode]下后，再按[：]冒号即可进入[last line mode]。\r\nA) 列出行号\r\n[set nu]：输入[set nu]后，会在文件中的每一行前面列出行号。\r\nB) 跳到文件中的某一行\r\n[#]：[#]号表示一个数字，在冒号后输入一个数字，再按回车键就会跳到该行了，如输入数字15，再回车，就会跳到文章的第15行。\r\nC) 查找字符\r\n[/关键字]：先按[/]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往后寻找到您要的关键字为止。\r\n[?关键字]：先按[?]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往前寻找到您要的关键字为止。\r\nD) 保存文件\r\n[w]：在冒号输入字母[w]就可以将文件保存起来。\r\nE) 离开vi\r\n[q]：按[q]就是退出，如果无法离开vi，可以在[q]后跟一个[!]强制离开vi。\r\n[wq]：一般建议离开时，搭配[w]一起使用，这样在退出的时候还可以保存文件，可以在后面再跟[！]强制保存退出。\r\n[ZZ]：保存并退出vi。', 'editormd', '0', '1', '1', '', '热粉色', '', '1526298874', '2019', '1', 'http://health.xuanwumobile.com/uploads/music/20180929/4e190d5d24aa5f93b7eb08aafa33017f.mp3', '1', '2019-11-04 13:02:59', '1', '1', '50', '');
INSERT INTO `think_article` VALUES ('112', '这是有一个文章了', '11', '/uploads/images/20191119/06c314b5355a1ac3daa2135f479e04a3.jpg', 'sdcasdc', 'aweawedw', '<blockquote>\r\n<p> vi的基本概念</p>\r\n</blockquote>\r\n<p>基本上vi可以分为三种状态，分别是<br>命令模式（command mode）<br>插入模式（Insert mode）<br>底行模式（last line mode）<br>1) 命令行模式command mode）<br>控制屏幕光标的移动，字符、字或行的删除，移动复制某区段及进入Insert mode下，或者到 last line mode。<br>2) 插入模式（Insert mode）<br>只有在Insert mode下，才可以做文字输入，按[ESC]键可回到命令行模式。<br>3) 底行模式（last line mode）<br>将文件保存或退出vi，也可以设置编辑环境，如寻找字符串、列出行号……等。<br>不过一般我们在使用时把vi简化成两个模式，就是将底行模式（last line mode）也算入命令行模式command mode）。</p>\r\n<blockquote>\r\n<p>2、vi的基本操作</p>\r\n</blockquote>\r\n<p>a) 进入vi<br>在系统提示符号输入vi及文件名称后，就进入vi全屏幕编辑画面：<br>$ vi myfile<br>不过有一点要特别注意，就是您进入vi之后，是处于[命令行模式（command mode）]，您要切换到[插入模式（Insert mode）]才能够输入文字。初次使用vi的人都会想先用上下左右键移动光标，结果电脑一直哔哔叫，把自己气个半死，所以进入vi后，先不要乱动，转换到 [插入模式（Insert mode）]再说吧！<br>b) 切换至插入模式（Insert mode）编辑文件<br>在[命令行模式（command mode）]下按一下字母i就可以进入[插入模式（Insert mode）]，这时候你就可以开始输入文字了。<br>c) Insert 的切换<br>您目前处于[插入模式（Insert mode）]，您就只能一直输入文字，如果您发现输错了字！想用光标键往回移动，将该字删除，就要先按一下[ESC]键转到[命令行模式（command mode）]再删除文字。<br>d) 退出vi及保存文件<br>命令行模式下保存并退出：输入ZZ<br>在[命令行模式（command mode）]下，按一下[：]冒号键进入[Last line mode]，例如：<br>: w filename （输入 [w filename]将文章以指定的文件名filename保存）<br>: wq (输入[wq]，存盘并退出vi)<br>: q! (输入q!， 不存盘强制退出vi)<br>:x (执行保存并退出vi编辑器)</p>\r\n<blockquote>\r\n<p>3、命令行模式（command mode）功能键</p>\r\n</blockquote>\r\n<p>1）. 插入模式<br>按切换进入插入模式，按“i”进入插入模式后是从光标当前位置开始输入文件；<br>按[a]进入插入模式后，是从目前光标所在位置的下一个位置开始输入文字；<br>按[o]进入插入模式后，是插入新的一行，从行首开始输入文字。<br>2）. 从插入模式切换为命令行模式<br>按[ESC]键。<br>3）. 移动光标<br>vi可以直接用键盘上的光标来上下左右移动，但正规的vi是用小写英文字母[h]、[j]、[k]、[l]，分别控制光标左、下、上、右移一格。<br>按[ctrl]+[b]：屏幕往“后”移动一页。<br>按[ctrl]+[f]：屏幕往“前”移动一页。<br>按[ctrl]+[u]：屏幕往“后”移动半页。<br>按[ctrl]+[d]：屏幕往“前”移动半页。<br>按[gg]：移动到文章的首行。(可能只在Vim中有效)<br>按[G]：移动到文章的最后。<br>按[$]：移动到光标所在行的“行尾”。<br>按[^]：移动到光标所在行的“行首”<br>按[w]：光标跳到下个字的开头<br>按[e]：光标跳到下个字的字尾<br>按[b]：光标回到上个字的开头<br>按[#l]：光标移到该行的第#个位置，如：5l,56l。<br>Vi还提供了三个关于光标在全屏幕上移动并且文件本身不发生滚动的命令。它们分别是H、M和L命令。<br>(1)H命令<br>该命令将光标移至屏幕首行的行首（即左上角），也就是当前屏幕的第一行，而不是整个文件的第一行。利用此命令可以快速将光标移至屏幕顶部。若在H命令之前加上数字n，则将光标移至第n行的行首。值得一提的是，使用命令dH将会删除从光标当前所在行至所显示屏幕首行的全部内容。<br>(2)M命令<br>该命令将光标移至屏幕显示文件的中间行的行首。即如果当前屏幕已经充满,则移动到整个屏幕的中间行；如果并未充满，则移动到文本的那些行的中间行。利用此命令可以快速地将光标从屏幕的任意位置移至屏幕显示文件的中间行的行首。例如，在上面屏幕显示的情况下（不论光标在屏幕的何处），在命令模式下，输入命令M之后，光标都将移到add这一行的字母a上。同样值得一提的是，使用命令dM将会删除从光标当前所在行至屏幕显示文件的中间行的全部内容。<br>(3)L命令<br>当文件显示内容超过一屏时，该命令将光标移至屏幕上的最底行的行首；当文件显示内容不足一屏时，该命令将光标移至文件的最后一行的行首。可见，利用此命令可以快速准确地将光标移至屏幕底部或文件的最后一行。若在L命令之前加上数字n，则将光标移至从屏幕底部算起第n行的行首。同样值得一提的是，使用命令dL将会删除从光标当前行至屏幕底行的全部内容。<br>4）. 删除文字<br>[x]：每按一次，删除光标所在位置的“后面”一个字符。<br>[#x]：例如，[6x]表示删除光标所在位置的“后面”6个字符。<br>[X]：大写的X，每按一次，删除光标所在位置的“前面”一个字符。<br>[#X]：例如，[20X]表示删除光标所在位置的“前面”20个字符。<br>[dd]：删除光标所在行。<br>[#dd]：从光标所在行开始删除#行<br>5）. 复制<br>[yw]：将光标所在之处到字尾的字符复制到缓冲区中。<br>[#yw]：复制#个字到缓冲区<br>[yy]：复制光标所在行到缓冲区。<br>[#yy]：例如，[6yy]表示拷贝从光标所在的该行“往下数”6行文字。<br>[p]：将缓冲区内的字符贴到光标所在位置。注意：所有与“y”有关的复制命令都必须与“p”配合才能完成复制与粘贴功能。<br>6）. 替换<br>[r]：替换光标所在处的字符。<br>[R]：替换光标所到之处的字符，直到按下[ESC]键为止。<br>7）. 恢复上一次操作<br>[u]：如果您误执行一个命令，可以马上按下，回到上一个操作。按多次“u”可以执行多次回复。<br>8）. 更改<br>[cw]：更改光标所在处的字到字尾处<br>[c#w]：例如，[c3w]表示更改3个字<br>9）.撤销更改<br>[u]：撤销上一次更改，可以一直按[u]，一直撤销到最旧修改状态。<br>[ctrl]+[r]：恢复撤销的更改，可以一直按该组合键达到最新的改变。<br>10）. 跳至指定的行<br>[ctrl]+[g]列出光标所在行的行号。<br>[#G]：例如，[15G]，表示移动光标至文章的第15行行首。</p>\r\n<blockquote>\r\n<p>4、Last line mode下命令简介</p>\r\n</blockquote>\r\n<p>在使用[last line mode]之前，请记住先按[ESC]键确定您已经处于[command mode]下后，再按[：]冒号即可进入[last line mode]。<br>A) 列出行号<br>[set nu]：输入[set nu]后，会在文件中的每一行前面列出行号。<br>B) 跳到文件中的某一行<br>[#]：[#]号表示一个数字，在冒号后输入一个数字，再按回车键就会跳到该行了，如输入数字15，再回车，就会跳到文章的第15行。<br>C) 查找字符<br>[/关键字]：先按[/]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往后寻找到您要的关键字为止。<br>[?关键字]：先按[?]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往前寻找到您要的关键字为止。<br>D) 保存文件<br>[w]：在冒号输入字母[w]就可以将文件保存起来。<br>E) 离开vi<br>[q]：按[q]就是退出，如果无法离开vi，可以在[q]后跟一个[!]强制离开vi。<br>[wq]：一般建议离开时，搭配[w]一起使用，这样在退出的时候还可以保存文件，可以在后面再跟[！]强制保存退出。<br>[ZZ]：保存并退出vi。</p>\r\n', '>  vi的基本概念\r\n\r\n基本上vi可以分为三种状态，分别是\r\n命令模式（command mode）\r\n插入模式（Insert mode）\r\n底行模式（last line mode）\r\n1) 命令行模式command mode）\r\n控制屏幕光标的移动，字符、字或行的删除，移动复制某区段及进入Insert mode下，或者到 last line mode。\r\n2) 插入模式（Insert mode）\r\n只有在Insert mode下，才可以做文字输入，按[ESC]键可回到命令行模式。\r\n3) 底行模式（last line mode）\r\n将文件保存或退出vi，也可以设置编辑环境，如寻找字符串、列出行号……等。\r\n不过一般我们在使用时把vi简化成两个模式，就是将底行模式（last line mode）也算入命令行模式command mode）。\r\n> 2、vi的基本操作\r\n\r\na) 进入vi\r\n在系统提示符号输入vi及文件名称后，就进入vi全屏幕编辑画面：\r\n$ vi myfile\r\n不过有一点要特别注意，就是您进入vi之后，是处于[命令行模式（command mode）]，您要切换到[插入模式（Insert mode）]才能够输入文字。初次使用vi的人都会想先用上下左右键移动光标，结果电脑一直哔哔叫，把自己气个半死，所以进入vi后，先不要乱动，转换到 [插入模式（Insert mode）]再说吧！\r\nb) 切换至插入模式（Insert mode）编辑文件\r\n在[命令行模式（command mode）]下按一下字母i就可以进入[插入模式（Insert mode）]，这时候你就可以开始输入文字了。\r\nc) Insert 的切换\r\n您目前处于[插入模式（Insert mode）]，您就只能一直输入文字，如果您发现输错了字！想用光标键往回移动，将该字删除，就要先按一下[ESC]键转到[命令行模式（command mode）]再删除文字。\r\nd) 退出vi及保存文件\r\n命令行模式下保存并退出：输入ZZ\r\n在[命令行模式（command mode）]下，按一下[：]冒号键进入[Last line mode]，例如：\r\n: w filename （输入 [w filename]将文章以指定的文件名filename保存）\r\n: wq (输入[wq]，存盘并退出vi)\r\n: q! (输入q!， 不存盘强制退出vi)\r\n:x (执行保存并退出vi编辑器)\r\n> 3、命令行模式（command mode）功能键\r\n\r\n1）. 插入模式\r\n按切换进入插入模式，按“i”进入插入模式后是从光标当前位置开始输入文件；\r\n按[a]进入插入模式后，是从目前光标所在位置的下一个位置开始输入文字；\r\n按[o]进入插入模式后，是插入新的一行，从行首开始输入文字。\r\n2）. 从插入模式切换为命令行模式\r\n按[ESC]键。\r\n3）. 移动光标\r\nvi可以直接用键盘上的光标来上下左右移动，但正规的vi是用小写英文字母[h]、[j]、[k]、[l]，分别控制光标左、下、上、右移一格。\r\n按[ctrl]+[b]：屏幕往“后”移动一页。\r\n按[ctrl]+[f]：屏幕往“前”移动一页。\r\n按[ctrl]+[u]：屏幕往“后”移动半页。\r\n按[ctrl]+[d]：屏幕往“前”移动半页。\r\n按[gg]：移动到文章的首行。(可能只在Vim中有效)\r\n按[G]：移动到文章的最后。\r\n按[$]：移动到光标所在行的“行尾”。\r\n按[^]：移动到光标所在行的“行首”\r\n按[w]：光标跳到下个字的开头\r\n按[e]：光标跳到下个字的字尾\r\n按[b]：光标回到上个字的开头\r\n按[#l]：光标移到该行的第#个位置，如：5l,56l。\r\nVi还提供了三个关于光标在全屏幕上移动并且文件本身不发生滚动的命令。它们分别是H、M和L命令。\r\n(1)H命令\r\n该命令将光标移至屏幕首行的行首（即左上角），也就是当前屏幕的第一行，而不是整个文件的第一行。利用此命令可以快速将光标移至屏幕顶部。若在H命令之前加上数字n，则将光标移至第n行的行首。值得一提的是，使用命令dH将会删除从光标当前所在行至所显示屏幕首行的全部内容。\r\n(2)M命令\r\n该命令将光标移至屏幕显示文件的中间行的行首。即如果当前屏幕已经充满,则移动到整个屏幕的中间行；如果并未充满，则移动到文本的那些行的中间行。利用此命令可以快速地将光标从屏幕的任意位置移至屏幕显示文件的中间行的行首。例如，在上面屏幕显示的情况下（不论光标在屏幕的何处），在命令模式下，输入命令M之后，光标都将移到add这一行的字母a上。同样值得一提的是，使用命令dM将会删除从光标当前所在行至屏幕显示文件的中间行的全部内容。\r\n(3)L命令\r\n当文件显示内容超过一屏时，该命令将光标移至屏幕上的最底行的行首；当文件显示内容不足一屏时，该命令将光标移至文件的最后一行的行首。可见，利用此命令可以快速准确地将光标移至屏幕底部或文件的最后一行。若在L命令之前加上数字n，则将光标移至从屏幕底部算起第n行的行首。同样值得一提的是，使用命令dL将会删除从光标当前行至屏幕底行的全部内容。\r\n4）. 删除文字\r\n[x]：每按一次，删除光标所在位置的“后面”一个字符。\r\n[#x]：例如，[6x]表示删除光标所在位置的“后面”6个字符。\r\n[X]：大写的X，每按一次，删除光标所在位置的“前面”一个字符。\r\n[#X]：例如，[20X]表示删除光标所在位置的“前面”20个字符。\r\n[dd]：删除光标所在行。\r\n[#dd]：从光标所在行开始删除#行\r\n5）. 复制\r\n[yw]：将光标所在之处到字尾的字符复制到缓冲区中。\r\n[#yw]：复制#个字到缓冲区\r\n[yy]：复制光标所在行到缓冲区。\r\n[#yy]：例如，[6yy]表示拷贝从光标所在的该行“往下数”6行文字。\r\n[p]：将缓冲区内的字符贴到光标所在位置。注意：所有与“y”有关的复制命令都必须与“p”配合才能完成复制与粘贴功能。\r\n6）. 替换\r\n[r]：替换光标所在处的字符。\r\n[R]：替换光标所到之处的字符，直到按下[ESC]键为止。\r\n7）. 恢复上一次操作\r\n[u]：如果您误执行一个命令，可以马上按下，回到上一个操作。按多次“u”可以执行多次回复。\r\n8）. 更改\r\n[cw]：更改光标所在处的字到字尾处\r\n[c#w]：例如，[c3w]表示更改3个字\r\n9）.撤销更改\r\n[u]：撤销上一次更改，可以一直按[u]，一直撤销到最旧修改状态。\r\n[ctrl]+[r]：恢复撤销的更改，可以一直按该组合键达到最新的改变。\r\n10）. 跳至指定的行\r\n[ctrl]+[g]列出光标所在行的行号。\r\n[#G]：例如，[15G]，表示移动光标至文章的第15行行首。\r\n> 4、Last line mode下命令简介\r\n\r\n在使用[last line mode]之前，请记住先按[ESC]键确定您已经处于[command mode]下后，再按[：]冒号即可进入[last line mode]。\r\nA) 列出行号\r\n[set nu]：输入[set nu]后，会在文件中的每一行前面列出行号。\r\nB) 跳到文件中的某一行\r\n[#]：[#]号表示一个数字，在冒号后输入一个数字，再按回车键就会跳到该行了，如输入数字15，再回车，就会跳到文章的第15行。\r\nC) 查找字符\r\n[/关键字]：先按[/]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往后寻找到您要的关键字为止。\r\n[?关键字]：先按[?]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往前寻找到您要的关键字为止。\r\nD) 保存文件\r\n[w]：在冒号输入字母[w]就可以将文件保存起来。\r\nE) 离开vi\r\n[q]：按[q]就是退出，如果无法离开vi，可以在[q]后跟一个[!]强制离开vi。\r\n[wq]：一般建议离开时，搭配[w]一起使用，这样在退出的时候还可以保存文件，可以在后面再跟[！]强制保存退出。\r\n[ZZ]：保存并退出vi。', 'editormd', '0', '1', '1', '', 'sadcasdc', '', '1526369975', '2019', '1', 'http://health.xuanwumobile.com/uploads/music/20180929/4e190d5d24aa5f93b7eb08aafa33017f.mp3', '1', '2019-11-04 12:44:54', '1', '1', '50', 'windows');
INSERT INTO `think_article` VALUES ('113', '的市场成熟度', '2', '/uploads/images/20191119/5ea671a323dac72155ce2ad8818f0a84.jpg', '地方深V是的否v', '是发DVD否v', '<blockquote>\r\n<p> vi的基本概念</p>\r\n</blockquote>\r\n<p>基本上vi可以分为三种状态，分别是<br>命令模式（command mode）<br>插入模式（Insert mode）<br>底行模式（last line mode）<br>1) 命令行模式command mode）<br>控制屏幕光标的移动，字符、字或行的删除，移动复制某区段及进入Insert mode下，或者到 last line mode。<br>2) 插入模式（Insert mode）<br>只有在Insert mode下，才可以做文字输入，按[ESC]键可回到命令行模式。<br>3) 底行模式（last line mode）<br>将文件保存或退出vi，也可以设置编辑环境，如寻找字符串、列出行号……等。<br>不过一般我们在使用时把vi简化成两个模式，就是将底行模式（last line mode）也算入命令行模式command mode）。</p>\r\n<blockquote>\r\n<p>2、vi的基本操作</p>\r\n</blockquote>\r\n<p>a) 进入vi<br>在系统提示符号输入vi及文件名称后，就进入vi全屏幕编辑画面：<br>$ vi myfile<br>不过有一点要特别注意，就是您进入vi之后，是处于[命令行模式（command mode）]，您要切换到[插入模式（Insert mode）]才能够输入文字。初次使用vi的人都会想先用上下左右键移动光标，结果电脑一直哔哔叫，把自己气个半死，所以进入vi后，先不要乱动，转换到 [插入模式（Insert mode）]再说吧！<br>b) 切换至插入模式（Insert mode）编辑文件<br>在[命令行模式（command mode）]下按一下字母i就可以进入[插入模式（Insert mode）]，这时候你就可以开始输入文字了。<br>c) Insert 的切换<br>您目前处于[插入模式（Insert mode）]，您就只能一直输入文字，如果您发现输错了字！想用光标键往回移动，将该字删除，就要先按一下[ESC]键转到[命令行模式（command mode）]再删除文字。<br>d) 退出vi及保存文件<br>命令行模式下保存并退出：输入ZZ<br>在[命令行模式（command mode）]下，按一下[：]冒号键进入[Last line mode]，例如：<br>: w filename （输入 [w filename]将文章以指定的文件名filename保存）<br>: wq (输入[wq]，存盘并退出vi)<br>: q! (输入q!， 不存盘强制退出vi)<br>:x (执行保存并退出vi编辑器)</p>\r\n<blockquote>\r\n<p>3、命令行模式（command mode）功能键</p>\r\n</blockquote>\r\n<p>1）. 插入模式<br>按切换进入插入模式，按“i”进入插入模式后是从光标当前位置开始输入文件；<br>按[a]进入插入模式后，是从目前光标所在位置的下一个位置开始输入文字；<br>按[o]进入插入模式后，是插入新的一行，从行首开始输入文字。<br>2）. 从插入模式切换为命令行模式<br>按[ESC]键。<br>3）. 移动光标<br>vi可以直接用键盘上的光标来上下左右移动，但正规的vi是用小写英文字母[h]、[j]、[k]、[l]，分别控制光标左、下、上、右移一格。<br>按[ctrl]+[b]：屏幕往“后”移动一页。<br>按[ctrl]+[f]：屏幕往“前”移动一页。<br>按[ctrl]+[u]：屏幕往“后”移动半页。<br>按[ctrl]+[d]：屏幕往“前”移动半页。<br>按[gg]：移动到文章的首行。(可能只在Vim中有效)<br>按[G]：移动到文章的最后。<br>按[$]：移动到光标所在行的“行尾”。<br>按[^]：移动到光标所在行的“行首”<br>按[w]：光标跳到下个字的开头<br>按[e]：光标跳到下个字的字尾<br>按[b]：光标回到上个字的开头<br>按[#l]：光标移到该行的第#个位置，如：5l,56l。<br>Vi还提供了三个关于光标在全屏幕上移动并且文件本身不发生滚动的命令。它们分别是H、M和L命令。<br>(1)H命令<br>该命令将光标移至屏幕首行的行首（即左上角），也就是当前屏幕的第一行，而不是整个文件的第一行。利用此命令可以快速将光标移至屏幕顶部。若在H命令之前加上数字n，则将光标移至第n行的行首。值得一提的是，使用命令dH将会删除从光标当前所在行至所显示屏幕首行的全部内容。<br>(2)M命令<br>该命令将光标移至屏幕显示文件的中间行的行首。即如果当前屏幕已经充满,则移动到整个屏幕的中间行；如果并未充满，则移动到文本的那些行的中间行。利用此命令可以快速地将光标从屏幕的任意位置移至屏幕显示文件的中间行的行首。例如，在上面屏幕显示的情况下（不论光标在屏幕的何处），在命令模式下，输入命令M之后，光标都将移到add这一行的字母a上。同样值得一提的是，使用命令dM将会删除从光标当前所在行至屏幕显示文件的中间行的全部内容。<br>(3)L命令<br>当文件显示内容超过一屏时，该命令将光标移至屏幕上的最底行的行首；当文件显示内容不足一屏时，该命令将光标移至文件的最后一行的行首。可见，利用此命令可以快速准确地将光标移至屏幕底部或文件的最后一行。若在L命令之前加上数字n，则将光标移至从屏幕底部算起第n行的行首。同样值得一提的是，使用命令dL将会删除从光标当前行至屏幕底行的全部内容。<br>4）. 删除文字<br>[x]：每按一次，删除光标所在位置的“后面”一个字符。<br>[#x]：例如，[6x]表示删除光标所在位置的“后面”6个字符。<br>[X]：大写的X，每按一次，删除光标所在位置的“前面”一个字符。<br>[#X]：例如，[20X]表示删除光标所在位置的“前面”20个字符。<br>[dd]：删除光标所在行。<br>[#dd]：从光标所在行开始删除#行<br>5）. 复制<br>[yw]：将光标所在之处到字尾的字符复制到缓冲区中。<br>[#yw]：复制#个字到缓冲区<br>[yy]：复制光标所在行到缓冲区。<br>[#yy]：例如，[6yy]表示拷贝从光标所在的该行“往下数”6行文字。<br>[p]：将缓冲区内的字符贴到光标所在位置。注意：所有与“y”有关的复制命令都必须与“p”配合才能完成复制与粘贴功能。<br>6）. 替换<br>[r]：替换光标所在处的字符。<br>[R]：替换光标所到之处的字符，直到按下[ESC]键为止。<br>7）. 恢复上一次操作<br>[u]：如果您误执行一个命令，可以马上按下，回到上一个操作。按多次“u”可以执行多次回复。<br>8）. 更改<br>[cw]：更改光标所在处的字到字尾处<br>[c#w]：例如，[c3w]表示更改3个字<br>9）.撤销更改<br>[u]：撤销上一次更改，可以一直按[u]，一直撤销到最旧修改状态。<br>[ctrl]+[r]：恢复撤销的更改，可以一直按该组合键达到最新的改变。<br>10）. 跳至指定的行<br>[ctrl]+[g]列出光标所在行的行号。<br>[#G]：例如，[15G]，表示移动光标至文章的第15行行首。</p>\r\n<blockquote>\r\n<p>4、Last line mode下命令简介</p>\r\n</blockquote>\r\n<p>在使用[last line mode]之前，请记住先按[ESC]键确定您已经处于[command mode]下后，再按[：]冒号即可进入[last line mode]。<br>A) 列出行号<br>[set nu]：输入[set nu]后，会在文件中的每一行前面列出行号。<br>B) 跳到文件中的某一行<br>[#]：[#]号表示一个数字，在冒号后输入一个数字，再按回车键就会跳到该行了，如输入数字15，再回车，就会跳到文章的第15行。<br>C) 查找字符<br>[/关键字]：先按[/]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往后寻找到您要的关键字为止。<br>[?关键字]：先按[?]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往前寻找到您要的关键字为止。<br>D) 保存文件<br>[w]：在冒号输入字母[w]就可以将文件保存起来。<br>E) 离开vi<br>[q]：按[q]就是退出，如果无法离开vi，可以在[q]后跟一个[!]强制离开vi。<br>[wq]：一般建议离开时，搭配[w]一起使用，这样在退出的时候还可以保存文件，可以在后面再跟[！]强制保存退出。<br>[ZZ]：保存并退出vi。</p>\r\n', '>  vi的基本概念\r\n\r\n基本上vi可以分为三种状态，分别是\r\n命令模式（command mode）\r\n插入模式（Insert mode）\r\n底行模式（last line mode）\r\n1) 命令行模式command mode）\r\n控制屏幕光标的移动，字符、字或行的删除，移动复制某区段及进入Insert mode下，或者到 last line mode。\r\n2) 插入模式（Insert mode）\r\n只有在Insert mode下，才可以做文字输入，按[ESC]键可回到命令行模式。\r\n3) 底行模式（last line mode）\r\n将文件保存或退出vi，也可以设置编辑环境，如寻找字符串、列出行号……等。\r\n不过一般我们在使用时把vi简化成两个模式，就是将底行模式（last line mode）也算入命令行模式command mode）。\r\n> 2、vi的基本操作\r\n\r\na) 进入vi\r\n在系统提示符号输入vi及文件名称后，就进入vi全屏幕编辑画面：\r\n$ vi myfile\r\n不过有一点要特别注意，就是您进入vi之后，是处于[命令行模式（command mode）]，您要切换到[插入模式（Insert mode）]才能够输入文字。初次使用vi的人都会想先用上下左右键移动光标，结果电脑一直哔哔叫，把自己气个半死，所以进入vi后，先不要乱动，转换到 [插入模式（Insert mode）]再说吧！\r\nb) 切换至插入模式（Insert mode）编辑文件\r\n在[命令行模式（command mode）]下按一下字母i就可以进入[插入模式（Insert mode）]，这时候你就可以开始输入文字了。\r\nc) Insert 的切换\r\n您目前处于[插入模式（Insert mode）]，您就只能一直输入文字，如果您发现输错了字！想用光标键往回移动，将该字删除，就要先按一下[ESC]键转到[命令行模式（command mode）]再删除文字。\r\nd) 退出vi及保存文件\r\n命令行模式下保存并退出：输入ZZ\r\n在[命令行模式（command mode）]下，按一下[：]冒号键进入[Last line mode]，例如：\r\n: w filename （输入 [w filename]将文章以指定的文件名filename保存）\r\n: wq (输入[wq]，存盘并退出vi)\r\n: q! (输入q!， 不存盘强制退出vi)\r\n:x (执行保存并退出vi编辑器)\r\n> 3、命令行模式（command mode）功能键\r\n\r\n1）. 插入模式\r\n按切换进入插入模式，按“i”进入插入模式后是从光标当前位置开始输入文件；\r\n按[a]进入插入模式后，是从目前光标所在位置的下一个位置开始输入文字；\r\n按[o]进入插入模式后，是插入新的一行，从行首开始输入文字。\r\n2）. 从插入模式切换为命令行模式\r\n按[ESC]键。\r\n3）. 移动光标\r\nvi可以直接用键盘上的光标来上下左右移动，但正规的vi是用小写英文字母[h]、[j]、[k]、[l]，分别控制光标左、下、上、右移一格。\r\n按[ctrl]+[b]：屏幕往“后”移动一页。\r\n按[ctrl]+[f]：屏幕往“前”移动一页。\r\n按[ctrl]+[u]：屏幕往“后”移动半页。\r\n按[ctrl]+[d]：屏幕往“前”移动半页。\r\n按[gg]：移动到文章的首行。(可能只在Vim中有效)\r\n按[G]：移动到文章的最后。\r\n按[$]：移动到光标所在行的“行尾”。\r\n按[^]：移动到光标所在行的“行首”\r\n按[w]：光标跳到下个字的开头\r\n按[e]：光标跳到下个字的字尾\r\n按[b]：光标回到上个字的开头\r\n按[#l]：光标移到该行的第#个位置，如：5l,56l。\r\nVi还提供了三个关于光标在全屏幕上移动并且文件本身不发生滚动的命令。它们分别是H、M和L命令。\r\n(1)H命令\r\n该命令将光标移至屏幕首行的行首（即左上角），也就是当前屏幕的第一行，而不是整个文件的第一行。利用此命令可以快速将光标移至屏幕顶部。若在H命令之前加上数字n，则将光标移至第n行的行首。值得一提的是，使用命令dH将会删除从光标当前所在行至所显示屏幕首行的全部内容。\r\n(2)M命令\r\n该命令将光标移至屏幕显示文件的中间行的行首。即如果当前屏幕已经充满,则移动到整个屏幕的中间行；如果并未充满，则移动到文本的那些行的中间行。利用此命令可以快速地将光标从屏幕的任意位置移至屏幕显示文件的中间行的行首。例如，在上面屏幕显示的情况下（不论光标在屏幕的何处），在命令模式下，输入命令M之后，光标都将移到add这一行的字母a上。同样值得一提的是，使用命令dM将会删除从光标当前所在行至屏幕显示文件的中间行的全部内容。\r\n(3)L命令\r\n当文件显示内容超过一屏时，该命令将光标移至屏幕上的最底行的行首；当文件显示内容不足一屏时，该命令将光标移至文件的最后一行的行首。可见，利用此命令可以快速准确地将光标移至屏幕底部或文件的最后一行。若在L命令之前加上数字n，则将光标移至从屏幕底部算起第n行的行首。同样值得一提的是，使用命令dL将会删除从光标当前行至屏幕底行的全部内容。\r\n4）. 删除文字\r\n[x]：每按一次，删除光标所在位置的“后面”一个字符。\r\n[#x]：例如，[6x]表示删除光标所在位置的“后面”6个字符。\r\n[X]：大写的X，每按一次，删除光标所在位置的“前面”一个字符。\r\n[#X]：例如，[20X]表示删除光标所在位置的“前面”20个字符。\r\n[dd]：删除光标所在行。\r\n[#dd]：从光标所在行开始删除#行\r\n5）. 复制\r\n[yw]：将光标所在之处到字尾的字符复制到缓冲区中。\r\n[#yw]：复制#个字到缓冲区\r\n[yy]：复制光标所在行到缓冲区。\r\n[#yy]：例如，[6yy]表示拷贝从光标所在的该行“往下数”6行文字。\r\n[p]：将缓冲区内的字符贴到光标所在位置。注意：所有与“y”有关的复制命令都必须与“p”配合才能完成复制与粘贴功能。\r\n6）. 替换\r\n[r]：替换光标所在处的字符。\r\n[R]：替换光标所到之处的字符，直到按下[ESC]键为止。\r\n7）. 恢复上一次操作\r\n[u]：如果您误执行一个命令，可以马上按下，回到上一个操作。按多次“u”可以执行多次回复。\r\n8）. 更改\r\n[cw]：更改光标所在处的字到字尾处\r\n[c#w]：例如，[c3w]表示更改3个字\r\n9）.撤销更改\r\n[u]：撤销上一次更改，可以一直按[u]，一直撤销到最旧修改状态。\r\n[ctrl]+[r]：恢复撤销的更改，可以一直按该组合键达到最新的改变。\r\n10）. 跳至指定的行\r\n[ctrl]+[g]列出光标所在行的行号。\r\n[#G]：例如，[15G]，表示移动光标至文章的第15行行首。\r\n> 4、Last line mode下命令简介\r\n\r\n在使用[last line mode]之前，请记住先按[ESC]键确定您已经处于[command mode]下后，再按[：]冒号即可进入[last line mode]。\r\nA) 列出行号\r\n[set nu]：输入[set nu]后，会在文件中的每一行前面列出行号。\r\nB) 跳到文件中的某一行\r\n[#]：[#]号表示一个数字，在冒号后输入一个数字，再按回车键就会跳到该行了，如输入数字15，再回车，就会跳到文章的第15行。\r\nC) 查找字符\r\n[/关键字]：先按[/]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往后寻找到您要的关键字为止。\r\n[?关键字]：先按[?]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往前寻找到您要的关键字为止。\r\nD) 保存文件\r\n[w]：在冒号输入字母[w]就可以将文件保存起来。\r\nE) 离开vi\r\n[q]：按[q]就是退出，如果无法离开vi，可以在[q]后跟一个[!]强制离开vi。\r\n[wq]：一般建议离开时，搭配[w]一起使用，这样在退出的时候还可以保存文件，可以在后面再跟[！]强制保存退出。\r\n[ZZ]：保存并退出vi。', 'editormd', '2', '1', '1', '', '的是否v地方深V的是否v', '', '1526442468', '2019', '1', 'http://health.xuanwumobile.com/uploads/music/20180929/4e190d5d24aa5f93b7eb08aafa33017f.mp3', '1', '2019-11-19 14:45:24', '1', '1', '50', '');
INSERT INTO `think_article` VALUES ('116', '又来一个文章', '13', '/uploads/images/20191119/716115129050f6fd68d47086b699a991.jpg', '发的舒适度发送到', '发是待v双方都', '<blockquote>\r\n<p> vi的基本概念</p>\r\n</blockquote>\r\n<p>基本上vi可以分为三种状态，分别是<br>命令模式（command mode）<br>插入模式（Insert mode）<br>底行模式（last line mode）<br>1) 命令行模式command mode）<br>控制屏幕光标的移动，字符、字或行的删除，移动复制某区段及进入Insert mode下，或者到 last line mode。<br>2) 插入模式（Insert mode）<br>只有在Insert mode下，才可以做文字输入，按[ESC]键可回到命令行模式。<br>3) 底行模式（last line mode）<br>将文件保存或退出vi，也可以设置编辑环境，如寻找字符串、列出行号……等。<br>不过一般我们在使用时把vi简化成两个模式，就是将底行模式（last line mode）也算入命令行模式command mode）。</p>\r\n<blockquote>\r\n<p>2、vi的基本操作</p>\r\n</blockquote>\r\n<p>a) 进入vi<br>在系统提示符号输入vi及文件名称后，就进入vi全屏幕编辑画面：<br>$ vi myfile<br>不过有一点要特别注意，就是您进入vi之后，是处于[命令行模式（command mode）]，您要切换到[插入模式（Insert mode）]才能够输入文字。初次使用vi的人都会想先用上下左右键移动光标，结果电脑一直哔哔叫，把自己气个半死，所以进入vi后，先不要乱动，转换到 [插入模式（Insert mode）]再说吧！<br>b) 切换至插入模式（Insert mode）编辑文件<br>在[命令行模式（command mode）]下按一下字母i就可以进入[插入模式（Insert mode）]，这时候你就可以开始输入文字了。<br>c) Insert 的切换<br>您目前处于[插入模式（Insert mode）]，您就只能一直输入文字，如果您发现输错了字！想用光标键往回移动，将该字删除，就要先按一下[ESC]键转到[命令行模式（command mode）]再删除文字。<br>d) 退出vi及保存文件<br>命令行模式下保存并退出：输入ZZ<br>在[命令行模式（command mode）]下，按一下[：]冒号键进入[Last line mode]，例如：<br>: w filename （输入 [w filename]将文章以指定的文件名filename保存）<br>: wq (输入[wq]，存盘并退出vi)<br>: q! (输入q!， 不存盘强制退出vi)<br>:x (执行保存并退出vi编辑器)</p>\r\n<blockquote>\r\n<p>3、命令行模式（command mode）功能键</p>\r\n</blockquote>\r\n<p>1）. 插入模式<br>按切换进入插入模式，按“i”进入插入模式后是从光标当前位置开始输入文件；<br>按[a]进入插入模式后，是从目前光标所在位置的下一个位置开始输入文字；<br>按[o]进入插入模式后，是插入新的一行，从行首开始输入文字。<br>2）. 从插入模式切换为命令行模式<br>按[ESC]键。<br>3）. 移动光标<br>vi可以直接用键盘上的光标来上下左右移动，但正规的vi是用小写英文字母[h]、[j]、[k]、[l]，分别控制光标左、下、上、右移一格。<br>按[ctrl]+[b]：屏幕往“后”移动一页。<br>按[ctrl]+[f]：屏幕往“前”移动一页。<br>按[ctrl]+[u]：屏幕往“后”移动半页。<br>按[ctrl]+[d]：屏幕往“前”移动半页。<br>按[gg]：移动到文章的首行。(可能只在Vim中有效)<br>按[G]：移动到文章的最后。<br>按[$]：移动到光标所在行的“行尾”。<br>按[^]：移动到光标所在行的“行首”<br>按[w]：光标跳到下个字的开头<br>按[e]：光标跳到下个字的字尾<br>按[b]：光标回到上个字的开头<br>按[#l]：光标移到该行的第#个位置，如：5l,56l。<br>Vi还提供了三个关于光标在全屏幕上移动并且文件本身不发生滚动的命令。它们分别是H、M和L命令。<br>(1)H命令<br>该命令将光标移至屏幕首行的行首（即左上角），也就是当前屏幕的第一行，而不是整个文件的第一行。利用此命令可以快速将光标移至屏幕顶部。若在H命令之前加上数字n，则将光标移至第n行的行首。值得一提的是，使用命令dH将会删除从光标当前所在行至所显示屏幕首行的全部内容。<br>(2)M命令<br>该命令将光标移至屏幕显示文件的中间行的行首。即如果当前屏幕已经充满,则移动到整个屏幕的中间行；如果并未充满，则移动到文本的那些行的中间行。利用此命令可以快速地将光标从屏幕的任意位置移至屏幕显示文件的中间行的行首。例如，在上面屏幕显示的情况下（不论光标在屏幕的何处），在命令模式下，输入命令M之后，光标都将移到add这一行的字母a上。同样值得一提的是，使用命令dM将会删除从光标当前所在行至屏幕显示文件的中间行的全部内容。<br>(3)L命令<br>当文件显示内容超过一屏时，该命令将光标移至屏幕上的最底行的行首；当文件显示内容不足一屏时，该命令将光标移至文件的最后一行的行首。可见，利用此命令可以快速准确地将光标移至屏幕底部或文件的最后一行。若在L命令之前加上数字n，则将光标移至从屏幕底部算起第n行的行首。同样值得一提的是，使用命令dL将会删除从光标当前行至屏幕底行的全部内容。<br>4）. 删除文字<br>[x]：每按一次，删除光标所在位置的“后面”一个字符。<br>[#x]：例如，[6x]表示删除光标所在位置的“后面”6个字符。<br>[X]：大写的X，每按一次，删除光标所在位置的“前面”一个字符。<br>[#X]：例如，[20X]表示删除光标所在位置的“前面”20个字符。<br>[dd]：删除光标所在行。<br>[#dd]：从光标所在行开始删除#行<br>5）. 复制<br>[yw]：将光标所在之处到字尾的字符复制到缓冲区中。<br>[#yw]：复制#个字到缓冲区<br>[yy]：复制光标所在行到缓冲区。<br>[#yy]：例如，[6yy]表示拷贝从光标所在的该行“往下数”6行文字。<br>[p]：将缓冲区内的字符贴到光标所在位置。注意：所有与“y”有关的复制命令都必须与“p”配合才能完成复制与粘贴功能。<br>6）. 替换<br>[r]：替换光标所在处的字符。<br>[R]：替换光标所到之处的字符，直到按下[ESC]键为止。<br>7）. 恢复上一次操作<br>[u]：如果您误执行一个命令，可以马上按下，回到上一个操作。按多次“u”可以执行多次回复。<br>8）. 更改<br>[cw]：更改光标所在处的字到字尾处<br>[c#w]：例如，[c3w]表示更改3个字<br>9）.撤销更改<br>[u]：撤销上一次更改，可以一直按[u]，一直撤销到最旧修改状态。<br>[ctrl]+[r]：恢复撤销的更改，可以一直按该组合键达到最新的改变。<br>10）. 跳至指定的行<br>[ctrl]+[g]列出光标所在行的行号。<br>[#G]：例如，[15G]，表示移动光标至文章的第15行行首。</p>\r\n<blockquote>\r\n<p>4、Last line mode下命令简介</p>\r\n</blockquote>\r\n<p>在使用[last line mode]之前，请记住先按[ESC]键确定您已经处于[command mode]下后，再按[：]冒号即可进入[last line mode]。<br>A) 列出行号<br>[set nu]：输入[set nu]后，会在文件中的每一行前面列出行号。<br>B) 跳到文件中的某一行<br>[#]：[#]号表示一个数字，在冒号后输入一个数字，再按回车键就会跳到该行了，如输入数字15，再回车，就会跳到文章的第15行。<br>C) 查找字符<br>[/关键字]：先按[/]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往后寻找到您要的关键字为止。<br>[?关键字]：先按[?]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往前寻找到您要的关键字为止。<br>D) 保存文件<br>[w]：在冒号输入字母[w]就可以将文件保存起来。<br>E) 离开vi<br>[q]：按[q]就是退出，如果无法离开vi，可以在[q]后跟一个[!]强制离开vi。<br>[wq]：一般建议离开时，搭配[w]一起使用，这样在退出的时候还可以保存文件，可以在后面再跟[！]强制保存退出。<br>[ZZ]：保存并退出vi。</p>\r\n', '>  vi的基本概念\r\n\r\n基本上vi可以分为三种状态，分别是\r\n命令模式（command mode）\r\n插入模式（Insert mode）\r\n底行模式（last line mode）\r\n1) 命令行模式command mode）\r\n控制屏幕光标的移动，字符、字或行的删除，移动复制某区段及进入Insert mode下，或者到 last line mode。\r\n2) 插入模式（Insert mode）\r\n只有在Insert mode下，才可以做文字输入，按[ESC]键可回到命令行模式。\r\n3) 底行模式（last line mode）\r\n将文件保存或退出vi，也可以设置编辑环境，如寻找字符串、列出行号……等。\r\n不过一般我们在使用时把vi简化成两个模式，就是将底行模式（last line mode）也算入命令行模式command mode）。\r\n> 2、vi的基本操作\r\n\r\na) 进入vi\r\n在系统提示符号输入vi及文件名称后，就进入vi全屏幕编辑画面：\r\n$ vi myfile\r\n不过有一点要特别注意，就是您进入vi之后，是处于[命令行模式（command mode）]，您要切换到[插入模式（Insert mode）]才能够输入文字。初次使用vi的人都会想先用上下左右键移动光标，结果电脑一直哔哔叫，把自己气个半死，所以进入vi后，先不要乱动，转换到 [插入模式（Insert mode）]再说吧！\r\nb) 切换至插入模式（Insert mode）编辑文件\r\n在[命令行模式（command mode）]下按一下字母i就可以进入[插入模式（Insert mode）]，这时候你就可以开始输入文字了。\r\nc) Insert 的切换\r\n您目前处于[插入模式（Insert mode）]，您就只能一直输入文字，如果您发现输错了字！想用光标键往回移动，将该字删除，就要先按一下[ESC]键转到[命令行模式（command mode）]再删除文字。\r\nd) 退出vi及保存文件\r\n命令行模式下保存并退出：输入ZZ\r\n在[命令行模式（command mode）]下，按一下[：]冒号键进入[Last line mode]，例如：\r\n: w filename （输入 [w filename]将文章以指定的文件名filename保存）\r\n: wq (输入[wq]，存盘并退出vi)\r\n: q! (输入q!， 不存盘强制退出vi)\r\n:x (执行保存并退出vi编辑器)\r\n> 3、命令行模式（command mode）功能键\r\n\r\n1）. 插入模式\r\n按切换进入插入模式，按“i”进入插入模式后是从光标当前位置开始输入文件；\r\n按[a]进入插入模式后，是从目前光标所在位置的下一个位置开始输入文字；\r\n按[o]进入插入模式后，是插入新的一行，从行首开始输入文字。\r\n2）. 从插入模式切换为命令行模式\r\n按[ESC]键。\r\n3）. 移动光标\r\nvi可以直接用键盘上的光标来上下左右移动，但正规的vi是用小写英文字母[h]、[j]、[k]、[l]，分别控制光标左、下、上、右移一格。\r\n按[ctrl]+[b]：屏幕往“后”移动一页。\r\n按[ctrl]+[f]：屏幕往“前”移动一页。\r\n按[ctrl]+[u]：屏幕往“后”移动半页。\r\n按[ctrl]+[d]：屏幕往“前”移动半页。\r\n按[gg]：移动到文章的首行。(可能只在Vim中有效)\r\n按[G]：移动到文章的最后。\r\n按[$]：移动到光标所在行的“行尾”。\r\n按[^]：移动到光标所在行的“行首”\r\n按[w]：光标跳到下个字的开头\r\n按[e]：光标跳到下个字的字尾\r\n按[b]：光标回到上个字的开头\r\n按[#l]：光标移到该行的第#个位置，如：5l,56l。\r\nVi还提供了三个关于光标在全屏幕上移动并且文件本身不发生滚动的命令。它们分别是H、M和L命令。\r\n(1)H命令\r\n该命令将光标移至屏幕首行的行首（即左上角），也就是当前屏幕的第一行，而不是整个文件的第一行。利用此命令可以快速将光标移至屏幕顶部。若在H命令之前加上数字n，则将光标移至第n行的行首。值得一提的是，使用命令dH将会删除从光标当前所在行至所显示屏幕首行的全部内容。\r\n(2)M命令\r\n该命令将光标移至屏幕显示文件的中间行的行首。即如果当前屏幕已经充满,则移动到整个屏幕的中间行；如果并未充满，则移动到文本的那些行的中间行。利用此命令可以快速地将光标从屏幕的任意位置移至屏幕显示文件的中间行的行首。例如，在上面屏幕显示的情况下（不论光标在屏幕的何处），在命令模式下，输入命令M之后，光标都将移到add这一行的字母a上。同样值得一提的是，使用命令dM将会删除从光标当前所在行至屏幕显示文件的中间行的全部内容。\r\n(3)L命令\r\n当文件显示内容超过一屏时，该命令将光标移至屏幕上的最底行的行首；当文件显示内容不足一屏时，该命令将光标移至文件的最后一行的行首。可见，利用此命令可以快速准确地将光标移至屏幕底部或文件的最后一行。若在L命令之前加上数字n，则将光标移至从屏幕底部算起第n行的行首。同样值得一提的是，使用命令dL将会删除从光标当前行至屏幕底行的全部内容。\r\n4）. 删除文字\r\n[x]：每按一次，删除光标所在位置的“后面”一个字符。\r\n[#x]：例如，[6x]表示删除光标所在位置的“后面”6个字符。\r\n[X]：大写的X，每按一次，删除光标所在位置的“前面”一个字符。\r\n[#X]：例如，[20X]表示删除光标所在位置的“前面”20个字符。\r\n[dd]：删除光标所在行。\r\n[#dd]：从光标所在行开始删除#行\r\n5）. 复制\r\n[yw]：将光标所在之处到字尾的字符复制到缓冲区中。\r\n[#yw]：复制#个字到缓冲区\r\n[yy]：复制光标所在行到缓冲区。\r\n[#yy]：例如，[6yy]表示拷贝从光标所在的该行“往下数”6行文字。\r\n[p]：将缓冲区内的字符贴到光标所在位置。注意：所有与“y”有关的复制命令都必须与“p”配合才能完成复制与粘贴功能。\r\n6）. 替换\r\n[r]：替换光标所在处的字符。\r\n[R]：替换光标所到之处的字符，直到按下[ESC]键为止。\r\n7）. 恢复上一次操作\r\n[u]：如果您误执行一个命令，可以马上按下，回到上一个操作。按多次“u”可以执行多次回复。\r\n8）. 更改\r\n[cw]：更改光标所在处的字到字尾处\r\n[c#w]：例如，[c3w]表示更改3个字\r\n9）.撤销更改\r\n[u]：撤销上一次更改，可以一直按[u]，一直撤销到最旧修改状态。\r\n[ctrl]+[r]：恢复撤销的更改，可以一直按该组合键达到最新的改变。\r\n10）. 跳至指定的行\r\n[ctrl]+[g]列出光标所在行的行号。\r\n[#G]：例如，[15G]，表示移动光标至文章的第15行行首。\r\n> 4、Last line mode下命令简介\r\n\r\n在使用[last line mode]之前，请记住先按[ESC]键确定您已经处于[command mode]下后，再按[：]冒号即可进入[last line mode]。\r\nA) 列出行号\r\n[set nu]：输入[set nu]后，会在文件中的每一行前面列出行号。\r\nB) 跳到文件中的某一行\r\n[#]：[#]号表示一个数字，在冒号后输入一个数字，再按回车键就会跳到该行了，如输入数字15，再回车，就会跳到文章的第15行。\r\nC) 查找字符\r\n[/关键字]：先按[/]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往后寻找到您要的关键字为止。\r\n[?关键字]：先按[?]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往前寻找到您要的关键字为止。\r\nD) 保存文件\r\n[w]：在冒号输入字母[w]就可以将文件保存起来。\r\nE) 离开vi\r\n[q]：按[q]就是退出，如果无法离开vi，可以在[q]后跟一个[!]强制离开vi。\r\n[wq]：一般建议离开时，搭配[w]一起使用，这样在退出的时候还可以保存文件，可以在后面再跟[！]强制保存退出。\r\n[ZZ]：保存并退出vi。', 'editormd', '0', '1', '1', '', '递四方速递', '', '1529654098', '2019', '1', 'http://health.xuanwumobile.com/uploads/music/20181009/05c06bebb8c25d0723212e480cb7649b.mp3', '1', '2019-11-04 09:30:26', '1', '1', '50', 'mysql');
INSERT INTO `think_article` VALUES ('117', 'VIM好', '7', '/uploads/images/20191119/d35ee01b299c1c6c2224fc1a3bb54b36.jpg', '撒下手先', '撒下手先', '<blockquote>\r\n<p> vi的基本概念</p>\r\n</blockquote>\r\n<p>基本上vi可以分为三种状态，分别是<br>命令模式（command mode）<br>插入模式（Insert mode）<br>底行模式（last line mode）<br>1) 命令行模式command mode）<br>控制屏幕光标的移动，字符、字或行的删除，移动复制某区段及进入Insert mode下，或者到 last line mode。<br>2) 插入模式（Insert mode）<br>只有在Insert mode下，才可以做文字输入，按[ESC]键可回到命令行模式。<br>3) 底行模式（last line mode）<br>将文件保存或退出vi，也可以设置编辑环境，如寻找字符串、列出行号……等。<br>不过一般我们在使用时把vi简化成两个模式，就是将底行模式（last line mode）也算入命令行模式command mode）。</p>\r\n<blockquote>\r\n<p>2、vi的基本操作</p>\r\n</blockquote>\r\n<p>a) 进入vi<br>在系统提示符号输入vi及文件名称后，就进入vi全屏幕编辑画面：<br>$ vi myfile<br>不过有一点要特别注意，就是您进入vi之后，是处于[命令行模式（command mode）]，您要切换到[插入模式（Insert mode）]才能够输入文字。初次使用vi的人都会想先用上下左右键移动光标，结果电脑一直哔哔叫，把自己气个半死，所以进入vi后，先不要乱动，转换到 [插入模式（Insert mode）]再说吧！<br>b) 切换至插入模式（Insert mode）编辑文件<br>在[命令行模式（command mode）]下按一下字母i就可以进入[插入模式（Insert mode）]，这时候你就可以开始输入文字了。<br>c) Insert 的切换<br>您目前处于[插入模式（Insert mode）]，您就只能一直输入文字，如果您发现输错了字！想用光标键往回移动，将该字删除，就要先按一下[ESC]键转到[命令行模式（command mode）]再删除文字。<br>d) 退出vi及保存文件<br>命令行模式下保存并退出：输入ZZ<br>在[命令行模式（command mode）]下，按一下[：]冒号键进入[Last line mode]，例如：<br>: w filename （输入 [w filename]将文章以指定的文件名filename保存）<br>: wq (输入[wq]，存盘并退出vi)<br>: q! (输入q!， 不存盘强制退出vi)<br>:x (执行保存并退出vi编辑器)</p>\r\n<blockquote>\r\n<p>3、命令行模式（command mode）功能键</p>\r\n</blockquote>\r\n<p>1）. 插入模式<br>按切换进入插入模式，按“i”进入插入模式后是从光标当前位置开始输入文件；<br>按[a]进入插入模式后，是从目前光标所在位置的下一个位置开始输入文字；<br>按[o]进入插入模式后，是插入新的一行，从行首开始输入文字。<br>2）. 从插入模式切换为命令行模式<br>按[ESC]键。<br>3）. 移动光标<br>vi可以直接用键盘上的光标来上下左右移动，但正规的vi是用小写英文字母[h]、[j]、[k]、[l]，分别控制光标左、下、上、右移一格。<br>按[ctrl]+[b]：屏幕往“后”移动一页。<br>按[ctrl]+[f]：屏幕往“前”移动一页。<br>按[ctrl]+[u]：屏幕往“后”移动半页。<br>按[ctrl]+[d]：屏幕往“前”移动半页。<br>按[gg]：移动到文章的首行。(可能只在Vim中有效)<br>按[G]：移动到文章的最后。<br>按[$]：移动到光标所在行的“行尾”。<br>按[^]：移动到光标所在行的“行首”<br>按[w]：光标跳到下个字的开头<br>按[e]：光标跳到下个字的字尾<br>按[b]：光标回到上个字的开头<br>按[#l]：光标移到该行的第#个位置，如：5l,56l。<br>Vi还提供了三个关于光标在全屏幕上移动并且文件本身不发生滚动的命令。它们分别是H、M和L命令。<br>(1)H命令<br>该命令将光标移至屏幕首行的行首（即左上角），也就是当前屏幕的第一行，而不是整个文件的第一行。利用此命令可以快速将光标移至屏幕顶部。若在H命令之前加上数字n，则将光标移至第n行的行首。值得一提的是，使用命令dH将会删除从光标当前所在行至所显示屏幕首行的全部内容。<br>(2)M命令<br>该命令将光标移至屏幕显示文件的中间行的行首。即如果当前屏幕已经充满,则移动到整个屏幕的中间行；如果并未充满，则移动到文本的那些行的中间行。利用此命令可以快速地将光标从屏幕的任意位置移至屏幕显示文件的中间行的行首。例如，在上面屏幕显示的情况下（不论光标在屏幕的何处），在命令模式下，输入命令M之后，光标都将移到add这一行的字母a上。同样值得一提的是，使用命令dM将会删除从光标当前所在行至屏幕显示文件的中间行的全部内容。<br>(3)L命令<br>当文件显示内容超过一屏时，该命令将光标移至屏幕上的最底行的行首；当文件显示内容不足一屏时，该命令将光标移至文件的最后一行的行首。可见，利用此命令可以快速准确地将光标移至屏幕底部或文件的最后一行。若在L命令之前加上数字n，则将光标移至从屏幕底部算起第n行的行首。同样值得一提的是，使用命令dL将会删除从光标当前行至屏幕底行的全部内容。<br>4）. 删除文字<br>[x]：每按一次，删除光标所在位置的“后面”一个字符。<br>[#x]：例如，[6x]表示删除光标所在位置的“后面”6个字符。<br>[X]：大写的X，每按一次，删除光标所在位置的“前面”一个字符。<br>[#X]：例如，[20X]表示删除光标所在位置的“前面”20个字符。<br>[dd]：删除光标所在行。<br>[#dd]：从光标所在行开始删除#行<br>5）. 复制<br>[yw]：将光标所在之处到字尾的字符复制到缓冲区中。<br>[#yw]：复制#个字到缓冲区<br>[yy]：复制光标所在行到缓冲区。<br>[#yy]：例如，[6yy]表示拷贝从光标所在的该行“往下数”6行文字。<br>[p]：将缓冲区内的字符贴到光标所在位置。注意：所有与“y”有关的复制命令都必须与“p”配合才能完成复制与粘贴功能。<br>6）. 替换<br>[r]：替换光标所在处的字符。<br>[R]：替换光标所到之处的字符，直到按下[ESC]键为止。<br>7）. 恢复上一次操作<br>[u]：如果您误执行一个命令，可以马上按下，回到上一个操作。按多次“u”可以执行多次回复。<br>8）. 更改<br>[cw]：更改光标所在处的字到字尾处<br>[c#w]：例如，[c3w]表示更改3个字<br>9）.撤销更改<br>[u]：撤销上一次更改，可以一直按[u]，一直撤销到最旧修改状态。<br>[ctrl]+[r]：恢复撤销的更改，可以一直按该组合键达到最新的改变。<br>10）. 跳至指定的行<br>[ctrl]+[g]列出光标所在行的行号。<br>[#G]：例如，[15G]，表示移动光标至文章的第15行行首。</p>\r\n<blockquote>\r\n<p>4、Last line mode下命令简介</p>\r\n</blockquote>\r\n<p>在使用[last line mode]之前，请记住先按[ESC]键确定您已经处于[command mode]下后，再按[：]冒号即可进入[last line mode]。<br>A) 列出行号<br>[set nu]：输入[set nu]后，会在文件中的每一行前面列出行号。<br>B) 跳到文件中的某一行<br>[#]：[#]号表示一个数字，在冒号后输入一个数字，再按回车键就会跳到该行了，如输入数字15，再回车，就会跳到文章的第15行。<br>C) 查找字符<br>[/关键字]：先按[/]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往后寻找到您要的关键字为止。<br>[?关键字]：先按[?]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往前寻找到您要的关键字为止。<br>D) 保存文件<br>[w]：在冒号输入字母[w]就可以将文件保存起来。<br>E) 离开vi<br>[q]：按[q]就是退出，如果无法离开vi，可以在[q]后跟一个[!]强制离开vi。<br>[wq]：一般建议离开时，搭配[w]一起使用，这样在退出的时候还可以保存文件，可以在后面再跟[！]强制保存退出。<br>[ZZ]：保存并退出vi。</p>\r\n', '>  vi的基本概念\r\n\r\n基本上vi可以分为三种状态，分别是\r\n命令模式（command mode）\r\n插入模式（Insert mode）\r\n底行模式（last line mode）\r\n1) 命令行模式command mode）\r\n控制屏幕光标的移动，字符、字或行的删除，移动复制某区段及进入Insert mode下，或者到 last line mode。\r\n2) 插入模式（Insert mode）\r\n只有在Insert mode下，才可以做文字输入，按[ESC]键可回到命令行模式。\r\n3) 底行模式（last line mode）\r\n将文件保存或退出vi，也可以设置编辑环境，如寻找字符串、列出行号……等。\r\n不过一般我们在使用时把vi简化成两个模式，就是将底行模式（last line mode）也算入命令行模式command mode）。\r\n> 2、vi的基本操作\r\n\r\na) 进入vi\r\n在系统提示符号输入vi及文件名称后，就进入vi全屏幕编辑画面：\r\n$ vi myfile\r\n不过有一点要特别注意，就是您进入vi之后，是处于[命令行模式（command mode）]，您要切换到[插入模式（Insert mode）]才能够输入文字。初次使用vi的人都会想先用上下左右键移动光标，结果电脑一直哔哔叫，把自己气个半死，所以进入vi后，先不要乱动，转换到 [插入模式（Insert mode）]再说吧！\r\nb) 切换至插入模式（Insert mode）编辑文件\r\n在[命令行模式（command mode）]下按一下字母i就可以进入[插入模式（Insert mode）]，这时候你就可以开始输入文字了。\r\nc) Insert 的切换\r\n您目前处于[插入模式（Insert mode）]，您就只能一直输入文字，如果您发现输错了字！想用光标键往回移动，将该字删除，就要先按一下[ESC]键转到[命令行模式（command mode）]再删除文字。\r\nd) 退出vi及保存文件\r\n命令行模式下保存并退出：输入ZZ\r\n在[命令行模式（command mode）]下，按一下[：]冒号键进入[Last line mode]，例如：\r\n: w filename （输入 [w filename]将文章以指定的文件名filename保存）\r\n: wq (输入[wq]，存盘并退出vi)\r\n: q! (输入q!， 不存盘强制退出vi)\r\n:x (执行保存并退出vi编辑器)\r\n> 3、命令行模式（command mode）功能键\r\n\r\n1）. 插入模式\r\n按切换进入插入模式，按“i”进入插入模式后是从光标当前位置开始输入文件；\r\n按[a]进入插入模式后，是从目前光标所在位置的下一个位置开始输入文字；\r\n按[o]进入插入模式后，是插入新的一行，从行首开始输入文字。\r\n2）. 从插入模式切换为命令行模式\r\n按[ESC]键。\r\n3）. 移动光标\r\nvi可以直接用键盘上的光标来上下左右移动，但正规的vi是用小写英文字母[h]、[j]、[k]、[l]，分别控制光标左、下、上、右移一格。\r\n按[ctrl]+[b]：屏幕往“后”移动一页。\r\n按[ctrl]+[f]：屏幕往“前”移动一页。\r\n按[ctrl]+[u]：屏幕往“后”移动半页。\r\n按[ctrl]+[d]：屏幕往“前”移动半页。\r\n按[gg]：移动到文章的首行。(可能只在Vim中有效)\r\n按[G]：移动到文章的最后。\r\n按[$]：移动到光标所在行的“行尾”。\r\n按[^]：移动到光标所在行的“行首”\r\n按[w]：光标跳到下个字的开头\r\n按[e]：光标跳到下个字的字尾\r\n按[b]：光标回到上个字的开头\r\n按[#l]：光标移到该行的第#个位置，如：5l,56l。\r\nVi还提供了三个关于光标在全屏幕上移动并且文件本身不发生滚动的命令。它们分别是H、M和L命令。\r\n(1)H命令\r\n该命令将光标移至屏幕首行的行首（即左上角），也就是当前屏幕的第一行，而不是整个文件的第一行。利用此命令可以快速将光标移至屏幕顶部。若在H命令之前加上数字n，则将光标移至第n行的行首。值得一提的是，使用命令dH将会删除从光标当前所在行至所显示屏幕首行的全部内容。\r\n(2)M命令\r\n该命令将光标移至屏幕显示文件的中间行的行首。即如果当前屏幕已经充满,则移动到整个屏幕的中间行；如果并未充满，则移动到文本的那些行的中间行。利用此命令可以快速地将光标从屏幕的任意位置移至屏幕显示文件的中间行的行首。例如，在上面屏幕显示的情况下（不论光标在屏幕的何处），在命令模式下，输入命令M之后，光标都将移到add这一行的字母a上。同样值得一提的是，使用命令dM将会删除从光标当前所在行至屏幕显示文件的中间行的全部内容。\r\n(3)L命令\r\n当文件显示内容超过一屏时，该命令将光标移至屏幕上的最底行的行首；当文件显示内容不足一屏时，该命令将光标移至文件的最后一行的行首。可见，利用此命令可以快速准确地将光标移至屏幕底部或文件的最后一行。若在L命令之前加上数字n，则将光标移至从屏幕底部算起第n行的行首。同样值得一提的是，使用命令dL将会删除从光标当前行至屏幕底行的全部内容。\r\n4）. 删除文字\r\n[x]：每按一次，删除光标所在位置的“后面”一个字符。\r\n[#x]：例如，[6x]表示删除光标所在位置的“后面”6个字符。\r\n[X]：大写的X，每按一次，删除光标所在位置的“前面”一个字符。\r\n[#X]：例如，[20X]表示删除光标所在位置的“前面”20个字符。\r\n[dd]：删除光标所在行。\r\n[#dd]：从光标所在行开始删除#行\r\n5）. 复制\r\n[yw]：将光标所在之处到字尾的字符复制到缓冲区中。\r\n[#yw]：复制#个字到缓冲区\r\n[yy]：复制光标所在行到缓冲区。\r\n[#yy]：例如，[6yy]表示拷贝从光标所在的该行“往下数”6行文字。\r\n[p]：将缓冲区内的字符贴到光标所在位置。注意：所有与“y”有关的复制命令都必须与“p”配合才能完成复制与粘贴功能。\r\n6）. 替换\r\n[r]：替换光标所在处的字符。\r\n[R]：替换光标所到之处的字符，直到按下[ESC]键为止。\r\n7）. 恢复上一次操作\r\n[u]：如果您误执行一个命令，可以马上按下，回到上一个操作。按多次“u”可以执行多次回复。\r\n8）. 更改\r\n[cw]：更改光标所在处的字到字尾处\r\n[c#w]：例如，[c3w]表示更改3个字\r\n9）.撤销更改\r\n[u]：撤销上一次更改，可以一直按[u]，一直撤销到最旧修改状态。\r\n[ctrl]+[r]：恢复撤销的更改，可以一直按该组合键达到最新的改变。\r\n10）. 跳至指定的行\r\n[ctrl]+[g]列出光标所在行的行号。\r\n[#G]：例如，[15G]，表示移动光标至文章的第15行行首。\r\n> 4、Last line mode下命令简介\r\n\r\n在使用[last line mode]之前，请记住先按[ESC]键确定您已经处于[command mode]下后，再按[：]冒号即可进入[last line mode]。\r\nA) 列出行号\r\n[set nu]：输入[set nu]后，会在文件中的每一行前面列出行号。\r\nB) 跳到文件中的某一行\r\n[#]：[#]号表示一个数字，在冒号后输入一个数字，再按回车键就会跳到该行了，如输入数字15，再回车，就会跳到文章的第15行。\r\nC) 查找字符\r\n[/关键字]：先按[/]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往后寻找到您要的关键字为止。\r\n[?关键字]：先按[?]键，再输入您想寻找的字符，如果第一次找的关键字不是您想要的，可以一直按[n]会往前寻找到您要的关键字为止。\r\nD) 保存文件\r\n[w]：在冒号输入字母[w]就可以将文件保存起来。\r\nE) 离开vi\r\n[q]：按[q]就是退出，如果无法离开vi，可以在[q]后跟一个[!]强制离开vi。\r\n[wq]：一般建议离开时，搭配[w]一起使用，这样在退出的时候还可以保存文件，可以在后面再跟[！]强制保存退出。\r\n[ZZ]：保存并退出vi。', 'editormd', '0', '1', '1', '', '', '', '1541318403', '2019', '1', '', '1', '2019-11-19 14:46:39', '1', '1', '50', '');
INSERT INTO `think_article` VALUES ('118', '违法所得税的', '1', 'http://p73q8jzf0.bkt.clouddn.com/b175ac57e1064c5eabed3345183f147b.png,http://p73q8jzf0.bkt.clouddn.com/018c343375334493329ed80a3fccad5e.png,http://p73q8jzf0.bkt.clouddn.com/bfbf8df359cbddfcfcb5f0f33a891c28.png', '的傻傻的砂垫层', '待v是的否v', '', null, 'editormd', '0', '1', '1', '', '', '', '1541318674', '1541318674', '1', '', '0', null, '0', '0', '50', '');
INSERT INTO `think_article` VALUES ('119', '是的撒', '2', 'http://p73q8jzf0.bkt.clouddn.com/c6846cddfa93e0fda43d033d8dab9950.jpg,http://p73q8jzf0.bkt.clouddn.com/23ba01a7d8c853b9b1067c989301f089.jpg,http://p73q8jzf0.bkt.clouddn.com/b4fa8d6f06da456345091cb39dd01263.png,http://p73q8jzf0.bkt.clouddn.com/cfed511b3da02a7d0a5e9a4c87f70d48.png,http://p73q8jzf0.bkt.clouddn.com/9c1ae7269fcf0d6a53e0e5b20f106abf.jpg', '阿萨德撒', '啊实打实', '', null, 'editormd', '0', '1', '1', '', '', '', '1541334112', '1541334112', '1', '', '0', null, '0', '0', '50', '');
INSERT INTO `think_article` VALUES ('120', '测试一个系统', '9', '/uploads/images/20191119/913803b6da07f22454f5ecefb66a8c29.jpg', '', '', '<p>Response基类提供了data方法用于设置响应数据。<br>response()-&gt;data($data);<br>json()-&gt;data($data);</p>\r\n<p>不过需要注意的是data方法设置的只是原始数据，并不一定是最终的输出数据，<br>最终的响应输出数据是会根据当前的Response响应类型做自动转换的，例如：<br>json()-&gt;data($data);</p>\r\n<p>最终的输出数据就是json_encode($data)转换后的数据。<br>如果要获取当前响应对象实例的实际输出数据可以使用getContent方法。</p>\r\n<p>设置状态码</p>\r\n<p>Response基类提供了code方法用于设置响应数据，但大部分情况<br>一般我们是直接在调用助手函数的时候直接传入状态码，例如：<br>json($data,201);<br>view($data,401);</p>\r\n<p>或者在后面链式调用code方法是等效的：<br>json($data)-&gt;code(201);</p>\r\n<p>除了  redirect函数的默认返回状态码是302之外，<br>其它方法没有指定状态码都是返回200状态码。</p>\r\n<p>如果要获取当前响应对象实例的状态码的值，可以使用getCode方法。<br>设置头信息</p>\r\n<p>可以使用Response类的header设置响应的头信息<br>json($data)-&gt;code(201)-&gt;header([‘Cache-control’ =&gt; ‘no-cache,must-revalidate’]);</p>\r\n<p>header方法支持两种方式设置，如果传入数组，则表示批量设置，如果传入两个参数，<br>第一个参数表示头信息名，第二个参数表示头信息的值，例如：<br>// 单个设置<br>header(‘Cache-control’, ‘no-cache,must-revalidate’);<br>// 批量设置<br>header([<br>‘Cache-control’ =&gt; ‘no-cache,must-revalidate’,<br>‘Last-Modified’ =&gt; gmdate(‘D, d M Y H<img src=\"https://www.webpagefx.com/tools/emoji-cheat-sheet/graphics/emojis/i.png\" class=\"emoji\" title=\"&#58;i&#58;\" alt=\"&#58;i&#58;\" />s’) . ‘ GMT’,<br>]);</p>\r\n', 'Response基类提供了data方法用于设置响应数据。\r\nresponse()->data($data);\r\njson()->data($data);\r\n\r\n不过需要注意的是data方法设置的只是原始数据，并不一定是最终的输出数据，\r\n最终的响应输出数据是会根据当前的Response响应类型做自动转换的，例如：\r\njson()->data($data);\r\n\r\n最终的输出数据就是json_encode($data)转换后的数据。\r\n如果要获取当前响应对象实例的实际输出数据可以使用getContent方法。\r\n\r\n设置状态码\r\n\r\nResponse基类提供了code方法用于设置响应数据，但大部分情况\r\n一般我们是直接在调用助手函数的时候直接传入状态码，例如：\r\njson($data,201);\r\nview($data,401);\r\n\r\n或者在后面链式调用code方法是等效的：\r\njson($data)->code(201);\r\n\r\n除了  redirect函数的默认返回状态码是302之外，\r\n其它方法没有指定状态码都是返回200状态码。\r\n\r\n如果要获取当前响应对象实例的状态码的值，可以使用getCode方法。\r\n设置头信息\r\n\r\n可以使用Response类的header设置响应的头信息\r\njson($data)->code(201)->header([\'Cache-control\' => \'no-cache,must-revalidate\']);\r\n\r\nheader方法支持两种方式设置，如果传入数组，则表示批量设置，如果传入两个参数，\r\n第一个参数表示头信息名，第二个参数表示头信息的值，例如：\r\n// 单个设置  \r\nheader(\'Cache-control\', \'no-cache,must-revalidate\');  \r\n// 批量设置  \r\nheader([\r\n\'Cache-control\' => \'no-cache,must-revalidate\',\r\n\'Last-Modified\' => gmdate(\'D, d M Y H:i:s\') . \' GMT\',  \r\n]);\r\n', 'editormd', '55', '1', '1', '', 'fds ', '', '0', '2019', '1', null, '1', '2019-11-04 09:30:04', '1', '1', '8', 'nihao,woshi,你好');
INSERT INTO `think_article` VALUES ('121', '这是测试的情况', '5', '/uploads/images/20191119/1d6d12ced99bccc629cde712531ab425.jpg', '', '', '<p>fdsfsdfdsfdsfdfdsfsdfdsfds没有人能够<img src=\"/uploads/images/20191104/7a603b60834330229b208b2a29a31d0d.jpg\" alt=\"\"></p>\r\n', 'fdsfsdfdsfdsfdfdsfsdfdsfds没有人能够![](/uploads/images/20191104/7a603b60834330229b208b2a29a31d0d.jpg)', 'editormd', '55', '1', '1', '', 'fds ', '', '0', '2019', '1', null, '1', '2019-11-05 11:08:53', '1', '1', '8', 'nihao,woshi');
INSERT INTO `think_article` VALUES ('122', '没有一次情况设置', '5', '/uploads/images/20191119/d1b782aafda01b38601bd4de9821c00f.jpg', '', '', '<p>fdsfsdfdsfdsfdfdsfsdfdsfds<br><img src=\"/uploads/images/20191104/f1a51011f37cad9ee97377aea653e19f.jpg\" alt=\"\"><br>Response基类提供了data方法用于设置响应数据。<br>response()-&gt;data($data);<br>json()-&gt;data($data);</p>\r\n<p>不过需要注意的是data方法设置的只是原始数据，并不一定是最终的输出数据，<br>最终的响应输出数据是会根据当前的Response响应类型做自动转换的，例如：<br>json()-&gt;data($data);</p>\r\n<p>最终的输出数据就是json_encode($data)转换后的数据。<br>如果要获取当前响应对象实例的实际输出数据可以使用getContent方法。</p>\r\n<p>设置状态码</p>\r\n<p>Response基类提供了code方法用于设置响应数据，但大部分情况<br>一般我们是直接在调用助手函数的时候直接传入状态码，例如：<br>json($data,201);<br>view($data,401);</p>\r\n<p>或者在后面链式调用code方法是等效的：<br>json($data)-&gt;code(201);</p>\r\n<p>除了  redirect函数的默认返回状态码是302之外，<br>其它方法没有指定状态码都是返回200状态码。</p>\r\n<p>如果要获取当前响应对象实例的状态码的值，可以使用getCode方法。<br>设置头信息</p>\r\n<p>可以使用Response类的header设置响应的头信息<br>json($data)-&gt;code(201)-&gt;header([‘Cache-control’ =&gt; ‘no-cache,must-revalidate’]);</p>\r\n<p>header方法支持两种方式设置，如果传入数组，则表示批量设置，如果传入两个参数，<br>第一个参数表示头信息名，第二个参数表示头信息的值，例如：<br>// 单个设置<br>header(‘Cache-control’, ‘no-cache,must-revalidate’);<br>// 批量设置<br>header([<br>‘Cache-control’ =&gt; ‘no-cache,must-revalidate’,<br>‘Last-Modified’ =&gt; gmdate(‘D, d M Y H<img src=\"https://www.webpagefx.com/tools/emoji-cheat-sheet/graphics/emojis/i.png\" class=\"emoji\" title=\"&#58;i&#58;\" alt=\"&#58;i&#58;\" />s’) . ‘ GMT’,<br>]);</p>\r\n', 'fdsfsdfdsfdsfdfdsfsdfdsfds\r\n![](/uploads/images/20191104/f1a51011f37cad9ee97377aea653e19f.jpg)\r\nResponse基类提供了data方法用于设置响应数据。\r\nresponse()->data($data);\r\njson()->data($data);\r\n\r\n不过需要注意的是data方法设置的只是原始数据，并不一定是最终的输出数据，\r\n最终的响应输出数据是会根据当前的Response响应类型做自动转换的，例如：\r\njson()->data($data);\r\n\r\n最终的输出数据就是json_encode($data)转换后的数据。\r\n如果要获取当前响应对象实例的实际输出数据可以使用getContent方法。\r\n\r\n设置状态码\r\n\r\nResponse基类提供了code方法用于设置响应数据，但大部分情况\r\n一般我们是直接在调用助手函数的时候直接传入状态码，例如：\r\njson($data,201);\r\nview($data,401);\r\n\r\n或者在后面链式调用code方法是等效的：\r\njson($data)->code(201);\r\n\r\n除了  redirect函数的默认返回状态码是302之外，\r\n其它方法没有指定状态码都是返回200状态码。\r\n\r\n如果要获取当前响应对象实例的状态码的值，可以使用getCode方法。\r\n设置头信息\r\n\r\n可以使用Response类的header设置响应的头信息\r\njson($data)->code(201)->header([\'Cache-control\' => \'no-cache,must-revalidate\']);\r\n\r\nheader方法支持两种方式设置，如果传入数组，则表示批量设置，如果传入两个参数，\r\n第一个参数表示头信息名，第二个参数表示头信息的值，例如：\r\n// 单个设置  \r\nheader(\'Cache-control\', \'no-cache,must-revalidate\');  \r\n// 批量设置  \r\nheader([\r\n\'Cache-control\' => \'no-cache,must-revalidate\',\r\n\'Last-Modified\' => gmdate(\'D, d M Y H:i:s\') . \' GMT\',  \r\n]);\r\n\r\n', 'editormd', '57', '1', '1', '', 'fds ', '', '0', '2019', '1', null, '1', '2019-11-05 11:09:54', '1', '1', '8', 'nihao,woshi,佛挡杀佛');

-- ----------------------------
-- Table structure for `think_article_cate`
-- ----------------------------
DROP TABLE IF EXISTS `think_article_cate`;
CREATE TABLE `think_article_cate` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '分类名称',
  `orderby` varchar(10) DEFAULT '100' COMMENT '排序',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态  1：开启  2：禁用',
  `pid` mediumint(8) NOT NULL DEFAULT '0',
  `level` smallint(4) NOT NULL DEFAULT '0',
  `content` text,
  `ora_content` text,
  `keywords` varchar(200) NOT NULL DEFAULT '',
  `is_suggest` tinyint(1) NOT NULL DEFAULT '0',
  `views` mediumint(8) NOT NULL DEFAULT '10',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '栏目类型1:列表页,2:单页面,3:图片页面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='文章分类表';

-- ----------------------------
-- Records of think_article_cate
-- ----------------------------
INSERT INTO `think_article_cate` VALUES ('1', '程序开发', '1', '1477140627', '1573185849', '1', '0', '0', '', '', '', '1', '10', '1');
INSERT INTO `think_article_cate` VALUES ('2', '操作系统', '2', '1477140627', '1573185891', '1', '0', '0', '', '', '', '0', '10', '1');
INSERT INTO `think_article_cate` VALUES ('3', '数据库', '3', '1477140627', '1573185908', '1', '0', '0', '', '', '', '0', '10', '1');
INSERT INTO `think_article_cate` VALUES ('4', '安全架构', '4', '1477140627', '1573186010', '1', '0', '0', '', '', '', '0', '0', '1');
INSERT INTO `think_article_cate` VALUES ('5', '资源分享', '5', '1477140627', '1573186115', '1', '0', '0', '', '', '', '0', '10', '1');
INSERT INTO `think_article_cate` VALUES ('6', '关于作者', '6', '1477140627', '1573186225', '1', '0', '0', '', '', '', '0', '10', '1');
INSERT INTO `think_article_cate` VALUES ('7', 'PHP', '1', '1531454088', '1573186263', '1', '1', '1', '', '', '', '0', '10', '1');
INSERT INTO `think_article_cate` VALUES ('8', 'HTML', '2', '1573186306', '1573186306', '1', '1', '1', '', '', '', '0', '10', '1');
INSERT INTO `think_article_cate` VALUES ('9', 'JS', '3', '1573186323', '1573186323', '1', '1', '1', '', '', '', '0', '10', '1');
INSERT INTO `think_article_cate` VALUES ('10', 'Linux', '1', '1573186448', '1573186448', '1', '2', '1', '', '', '', '0', '10', '1');
INSERT INTO `think_article_cate` VALUES ('11', 'Windows', '2', '1573186486', '1573186745', '1', '2', '1', '', '', '', '0', '10', '1');
INSERT INTO `think_article_cate` VALUES ('12', 'MSSQL', '1', '1573186518', '1573186518', '1', '3', '1', '', '', '', '0', '10', '1');
INSERT INTO `think_article_cate` VALUES ('13', 'MYSQL', '2', '1573186533', '1573186533', '1', '3', '1', '', '', '', '0', '10', '1');
INSERT INTO `think_article_cate` VALUES ('14', 'ORACLE', '3', '1573186562', '1573186562', '1', '3', '1', '', '', '', '0', '10', '1');
INSERT INTO `think_article_cate` VALUES ('15', '这是测试的项目', '5', '1573186900', '1573186900', '0', '0', '0', '', '', '', '0', '10', '1');

-- ----------------------------
-- Table structure for `think_article_tag`
-- ----------------------------
DROP TABLE IF EXISTS `think_article_tag`;
CREATE TABLE `think_article_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `article_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章id',
  `tag` varchar(30) NOT NULL DEFAULT '' COMMENT '标签',
  PRIMARY KEY (`article_id`,`tag`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_article_tag
-- ----------------------------
INSERT INTO `think_article_tag` VALUES ('30', '120', 'woshi');
INSERT INTO `think_article_tag` VALUES ('29', '120', 'nihao');
INSERT INTO `think_article_tag` VALUES ('35', '121', 'nihao');
INSERT INTO `think_article_tag` VALUES ('36', '121', 'woshi');
INSERT INTO `think_article_tag` VALUES ('32', '122', 'nihao');
INSERT INTO `think_article_tag` VALUES ('33', '122', 'woshi');
INSERT INTO `think_article_tag` VALUES ('31', '120', '你好');
INSERT INTO `think_article_tag` VALUES ('34', '122', '佛挡杀佛');
INSERT INTO `think_article_tag` VALUES ('16', '106', 'LINUX');
INSERT INTO `think_article_tag` VALUES ('19', '110', 'GIT');
INSERT INTO `think_article_tag` VALUES ('20', '110', '版本控制');
INSERT INTO `think_article_tag` VALUES ('21', '112', 'windows');
INSERT INTO `think_article_tag` VALUES ('24', '116', 'mysql');

-- ----------------------------
-- Table structure for `think_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_group`;
CREATE TABLE `think_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '角色名称',
  `status` tinyint(1) NOT NULL COMMENT '角色状态 1：开启   2：禁用',
  `rules` text NOT NULL COMMENT '角色权限   SUPERAUTH：超级权限',
  `describe` text COMMENT '角色描述',
  `create_time` int(11) DEFAULT NULL COMMENT '生成时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户组数据表';

-- ----------------------------
-- Records of think_auth_group
-- ----------------------------
INSERT INTO `think_auth_group` VALUES ('1', '超级管理员', '1', 'SUPERAUTH', '至高无上的权利', '1446535750', '1541729583');
INSERT INTO `think_auth_group` VALUES ('2', '内容管理员', '1', '1,2,10,3,30,31,32,103,34,4,35,36,37,104,39,126,61,62,63,64,105,66,85,91,5,6,27,70,71,75,77,24,25,26,44,45,46,109,47,140,141,48,49,54,13,14,117,123,118,119,120,121,122,124,125,147', '负责layui后台内容管理', '1446535751', '1542010118');
INSERT INTO `think_auth_group` VALUES ('3', '系统维护员', '1', '1,2,9,10,11,12,3,30,31,32,33,34,4,35,36,37,38,39,5,6,7,8,27,28,29,13,14,22,24,25,40,41,42,43,26,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,70,71,72,73,74,80,75,76,77,78,79', '负责layui后台系统维护', '1446535752', '1540970649');
INSERT INTO `think_auth_group` VALUES ('4', '系统测试员', '1', '1,2,9,10,11,102,12,127,128,3,30,31,32,33,34,4,35,36,37,38,39,61,62,63,64,65,66,5,6,7,8,27,28,29,70,71,72,73,74,80,75,76,77,78,79,24,25,40,41,42,43,26,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,13,14,22', '负责layui后台系统测试', '1446535753', '1541729577');

-- ----------------------------
-- Table structure for `think_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_group_access`;
CREATE TABLE `think_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '角色权限id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-用户组关系表';

-- ----------------------------
-- Records of think_auth_group_access
-- ----------------------------
INSERT INTO `think_auth_group_access` VALUES ('1', '1');
INSERT INTO `think_auth_group_access` VALUES ('63', '2');

-- ----------------------------
-- Table structure for `think_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_rule`;
CREATE TABLE `think_auth_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '模块/控制器/方法',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '权限规则名称',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：菜单  2：按钮',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态  1：开启  2：禁用',
  `css` varchar(100) NOT NULL COMMENT '图标样式',
  `condition` varchar(100) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父栏目ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of think_auth_rule
-- ----------------------------
INSERT INTO `think_auth_rule` VALUES ('1', '#', '系统管理', '1', '1', 'fa fa-cog', '', '0', '1', '1446535750', '1541121645');
INSERT INTO `think_auth_rule` VALUES ('2', 'admin/user/index', '管理员管理', '1', '1', 'fa fa-ban', '', '1', '10', '1446535750', '1540544544');
INSERT INTO `think_auth_rule` VALUES ('3', 'admin/role/index', '角色管理', '1', '1', 'fa fa-ban', '', '1', '20', '1446535750', '1540434868');
INSERT INTO `think_auth_rule` VALUES ('4', 'admin/menu/index', '菜单管理', '1', '1', 'fa fa-ban', '', '1', '30', '1446535750', '1540434958');
INSERT INTO `think_auth_rule` VALUES ('5', '#', '数据库管理', '1', '1', 'fa fa-database', '', '0', '2', '1446535750', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('6', 'admin/data/index', '数据库备份', '1', '1', 'fa fa-ban', '', '5', '10', '1446535750', '1540435124');
INSERT INTO `think_auth_rule` VALUES ('7', 'admin/data/optimize', '优化表', '1', '1', 'fa fa-ban', '', '6', '50', '1477312169', '1540435130');
INSERT INTO `think_auth_rule` VALUES ('8', 'admin/data/repair', '修复表', '1', '1', 'fa fa-ban', '', '6', '50', '1477312169', '1540435138');
INSERT INTO `think_auth_rule` VALUES ('9', 'admin/user/useradd', '添加管理员', '1', '1', 'fa fa-ban', '', '2', '50', '1477312169', '1540434790');
INSERT INTO `think_auth_rule` VALUES ('10', 'admin/user/useredit', '编辑管理员', '1', '1', 'fa fa-ban', '', '2', '50', '1477312169', '1540434808');
INSERT INTO `think_auth_rule` VALUES ('11', 'admin/user/userdel', '删除管理员', '1', '1', 'fa fa-ban', '', '2', '50', '1477312169', '1540434818');
INSERT INTO `think_auth_rule` VALUES ('12', 'admin/user/user_state', '管理员状态', '1', '1', 'fa fa-ban', '', '2', '50', '1477312169', '1540434834');
INSERT INTO `think_auth_rule` VALUES ('13', '#', '日志管理', '1', '1', 'fa fa-tasks', '', '0', '7', '1477312169', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('14', 'admin/log/operate_log', '行为日志', '1', '1', 'fa fa-ban', '', '13', '10', '1477312169', '1540435216');
INSERT INTO `think_auth_rule` VALUES ('22', 'admin/log/del_log', '删除日志', '1', '1', 'fa fa-ban', '', '14', '50', '1477312169', '1540435224');
INSERT INTO `think_auth_rule` VALUES ('24', '#', '文章管理', '1', '1', 'fa fa-paste', '', '0', '4', '1477312169', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('26', 'admin/article/index', '文章列表', '1', '1', '', '', '24', '20', '1477312333', '1477312333');
INSERT INTO `think_auth_rule` VALUES ('27', 'admin/data/import', '数据库还原', '1', '1', 'fa fa-ban', '', '5', '20', '1477639870', '1540435152');
INSERT INTO `think_auth_rule` VALUES ('28', 'admin/data/revert', '还原备份', '1', '1', 'fa fa-ban', '', '27', '50', '1477639972', '1540435166');
INSERT INTO `think_auth_rule` VALUES ('29', 'admin/data/deldata', '删除备份', '1', '1', 'fa fa-ban', '', '27', '50', '1477640011', '1540435179');
INSERT INTO `think_auth_rule` VALUES ('30', 'admin/role/roleAdd', '添加角色', '1', '1', 'fa fa-ban', '', '3', '50', '1477640011', '1540434875');
INSERT INTO `think_auth_rule` VALUES ('31', 'admin/role/roleEdit', '编辑角色', '1', '1', 'fa fa-ban', '', '3', '50', '1477640011', '1540434889');
INSERT INTO `think_auth_rule` VALUES ('32', 'admin/role/roleDel', '删除角色', '1', '1', 'fa fa-ban', '', '3', '50', '1477640011', '1540434901');
INSERT INTO `think_auth_rule` VALUES ('33', 'admin/role/role_state', '角色状态', '1', '1', 'fa fa-ban', '', '3', '50', '1477640011', '1540434918');
INSERT INTO `think_auth_rule` VALUES ('34', 'admin/role/giveAccess', '权限分配', '1', '1', 'fa fa-ban', '', '3', '50', '1477640011', '1540434950');
INSERT INTO `think_auth_rule` VALUES ('35', 'admin/menu/add_rule', '添加菜单', '1', '1', 'fa fa-ban', '', '4', '50', '1477640011', '1540434966');
INSERT INTO `think_auth_rule` VALUES ('36', 'admin/menu/edit_rule', '编辑菜单', '1', '1', 'fa fa-ban', '', '4', '50', '1477640011', '1540434982');
INSERT INTO `think_auth_rule` VALUES ('37', 'admin/menu/del_rule', '删除菜单', '1', '1', 'fa fa-ban', '', '4', '50', '1477640011', '1540434991');
INSERT INTO `think_auth_rule` VALUES ('38', 'admin/menu/rule_state', '菜单状态', '1', '2', 'fa fa-ban', '', '4', '50', '1477640011', '1540435007');
INSERT INTO `think_auth_rule` VALUES ('39', 'admin/menu/ruleorder', '菜单排序', '1', '1', 'fa fa-ban', '', '4', '50', '1477640011', '1540435014');
INSERT INTO `think_auth_rule` VALUES ('44', 'admin/article/add_article', '添加文章', '1', '1', '', '', '26', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('45', 'admin/article/edit_article', '编辑文章', '1', '1', '', '', '26', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('46', 'admin/article/del_article', '删除文章', '1', '1', '', '', '26', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('47', 'admin/article/article_state', '文章状态', '1', '1', '', '', '26', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('61', 'admin/config/index', '配置管理', '1', '1', 'fa fa-ban', '', '1', '40', '1479908607', '1540435030');
INSERT INTO `think_auth_rule` VALUES ('62', 'admin/config/add_config', '添加配置', '1', '1', 'fa fa-ban', '', '61', '50', '1479908607', '1540435036');
INSERT INTO `think_auth_rule` VALUES ('63', 'admin/config/edit_config', '编辑配置', '1', '1', 'fa fa-ban', '', '61', '50', '1479908607', '1540435042');
INSERT INTO `think_auth_rule` VALUES ('64', 'admin/config/del_config', '删除配置', '1', '1', 'fa fa-ban', '', '61', '50', '1479908607', '1540435049');
INSERT INTO `think_auth_rule` VALUES ('65', 'admin/config/status_config', '配置状态', '1', '1', 'fa fa-ban', '', '61', '50', '1479908607', '1540435066');
INSERT INTO `think_auth_rule` VALUES ('66', 'admin/config/group', '网站配置', '1', '1', 'fa fa-ban', '', '1', '50', '1480316438', '1540435096');
INSERT INTO `think_auth_rule` VALUES ('85', 'admin/index/clear', '清除缓存', '1', '1', 'fa fa-ban', '', '66', '50', '1522485859', '1540435103');
INSERT INTO `think_auth_rule` VALUES ('91', 'admin/config/save', '保存配置', '1', '1', 'fa fa-ban', '', '66', '50', '1522824567', '1540435110');
INSERT INTO `think_auth_rule` VALUES ('92', 'admin/data/export', '备份表', '1', '1', 'fa fa-ban', '', '6', '50', '1523161011', '1540435145');
INSERT INTO `think_auth_rule` VALUES ('102', 'admin/user/batchdeluser', '批量删除', '1', '1', 'fa fa-ban', '', '11', '50', '1524645295', '1540434827');
INSERT INTO `think_auth_rule` VALUES ('103', 'admin/role/batchdelrole', '批量删除', '1', '1', 'fa fa-ban', '', '32', '50', '1524648181', '1540434911');
INSERT INTO `think_auth_rule` VALUES ('104', 'admin/menu/batchdelmenu', '批量删除', '1', '1', 'fa fa-ban', '', '37', '50', '1524653771', '1540434997');
INSERT INTO `think_auth_rule` VALUES ('105', 'admin/config/batchdelconfig', '批量删除', '1', '1', 'fa fa-ban', '', '64', '50', '1524653826', '1540435059');
INSERT INTO `think_auth_rule` VALUES ('109', 'admin/article/batchdelarticle', '批量删除', '1', '1', '', '', '46', '50', '1524654090', '1530680741');
INSERT INTO `think_auth_rule` VALUES ('112', 'admin/log/batchdellog', '批量删除', '1', '1', 'fa fa-ban', '', '14', '50', '1524654233', '1540435231');
INSERT INTO `think_auth_rule` VALUES ('116', 'admin/data/batchdeldata', '批量删除', '1', '1', 'fa fa-ban', '', '27', '50', '1524805218', '1540435185');
INSERT INTO `think_auth_rule` VALUES ('117', '#', '一级菜单', '1', '1', 'fa fa-bars', '', '0', '8', '1524876437', '1542268663');
INSERT INTO `think_auth_rule` VALUES ('118', '##', '二级菜单', '1', '1', 'fa fa-cubes', '', '117', '20', '1524879234', '1542268679');
INSERT INTO `think_auth_rule` VALUES ('119', 'admin/user/index', '三级菜单（页面）', '1', '1', '', '', '118', '50', '1524879401', '1525252090');
INSERT INTO `think_auth_rule` VALUES ('120', 'admin/user/addu', '页面操作（增删改）', '1', '1', '', '', '119', '50', '1524883447', '1524887249');
INSERT INTO `think_auth_rule` VALUES ('121', 'admin/user/addu', '页面操作（增删改）', '1', '1', '', '', '119', '50', '1524883471', '1524887260');
INSERT INTO `think_auth_rule` VALUES ('122', 'admin/user/index', '三级菜单（页面）', '1', '1', '', '', '118', '50', '1524883489', '1524887285');
INSERT INTO `think_auth_rule` VALUES ('123', 'admin/user/index', '二级菜单（页面）', '1', '1', '', '', '117', '10', '1524886031', '1524887304');
INSERT INTO `think_auth_rule` VALUES ('124', 'admin/index/webuploader', '多图上传', '1', '1', 'fa fa-cloud-upload', '', '0', '9', '1524886803', '1542267144');
INSERT INTO `think_auth_rule` VALUES ('125', 'admin/upload/showimg', '多图修改', '1', '1', 'fa fa-exchange', '', '0', '10', '1526277389', '1542267155');
INSERT INTO `think_auth_rule` VALUES ('126', 'admin/menu/editfield', '快捷编辑', '1', '1', 'fa fa-ban', '', '4', '50', '1529631518', '1540519615');
INSERT INTO `think_auth_rule` VALUES ('127', 'admin/user/forbiddenadmin', '批量禁用', '1', '1', 'fa fa-ban', '', '12', '50', '1530238799', '1540434840');
INSERT INTO `think_auth_rule` VALUES ('128', 'admin/user/usingadmin', '批量启用', '1', '1', 'fa fa-ban', '', '12', '50', '1530238799', '1540434847');
INSERT INTO `think_auth_rule` VALUES ('130', 'admin/role/forbiddenrole', '批量禁用', '1', '1', 'fa fa-ban', '', '33', '50', '1530248275', '1540434928');
INSERT INTO `think_auth_rule` VALUES ('131', 'admin/role/usingrole', '批量启用', '1', '1', 'fa fa-ban', '', '33', '50', '1530248275', '1540434940');
INSERT INTO `think_auth_rule` VALUES ('132', 'admin/config/forbiddenconfig', '批量禁用', '1', '1', 'fa fa-ban', '', '65', '50', '1530262327', '1540435073');
INSERT INTO `think_auth_rule` VALUES ('133', 'admin/config/usingconfig', '批量启用', '1', '1', 'fa fa-ban', '', '65', '50', '1530262327', '1540435089');
INSERT INTO `think_auth_rule` VALUES ('140', 'admin/article/forbiddenarticle', '批量禁用', '1', '1', '#', '', '47', '50', '1530681605', '1530681605');
INSERT INTO `think_auth_rule` VALUES ('141', 'admin/article/usingarticle', '批量启用', '1', '1', '#', '', '47', '50', '1530681605', '1530681605');
INSERT INTO `think_auth_rule` VALUES ('146', 'admin/user/exceladmin', '导出excel', '1', '1', 'fa fa-ban', '', '2', '50', '1531280281', '1540434858');
INSERT INTO `think_auth_rule` VALUES ('147', 'http://www.baidu.com', '百度', '1', '1', 'fa fa-external-link-square', '', '0', '11', '1535727236', '1540547376');
INSERT INTO `think_auth_rule` VALUES ('165', 'admin/email/index', '第三方服务', '1', '1', 'fa fa-envelope-o', '', '0', '50', '1542181775', '1542181775');
INSERT INTO `think_auth_rule` VALUES ('166', 'admin/email/sendEmail', '邮件', '1', '1', 'fa fa-envelope-open-o', '', '165', '50', '1542266986', '1542266986');
INSERT INTO `think_auth_rule` VALUES ('167', 'admin/email/sendYzxCodegf', '云之讯短信', '1', '1', 'fa fa-paper-plane', '', '165', '50', '1542266986', '1542266986');
INSERT INTO `think_auth_rule` VALUES ('168', 'admin/email/sendAliCode', '阿里短信', '1', '1', 'fa fa-paper-plane', '', '165', '50', '1542266986', '1542266986');
INSERT INTO `think_auth_rule` VALUES ('169', 'admin/article/index_cate', '文章分类', '1', '1', 'fa fa-automobile', '', '24', '20', '1572326753', '1572326753');
INSERT INTO `think_auth_rule` VALUES ('170', 'admin/article/addCate', '添加分类', '1', '1', 'fa fa-arrows-h', '', '169', '30', '1572326830', '1572326830');
INSERT INTO `think_auth_rule` VALUES ('171', 'admin/menu/metronic', 'Metronic', '1', '1', 'fa fa-anchor', '', '0', '30', '1572394046', '1572394046');

-- ----------------------------
-- Table structure for `think_config`
-- ----------------------------
DROP TABLE IF EXISTS `think_config`;
CREATE TABLE `think_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置标题',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL COMMENT '状态   1：开启   2：禁用',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='配置表';

-- ----------------------------
-- Records of think_config
-- ----------------------------
INSERT INTO `think_config` VALUES ('1', 'web_site_title', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1480575456', '1', '后台管理', '0');
INSERT INTO `think_config` VALUES ('2', 'web_site_description', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', '后台管理', '1');
INSERT INTO `think_config` VALUES ('3', 'web_site_keyword', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', 'ThinkPHP,layuiAdmin', '8');
INSERT INTO `think_config` VALUES ('4', 'web_site_close', '4', '站点状态', '1', '0:关闭,1:开启', '站点关闭后其他管理员不能访问，超级管理员可以正常访问', '1378898976', '1529630265', '1', '1', '0');
INSERT INTO `think_config` VALUES ('9', 'config_type_list', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\n1:字符\n2:文本\n3:数组\n4:枚举', '2');
INSERT INTO `think_config` VALUES ('10', 'web_site_icp', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“ 陇ICP备15002349号-1', '1378900335', '1480643159', '1', ' 京ICP备15002349号', '0');
INSERT INTO `think_config` VALUES ('20', 'config_group_list', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\n2:内容\n3:用户\n4:系统', '4');
INSERT INTO `think_config` VALUES ('25', 'pages', '0', '每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1533521664', '1', '10', '0');
INSERT INTO `think_config` VALUES ('26', 'user_allow_register', '4', '开放注册', '3', '0:关闭注册\n1:允许注册', '是否开放用户注册', '1379504487', '1533521585', '1', '0', '3');
INSERT INTO `think_config` VALUES ('28', 'data_backup_path', '1', '备份根路径', '4', '', '数据库备份根路径，路径必须以 / 结尾', '1381482411', '1533521561', '1', './data/', '5');
INSERT INTO `think_config` VALUES ('29', 'data_backup_part_size', '0', '备份卷大小', '4', '', '数据库备份卷大小，该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1533521547', '1', '20971520', '7');
INSERT INTO `think_config` VALUES ('30', 'data_backup_compress', '4', '是否启用压缩', '4', '0:不压缩\n1:启用压缩', '数据库压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1533521364', '1', '0', '9');
INSERT INTO `think_config` VALUES ('31', 'data_backup_compress_level', '4', '备份压缩级别', '4', '1:普通\n4:一般\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1533521328', '1', '9', '10');
INSERT INTO `think_config` VALUES ('36', 'admin_allow_ip', '2', '禁止访问IP', '4', '', '后台禁止访问IP，多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1533521226', '1', '0.0.0.0', '0');
INSERT INTO `think_config` VALUES ('37', 'app_trace', '4', 'Trace', '4', '0:关闭\n1:开启', '是否显示页面Trace信息', '1387165685', '1537846673', '1', '0', '0');
INSERT INTO `think_config` VALUES ('49', 'log_std', '4', '本地日志', '1', '0:关闭,1:开启', '是否开启记录日志文件', '1540200530', '1540264970', '1', '0', '50');

-- ----------------------------
-- Table structure for `think_log`
-- ----------------------------
DROP TABLE IF EXISTS `think_log`;
CREATE TABLE `think_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `admin_name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `ip` char(60) DEFAULT NULL COMMENT 'IP地址',
  `status` int(3) DEFAULT NULL COMMENT '200 成功 100 失败',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `ipaddr` varchar(255) DEFAULT NULL COMMENT 'ip地区信息',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4724 DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of think_log
-- ----------------------------
INSERT INTO `think_log` VALUES ('4637', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1572236381', '内网IP');
INSERT INTO `think_log` VALUES ('4638', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1572236651', '内网IP');
INSERT INTO `think_log` VALUES ('4639', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1572318199', '内网IP');
INSERT INTO `think_log` VALUES ('4640', '1', 'admin', '用户【admin】优化数据库成功', '127.0.0.1', '200', '1572319204', '内网IP');
INSERT INTO `think_log` VALUES ('4641', '1', 'admin', '菜单【添加管理员】禁用成功', '127.0.0.1', '200', '1572321684', '内网IP');
INSERT INTO `think_log` VALUES ('4642', '1', 'admin', '菜单【添加管理员】启用成功', '127.0.0.1', '200', '1572321684', '内网IP');
INSERT INTO `think_log` VALUES ('4643', '1', 'admin', '退出登录', '127.0.0.1', '200', '1572324867', '内网IP');
INSERT INTO `think_log` VALUES ('4644', null, null, '退出登录', '127.0.0.1', '200', '1572325359', '内网IP');
INSERT INTO `think_log` VALUES ('4645', null, null, '退出登录', '127.0.0.1', '200', '1572325405', '内网IP');
INSERT INTO `think_log` VALUES ('4646', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1572325422', '内网IP');
INSERT INTO `think_log` VALUES ('4647', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1572326543', '内网IP');
INSERT INTO `think_log` VALUES ('4648', '1', 'admin', '多菜单添加成功', '127.0.0.1', '200', '1572326753', '内网IP');
INSERT INTO `think_log` VALUES ('4649', '1', 'admin', '多菜单添加成功', '127.0.0.1', '200', '1572326830', '内网IP');
INSERT INTO `think_log` VALUES ('4650', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1572333752', '内网IP');
INSERT INTO `think_log` VALUES ('4651', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1572393635', '内网IP');
INSERT INTO `think_log` VALUES ('4652', '1', 'admin', '多菜单添加成功', '127.0.0.1', '200', '1572394046', '内网IP');
INSERT INTO `think_log` VALUES ('4653', '1', 'admin', '管理员【kevin】编辑成功', '127.0.0.1', '200', '1572394833', '内网IP');
INSERT INTO `think_log` VALUES ('4654', '63', 'kevin', '管理员【kevin】登录成功', '127.0.0.1', '200', '1572394865', '内网IP');
INSERT INTO `think_log` VALUES ('4655', '0', '2', '1', '127.0.0.1', '0', '1572770208', '内网IP');
INSERT INTO `think_log` VALUES ('4656', '0', '2', '1', '127.0.0.1', '0', '1572770224', '内网IP');
INSERT INTO `think_log` VALUES ('4657', '0', '1', '1', '127.0.0.1', '0', '1572770392', '内网IP');
INSERT INTO `think_log` VALUES ('4658', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1572828271', '内网IP');
INSERT INTO `think_log` VALUES ('4659', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1572829678', '内网IP');
INSERT INTO `think_log` VALUES ('4660', '1', 'admin', '退出登录', '127.0.0.1', '200', '1572829695', '内网IP');
INSERT INTO `think_log` VALUES ('4661', '2', 'kevin', '管理员【kevin】登录成功', '127.0.0.1', '200', '1572829705', '内网IP');
INSERT INTO `think_log` VALUES ('4662', '2', 'kevin', '管理员【kevin】登录成功', '127.0.0.1', '200', '1572830901', '内网IP');
INSERT INTO `think_log` VALUES ('4663', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1572841494', '内网IP');
INSERT INTO `think_log` VALUES ('4664', '0', '1', '1', '127.0.0.1', '0', '1572858855', '内网IP');
INSERT INTO `think_log` VALUES ('4665', '0', '1', '1', '127.0.0.1', '0', '1572858928', '内网IP');
INSERT INTO `think_log` VALUES ('4666', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1572915540', '内网IP');
INSERT INTO `think_log` VALUES ('4667', '0', '1', '1', '127.0.0.1', '0', '1572920799', '内网IP');
INSERT INTO `think_log` VALUES ('4668', '0', '1', '1', '127.0.0.1', '0', '1572922746', '内网IP');
INSERT INTO `think_log` VALUES ('4669', '0', '1', '1', '127.0.0.1', '0', '1572922957', '内网IP');
INSERT INTO `think_log` VALUES ('4670', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1573010923', '内网IP');
INSERT INTO `think_log` VALUES ('4671', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1573091126', '内网IP');
INSERT INTO `think_log` VALUES ('4672', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1573118056', '内网IP');
INSERT INTO `think_log` VALUES ('4673', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1573171067', '内网IP');
INSERT INTO `think_log` VALUES ('4674', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1573173257', '内网IP');
INSERT INTO `think_log` VALUES ('4675', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1573185539', '内网IP');
INSERT INTO `think_log` VALUES ('4676', '0', '1', '1', '127.0.0.1', '0', '1573185849', '内网IP');
INSERT INTO `think_log` VALUES ('4677', '0', '1', '1', '127.0.0.1', '0', '1573185891', '内网IP');
INSERT INTO `think_log` VALUES ('4678', '0', '1', '1', '127.0.0.1', '0', '1573185908', '内网IP');
INSERT INTO `think_log` VALUES ('4679', '0', '1', '1', '127.0.0.1', '0', '1573185968', '内网IP');
INSERT INTO `think_log` VALUES ('4680', '0', '1', '1', '127.0.0.1', '0', '1573185991', '内网IP');
INSERT INTO `think_log` VALUES ('4681', '0', '1', '1', '127.0.0.1', '0', '1573186010', '内网IP');
INSERT INTO `think_log` VALUES ('4682', '0', '1', '1', '127.0.0.1', '0', '1573186115', '内网IP');
INSERT INTO `think_log` VALUES ('4683', '0', '1', '1', '127.0.0.1', '0', '1573186153', '内网IP');
INSERT INTO `think_log` VALUES ('4684', '0', '1', '1', '127.0.0.1', '0', '1573186213', '内网IP');
INSERT INTO `think_log` VALUES ('4685', '0', '1', '1', '127.0.0.1', '0', '1573186225', '内网IP');
INSERT INTO `think_log` VALUES ('4686', '0', '1', '1', '127.0.0.1', '0', '1573186263', '内网IP');
INSERT INTO `think_log` VALUES ('4687', '0', '1', '1', '127.0.0.1', '0', '1573186306', '内网IP');
INSERT INTO `think_log` VALUES ('4688', '0', '1', '1', '127.0.0.1', '0', '1573186323', '内网IP');
INSERT INTO `think_log` VALUES ('4689', '0', '1', '1', '127.0.0.1', '0', '1573186448', '内网IP');
INSERT INTO `think_log` VALUES ('4690', '0', '1', '1', '127.0.0.1', '0', '1573186486', '内网IP');
INSERT INTO `think_log` VALUES ('4691', '0', '1', '1', '127.0.0.1', '0', '1573186518', '内网IP');
INSERT INTO `think_log` VALUES ('4692', '0', '1', '1', '127.0.0.1', '0', '1573186533', '内网IP');
INSERT INTO `think_log` VALUES ('4693', '0', '1', '1', '127.0.0.1', '0', '1573186562', '内网IP');
INSERT INTO `think_log` VALUES ('4694', '0', '1', '1', '127.0.0.1', '0', '1573186745', '内网IP');
INSERT INTO `think_log` VALUES ('4695', '0', '1', '1', '127.0.0.1', '0', '1573186900', '内网IP');
INSERT INTO `think_log` VALUES ('4696', '0', '1', '1', '127.0.0.1', '0', '1573186905', '内网IP');
INSERT INTO `think_log` VALUES ('4697', '0', '1', '1', '127.0.0.1', '0', '1573187231', '内网IP');
INSERT INTO `think_log` VALUES ('4698', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1573346426', '内网IP');
INSERT INTO `think_log` VALUES ('4699', '0', '1', '1', '127.0.0.1', '0', '1573362057', '内网IP');
INSERT INTO `think_log` VALUES ('4700', '0', '1', '1', '127.0.0.1', '0', '1573362106', '内网IP');
INSERT INTO `think_log` VALUES ('4701', '0', '1', '1', '127.0.0.1', '0', '1573362138', '内网IP');
INSERT INTO `think_log` VALUES ('4702', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1573536141', '内网IP');
INSERT INTO `think_log` VALUES ('4703', '1', 'admin', '退出登录', '127.0.0.1', '200', '1573536461', '内网IP');
INSERT INTO `think_log` VALUES ('4704', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1573537660', '内网IP');
INSERT INTO `think_log` VALUES ('4705', '1', 'admin', '管理员【admin】登录失败：密码错误', '127.0.0.1', '100', '1573690105', '内网IP');
INSERT INTO `think_log` VALUES ('4706', '1', 'admin', '管理员【admin】登录失败：密码错误', '127.0.0.1', '100', '1573690116', '内网IP');
INSERT INTO `think_log` VALUES ('4707', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1573690124', '内网IP');
INSERT INTO `think_log` VALUES ('4708', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1574124118', '内网IP');
INSERT INTO `think_log` VALUES ('4709', '1', 'admin', '退出登录', '127.0.0.1', '200', '1574129730', '内网IP');
INSERT INTO `think_log` VALUES ('4710', '1', 'admin', '管理员【admin】登录成功', '127.0.0.1', '200', '1574143326', '内网IP');
INSERT INTO `think_log` VALUES ('4711', '0', '1', '1', '127.0.0.1', '0', '1574143893', '内网IP');
INSERT INTO `think_log` VALUES ('4712', '0', '1', '1', '127.0.0.1', '0', '1574144141', '内网IP');
INSERT INTO `think_log` VALUES ('4713', '0', '1', '1', '127.0.0.1', '0', '1574144162', '内网IP');
INSERT INTO `think_log` VALUES ('4714', '0', '1', '1', '127.0.0.1', '0', '1574145869', '内网IP');
INSERT INTO `think_log` VALUES ('4715', '0', '1', '1', '127.0.0.1', '0', '1574145892', '内网IP');
INSERT INTO `think_log` VALUES ('4716', '0', '1', '1', '127.0.0.1', '0', '1574145909', '内网IP');
INSERT INTO `think_log` VALUES ('4717', '0', '1', '1', '127.0.0.1', '0', '1574145964', '内网IP');
INSERT INTO `think_log` VALUES ('4718', '0', '1', '1', '127.0.0.1', '0', '1574145996', '内网IP');
INSERT INTO `think_log` VALUES ('4719', '0', '1', '1', '127.0.0.1', '0', '1574146030', '内网IP');
INSERT INTO `think_log` VALUES ('4720', '0', '1', '1', '127.0.0.1', '0', '1574146039', '内网IP');
INSERT INTO `think_log` VALUES ('4721', '0', '1', '1', '127.0.0.1', '0', '1574146074', '内网IP');
INSERT INTO `think_log` VALUES ('4722', '0', '1', '1', '127.0.0.1', '0', '1574146307', '内网IP');
INSERT INTO `think_log` VALUES ('4723', '1', 'admin', '清除缓存成功', '127.0.0.1', '200', '1574146319', '内网IP');

-- ----------------------------
-- Table structure for `think_word`
-- ----------------------------
DROP TABLE IF EXISTS `think_word`;
CREATE TABLE `think_word` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '敏感词id',
  `word` varchar(255) DEFAULT NULL COMMENT '敏感词',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_word
-- ----------------------------

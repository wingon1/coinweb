# coinweb



CREATE TABLE `bbs` (
  `bbsID` int(11) NOT NULL AUTO_INCREMENT,
  `rno` int(11) DEFAULT NULL,
  `bbsTitle` varchar(45) DEFAULT NULL,
  `userID` varchar(45) DEFAULT NULL,
  `bbsContent` text DEFAULT NULL,
  `fdate` datetime DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `bbsdate` datetime DEFAULT NULL,
  PRIMARY KEY (`bbsID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `board_likeit` (
  `bid` int(11) NOT NULL,
  `id` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `idx` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `coin_history` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `price_completed` int(11) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `coin` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `hdate` datetime DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `coin_order` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `amount_completed` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `price_completed` float DEFAULT NULL,
  `coin` varchar(45) DEFAULT NULL,
  `odate` datetime DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

CREATE TABLE `coinweb_board` (
  `rno` int(11) DEFAULT NULL,
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `hits` int(11) DEFAULT NULL,
  `likeit` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `fbdate` datetime DEFAULT NULL,
  `rfname` varchar(45) DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `bdate` datetime DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

CREATE TABLE `coinweb_board_reply` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(45) DEFAULT NULL,
  `rname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `rdate` datetime DEFAULT NULL,
  `likeit` int(11) DEFAULT NULL,
  `dislikeit` int(11) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `coinweb_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rno` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  `agree` varchar(45) DEFAULT NULL,
  `jdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE `reply_likeit` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

CREATE TABLE `wallet` (
  `id` int(11) DEFAULT NULL,
  `using_balance` float DEFAULT NULL,
  `tot_balance` float DEFAULT NULL,
  `available_balance` float DEFAULT NULL,
  `coin_avail` float DEFAULT NULL,
  `coin_using` float DEFAULT NULL,
  `coin_tot` float DEFAULT NULL,
  `coin` varchar(45) DEFAULT NULL,
  `coin_name` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;




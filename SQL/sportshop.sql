/*
Navicat MySQL Data Transfer

Source Server         : quyetdaica
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : sportshop

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-06-05 20:40:47
*/
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'vanloc123';
flush privileges;
CREATE DATABASE webshop;
use webshop;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id_comment` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(255) DEFAULT NULL,
  `email_user` varchar(255) DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_comment`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', 'quyetdakmil@gmail.com', 'Sản phẩm giá rẻ, chất lượng tốt', '2018-05-28 15:18:34');

-- ----------------------------
-- Table structure for ctdonhang
-- ----------------------------
DROP TABLE IF EXISTS `ctdonhang`;
CREATE TABLE `ctdonhang` (
  `madonhang` int(11) unsigned NOT NULL,
  `masanpham` int(11) unsigned NOT NULL,
  `dongia` float(255,0) DEFAULT NULL,
  `soluong` int(11) DEFAULT NULL,
  PRIMARY KEY (`madonhang`,`masanpham`),
  KEY `ctdonhang_sanpham` (`masanpham`),
  CONSTRAINT `ctdonhang_donhang` FOREIGN KEY (`madonhang`) REFERENCES `donhang` (`madonhang`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `ctdonhang_sanpham` FOREIGN KEY (`masanpham`) REFERENCES `sanpham` (`masanpham`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ctdonhang
-- ----------------------------
INSERT INTO `ctdonhang` VALUES ('1', '1', '300000', '1');

-- ----------------------------
-- Table structure for donhang
-- ----------------------------
DROP TABLE IF EXISTS `donhang`;
CREATE TABLE `donhang` (
  `madonhang` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ngaydat` datetime DEFAULT NULL,
  `diachigiaohang` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sdt` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `ngaygiaodukien` date DEFAULT NULL,
  `ngaygiaothucte` datetime DEFAULT NULL,
  `tongtien` float(255,0) DEFAULT NULL,
  `tinhtrang` int(1) unsigned DEFAULT '0',
  PRIMARY KEY (`madonhang`),
  KEY `donhang_user` (`email`),
  CONSTRAINT `donhang_user` FOREIGN KEY (`email`) REFERENCES `taikhoan` (`email`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of donhang
-- ----------------------------
INSERT INTO `donhang` VALUES ('1', 'quyetdakmil@gmail.com', '2018-05-14 00:00:00', '57 Tô Hiệu, Hiệp Tân, Tân Phú, HCM', '01689957265', '2018-05-20', '2018-05-25 00:00:00', '300000', '0');

-- ----------------------------
-- Table structure for giohang
-- ----------------------------
DROP TABLE IF EXISTS `giohang`;
CREATE TABLE `giohang` (
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `masp` int(255) NOT NULL,
  `gia` int(255) DEFAULT NULL,
  `soluong` int(255) DEFAULT NULL,
  PRIMARY KEY (`masp`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of giohang
-- ----------------------------
INSERT INTO `giohang` VALUES ('quyetdakmil@gmail.com', '1', '300000', '69');

-- ----------------------------
-- Table structure for loaisanpham
-- ----------------------------
DROP TABLE IF EXISTS `loaisanpham`;
CREATE TABLE `loaisanpham` (
  `maloai` int(11) NOT NULL AUTO_INCREMENT,
  `tenloai` varchar(255) CHARACTER SET utf8 DEFAULT '',
  PRIMARY KEY (`maloai`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of loaisanpham
-- ----------------------------
INSERT INTO `loaisanpham` VALUES ('1', 'Áo Bóng Đá');
INSERT INTO `loaisanpham` VALUES ('2', 'SportWear');
INSERT INTO `loaisanpham` VALUES ('3', 'Giày Thể Thao');
INSERT INTO `loaisanpham` VALUES ('4', 'Áo Bóng Rổ');
INSERT INTO `loaisanpham` VALUES ('5', 'Đồ Lưu Niệm');
INSERT INTO `loaisanpham` VALUES ('6', 'Giày Bóng Đá');
INSERT INTO `loaisanpham` VALUES ('7', 'Giày Bóng Rổ');
INSERT INTO `loaisanpham` VALUES ('8', 'Phụ Kiện Thể Thao');
INSERT INTO `loaisanpham` VALUES ('9', 'Áo World Cup 2018');

-- ----------------------------
-- Table structure for nhasanxuat
-- ----------------------------
DROP TABLE IF EXISTS `nhasanxuat`;
CREATE TABLE `nhasanxuat` (
  `ma_nsx` int(11) NOT NULL AUTO_INCREMENT,
  `ten_nsx` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ma_nsx`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nhasanxuat
-- ----------------------------
INSERT INTO `nhasanxuat` VALUES ('1', 'Tùng Sơn');
INSERT INTO `nhasanxuat` VALUES ('2', 'Sơn Tùng');
INSERT INTO `nhasanxuat` VALUES ('3', 'Adidas');
INSERT INTO `nhasanxuat` VALUES ('4', 'Nike');
INSERT INTO `nhasanxuat` VALUES ('5', 'Everlast');
INSERT INTO `nhasanxuat` VALUES ('6', 'BQQ');
INSERT INTO `nhasanxuat` VALUES ('7', 'Adizaro');
INSERT INTO `nhasanxuat` VALUES ('8', 'FIFA');

-- ----------------------------
-- Table structure for sanpham
-- ----------------------------
DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE `sanpham` (
  `masanpham` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tensanpham` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `gia` float(255,0) DEFAULT NULL,
  `soluong` int(255) DEFAULT NULL,
  `luotxem` int(255) unsigned DEFAULT '0',
  `daban` int(11) unsigned DEFAULT '0',
  `hinhanh` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ngaynhap` date DEFAULT NULL,
  `loaisanpham` int(11) DEFAULT NULL,
  `nhasanxuat` int(11) DEFAULT NULL,
  PRIMARY KEY (`masanpham`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sanpham
-- ----------------------------
INSERT INTO `sanpham` VALUES ('1', 'Áo PSG 2016-2017 mẫu thứ 3', '300000', '50', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_psg_2016_2017_san_khach20160816213927.jpg', '2018-05-12', '1', '1');
INSERT INTO `sanpham` VALUES ('2', 'Áo PSG 2016-2017 sân khách', '300000', '60', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_psg_2016_2017_san_khach20160818031505.jpg', '2018-05-12', '1', '1');
INSERT INTO `sanpham` VALUES ('3', 'Áo Barcelona 2016-2017 sân khách', '300000', '80', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_barcelona_2016_2017_san_khach20160818020218.jpg', '2018-05-12', '1', '1');
INSERT INTO `sanpham` VALUES ('4', 'Áo LA Galaxy 2016-2017 sân nhà', '300000', '12', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_la_galaxy_2016_2017_san_nha20160818015942.jpg', '2018-05-12', '1', '1');
INSERT INTO `sanpham` VALUES ('5', 'Áo Marseille 2016-2017 sân khách', '300000', '45', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_marseille_2016_2017_san_khach20160818015659.jpg', '2018-05-12', '1', '1');
INSERT INTO `sanpham` VALUES ('6', 'Áo Marseille 2016-2017 sân nhà', '300000', '45', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_marseille_2016_2017_san_nha20160818015549.jpg', '2018-05-12', '1', '1');
INSERT INTO `sanpham` VALUES ('7', 'Áo Bayern Munich 2016-2017 sân khách', '300000', '78', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_bayern_munich_2016_2017_san_khach20160818015423.jpg', '2018-05-12', '1', '1');
INSERT INTO `sanpham` VALUES ('8', 'Áo Sporting Lisbon 2016-2017 sân nhà', '300000', '98', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_sporting_lisbon_2016_2017_san_nha20160818014821.jpg', '2018-05-12', '1', '1');
INSERT INTO `sanpham` VALUES ('9', 'Áo Pumas Unam 2016-2017 sân nhà', '300000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_pumas_unam_2016_2017_san_nha20160818014454.jpg', '2018-05-12', '1', '1');
INSERT INTO `sanpham` VALUES ('10', 'Áo thủ môn MU 2016-2017', '300000', '12', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_thu_mon_mu_2016_201720160816221523.jpg', '2018-05-12', '1', '1');
INSERT INTO `sanpham` VALUES ('11', 'Áo Liverpool 2016-2017 sân khách', '320000', '45', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_liverpool_2016_2017_san_khach20160816220938.jpg', '2018-05-12', '1', '2');
INSERT INTO `sanpham` VALUES ('12', 'Áo Inter Milan 2016-2017 sân nhà', '300000', '74', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_inter_milan_2016_2017_san_nha20160816215907.jpg', '2018-05-12', '1', '2');
INSERT INTO `sanpham` VALUES ('13', 'Áo Leicester City 2016-2017 sân khách', '320000', '69', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_leicester_city_2016_2017_san_khach20160816215548.jpg', '2018-05-12', '1', '2');
INSERT INTO `sanpham` VALUES ('14', 'Áo Chelsea 2016-2017 sân nhà', '300000', '63', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_chelsea_2016_2017_san_nha20160816214856.jpg', '2018-05-12', '1', '2');
INSERT INTO `sanpham` VALUES ('15', 'Áo Tottemham 2016-2017 sân nhà', '300000', '25', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_tottemham_2016_2017_san_nha20160816213547.jpg', '2018-05-12', '1', '2');
INSERT INTO `sanpham` VALUES ('16', 'Áo Arsenal 2016-2017 sân khách', '300000', '12', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_arsenal_2016_2017_san_khach20160816213050.jpg', '2018-05-12', '1', '1');
INSERT INTO `sanpham` VALUES ('17', 'Áo Arsenal 2016-2017 sân nhà', '300000', '15', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_arsenal_2016_2017_san_nha20160816212938.jpg', '2018-05-12', '1', '1');
INSERT INTO `sanpham` VALUES ('18', 'Áo Man City 2016-2017 sân nhà', '300000', '18', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_man_city_2016_2017_san_nha20160816212727.jpg', '2018-05-12', '1', '1');
INSERT INTO `sanpham` VALUES ('19', 'Áo Dortmund 2016-2017 sân nhà tay dài', '300000', '87', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dortmund_2016_2017_san_nha_tay_dai20160816212230.jpg', '2018-05-12', '1', '1');
INSERT INTO `sanpham` VALUES ('20', 'Áo Dortmund 2016-2017 sân khách', '300000', '89', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dortmund_2016_2017_san_khach20160816212042.jpg', '2018-05-12', '1', '1');
INSERT INTO `sanpham` VALUES ('21', 'Áo Real Madrid 2016-2017 sân nhà tay dài', '300000', '58', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_real_madrid_2016_2017_san_nha_tay_dai20160816210217.jpg', '2018-05-12', '1', '1');
INSERT INTO `sanpham` VALUES ('22', 'Áo Barca 2016-2017 sân nhà', '300000', '68', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_barca_2016_2017_san_nha20160710235823.jpg', '2018-05-12', '1', '1');
INSERT INTO `sanpham` VALUES ('23', 'Áo Dortmund 2016-2017 sân nhà', '300000', '95', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dortmund_2016_2017_san_nha20160710235538.jpg', '2018-05-12', '1', '2');
INSERT INTO `sanpham` VALUES ('24', 'Áo PSG 2016-2017 sân nhà', '300000', '74', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_psg_2016_2017_san_nha20160710235334.jpg', '2018-05-12', '1', '2');
INSERT INTO `sanpham` VALUES ('25', 'Áo MU 2016-2017 sân khách', '300000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_mu_2016_2017_san_khach20160710235153.jpg', '2018-05-12', '1', '2');
INSERT INTO `sanpham` VALUES ('26', 'Áo Bayer Munich 2016-2017 sân nhà', '300000', '35', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_bayer_munich_2016_2017_san_nha20160710234907.jpg', '2018-05-12', '1', '2');
INSERT INTO `sanpham` VALUES ('27', 'Áo Juventus 2016-2017 sân nhà', '300000', '45', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_juventus_2016_2017_san_nha20160710234657.jpg', '2018-05-12', '1', '2');
INSERT INTO `sanpham` VALUES ('28', 'Áo AC Milan 2016-2017 sân nhà', '300000', '45', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_ac_milan_2016_2017_san_nha20160710234501.jpg', '2018-05-12', '1', '2');
INSERT INTO `sanpham` VALUES ('32', 'Áo Nike 1 xanh VNXK', '250000', '45', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_nike_1_vnxk20170327141535.jpg', '2018-05-12', '2', '4');
INSERT INTO `sanpham` VALUES ('33', 'Áo thun Adidas 4 trắng', '450000', '45', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_thun_adidas_4_trang20170327141246.jpg', '2018-05-12', '2', '3');
INSERT INTO `sanpham` VALUES ('34', 'Áo thun Adidas 4 xám đen', '450000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_thun_adidas_420170327140844.jpg', '2018-05-12', '2', '3');
INSERT INTO `sanpham` VALUES ('35', 'Áo thun Adidas 3 xám đậm', '300000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_thun_adidas_3_xam_dam20170327140731.jpg', '2018-05-12', '2', '3');
INSERT INTO `sanpham` VALUES ('36', 'Áo Adidas 3 lá xám', '250000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_adidas_3_la_xam20161128162316.jpg', '2018-05-12', '2', '3');
INSERT INTO `sanpham` VALUES ('37', 'Áo Adidas 3 lá đỏ', '250000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_adidas_3_la_do20161128162157.jpg', '2018-05-12', '2', '3');
INSERT INTO `sanpham` VALUES ('38', 'Áo Adidas 1 đỏ', '250000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_adidas_1_do20161128162907.jpg', '2018-05-12', '2', '3');
INSERT INTO `sanpham` VALUES ('39', 'Áo Adidas 1 xanh ngọc', '250000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_adidas_1_xanh_ngoc20161128163046.jpg', '2018-05-12', '2', '3');
INSERT INTO `sanpham` VALUES ('40', 'Áo Adidas 1 xanh chuối', '250000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_adidas_1_xanh_chuoi20161128163214.jpg', '2018-05-12', '2', '3');
INSERT INTO `sanpham` VALUES ('41', 'Áo Adidas 1 cam', '250000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_adidas_1_cam20161128163348.jpg', '2018-05-12', '2', '3');
INSERT INTO `sanpham` VALUES ('42', 'Áo Adidas 1 trắng', '250000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_adidas_1_trang20161128162733.jpg', '2018-05-12', '2', '3');
INSERT INTO `sanpham` VALUES ('43', 'Áo Adidas 1 đen', '250000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_adidas_1_den20161128162610.jpg', '2018-05-12', '2', '3');
INSERT INTO `sanpham` VALUES ('44', 'Áo Nike Pro 1 đen', '250000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_nike_pro_1_den20161128155609.jpg', '2018-05-12', '2', '4');
INSERT INTO `sanpham` VALUES ('45', 'Áo Nike Pro 1 xám nhạt', '250000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_nike_pro_1_xam_nhat20161128155437.jpg', '2018-05-12', '2', '4');
INSERT INTO `sanpham` VALUES ('46', 'Áo Nike Pro 1 xám đậm', '250000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_nike_pro_1_xanh_dam20161128155301.jpg', '2018-05-12', '2', '4');
INSERT INTO `sanpham` VALUES ('47', 'Áo Nike Pro 1 Trắng', '250000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_nike_pro_1_trang20161128155048.jpg', '2018-05-12', '2', '4');
INSERT INTO `sanpham` VALUES ('48', 'Áo thể thao Nike 3 trắng', '250000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_the_thao_nike_3_trang20160816231545.jpg', '2018-05-12', '2', '4');
INSERT INTO `sanpham` VALUES ('49', 'Áo thể thao Adidas 3 ngọc', '450000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_the_thao_adidas_3_ngoc20160816231151.jpg', '2018-05-12', '2', '3');
INSERT INTO `sanpham` VALUES ('50', 'Áo thể thao Adidas 3 xanh', '450000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_the_thao_adidas_3_xanh20160816231021.jpg', '2018-05-12', '2', '3');
INSERT INTO `sanpham` VALUES ('51', 'Áo thể thao Adidas 2 trắng', '380000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_the_thao_adidas_2_trang20160816230855.jpg', '2018-05-12', '2', '3');
INSERT INTO `sanpham` VALUES ('52', 'Áo thể thao Adidas 1 chuối', '230000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_the_thao_adidas_1_chuoi20160816225154.jpg', '2018-05-12', '2', '3');
INSERT INTO `sanpham` VALUES ('53', 'Giày Adizero Feather 4 LTD', '2850000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/giay_adizero_feather_4_ltd20150927194710.jpg', '2018-05-12', '3', '7');
INSERT INTO `sanpham` VALUES ('54', 'Giày Adidas Boost xám nhạt', '1800000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/giay_adidas_boost_xam_nhat20150820230442.jpg', '2018-05-12', '3', '3');
INSERT INTO `sanpham` VALUES ('55', 'Giày Adidas Boost xám đậm', '1800000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/giay_adidas_boost_xam20150820230142.jpg', '2018-05-12', '3', '3');
INSERT INTO `sanpham` VALUES ('56', 'Giày New Balance Vazee Rush đỏ', '1450000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/giay_new_balance_vazee_rush_do20150724141941.jpg', '2018-05-12', '3', '6');
INSERT INTO `sanpham` VALUES ('57', 'Giày New Balance Vazee Rush đen', '1450000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/giay_new_balance_vazee_rush_den20150724135045.jpg', '2018-05-12', '3', '6');
INSERT INTO `sanpham` VALUES ('58', 'Giày New Balance Vazee Rush xám', '145000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/giay_new_balance_vazee_rush_xam20150724134808.jpg', '2018-05-12', '3', '6');
INSERT INTO `sanpham` VALUES ('59', 'Giày New Balance Vazee Rush xanh', '1450000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/giay_new_balance_vazee_rush_xanh20150724134508.jpg', '2018-05-12', '3', '6');
INSERT INTO `sanpham` VALUES ('60', 'Giày New Balance Vazee Rush xanh chuố', '1450000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/giay_new_balance_vazee_rush_xanh_chuoi20150722155534.jpg', '2018-05-12', '3', '6');
INSERT INTO `sanpham` VALUES ('61', 'Giày Nike Air Max 1 Untra Moire đen/trắng', '1850000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/giay_nike_air_max_1_untra_moire_den_trang20150711213958.jpg', '2018-05-12', '3', '4');
INSERT INTO `sanpham` VALUES ('62', 'Giày Nike Air Max 1 Untra Moire đỏ/trắng', '1850000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/giay_nike_air_max_1_untra_moire_do_trang20150711213811.jpg', '2018-05-12', '3', '4');
INSERT INTO `sanpham` VALUES ('63', 'Giày Nike Air Max 1 Untra Moire đen', '1850000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/giay_nike_air_max_1_untra_moire_den20150711213615.jpg', '2018-05-12', '3', '4');
INSERT INTO `sanpham` VALUES ('64', 'Giày Nike Air Max 1 Untra Moire xanh', '1850000', '45', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/giay_nike_air_max_1_untra_moire_xanh20150711213152.jpg', '2018-05-12', '3', '4');
INSERT INTO `sanpham` VALUES ('65', 'Giày Nike Air Max 1 Untra Moire xám', '1850000', '41', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/giay_nike_air_max_1_untra_moire_xam20150711212944.jpg', '2018-05-12', '3', '4');
INSERT INTO `sanpham` VALUES ('66', 'Giày Nike Air Max 1 Untra Moire đỏ', '1850000', '52', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/giay_nike_air_max_1_untra_moire_do20150711212706.jpg', '2018-05-12', '3', '4');
INSERT INTO `sanpham` VALUES ('67', 'Giày Nike Structure 18', '1100000', '63', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/giay_nike20150528200727.jpg', '2018-05-12', '3', '4');
INSERT INTO `sanpham` VALUES ('68', 'Giày Nike Free 3.0 chuối - Authenic', '1850000', '63', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/giay_nike_free_3_0_chuoi_authenic20150528200508.jpg', '2018-05-12', '3', '4');
INSERT INTO `sanpham` VALUES ('69', 'Giày Nike Free 3.0 xám - Authenic', '1850000', '36', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/giay_nike_free_3_0_authenic20150528200307.jpg', '2018-05-12', '3', '4');
INSERT INTO `sanpham` VALUES ('70', 'Giày Everlast đen', '550000', '25', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/giay_everlast_den20150511170845.jpg', '2018-05-12', '3', '5');
INSERT INTO `sanpham` VALUES ('71', 'Giày Everlast đen/cam', '550000', '52', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/giay_everlast_den_cam20150511170704.jpg', '2018-05-12', '3', '5');
INSERT INTO `sanpham` VALUES ('72', 'Giày Nike Air Zoom Pegasus 31 đen/chuối', '1350000', '41', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/giay_nike_air_zoom_pegasus_31_den_chuoi20150406193753.jpg', '2018-05-12', '3', '4');
INSERT INTO `sanpham` VALUES ('73', 'Áo đấu Celtics xanh lá - Thomas VNXK Player', '500000', '14', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dau_orlando_den_gordon_vnxk_player20161204135612.jpg', '2018-05-12', '4', '1');
INSERT INTO `sanpham` VALUES ('74', 'Áo đấu Orlando đen - Gordon VNXK Player', '500000', '46', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dau_kings_xanh_ingram_vnxk_player20161204135408.jpg', '2018-05-12', '4', '1');
INSERT INTO `sanpham` VALUES ('75', 'Áo đấu Kings xanh - Ingram VNXK Player', '500000', '97', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dau_lakers_tim_ingram_vnxk_player20161204135238.jpg', '2018-05-12', '4', '1');
INSERT INTO `sanpham` VALUES ('76', 'Áo đấu Lakers tím - Ingram VNXK Player', '500000', '4', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dau_lakers_tim_vnxk_player20161204134822.jpg', '2018-05-12', '4', '2');
INSERT INTO `sanpham` VALUES ('77', 'Áo đấu Raptors - Lowry VNXK Player', '500000', '6', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dau_bulls_trang_wade_vnxk_player20161204134600.jpg', '2018-05-12', '4', '2');
INSERT INTO `sanpham` VALUES ('78', 'Áo đấu Bulls trắng - Wade VNXK Player', '500000', '31', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dau_bulls_do_wade_vnxk_player20161204134359.jpg', '2018-05-12', '4', '2');
INSERT INTO `sanpham` VALUES ('79', 'Áo đấu Bulls đỏ - Wade VNXK Player', '500000', '46', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dau_new_york_xanh_porzingis_vnxk_player20161204133810.jpg', '2018-05-12', '4', '2');
INSERT INTO `sanpham` VALUES ('80', 'Áo đấu New York xanh - Porzingis VNXK Player', '500000', '5', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dau_new_york_xanh_rose_vnxk_player20161204133447.jpg', '2018-05-12', '4', '2');
INSERT INTO `sanpham` VALUES ('81', 'Áo đấu New York xanh - Rose VNXK Player', '500000', '7', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dau_new_york_xanh_rose_vnxk_player20161204133309.jpg', '2018-05-12', '4', '1');
INSERT INTO `sanpham` VALUES ('82', 'Áo đấu New York trắng - Rose VNXK Player', '500000', '9', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dau_new_york_rose_vnxk_player20161204133045.jpg', '2018-05-12', '4', '1');
INSERT INTO `sanpham` VALUES ('83', 'Áo đấu Cavaliers trắng - Irving VNXK Player', '500000', '6', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dau_golden_state_trang_durrant_vnxk_player20161204132801.jpg', '2018-05-12', '4', '1');
INSERT INTO `sanpham` VALUES ('84', 'Áo đấu Golden State trắng - Durrant VNXK Player', '500000', '5', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dau_rocket_trang_harden_vnxk_player20161204132551.jpg', '2018-05-12', '4', '2');
INSERT INTO `sanpham` VALUES ('85', 'Áo đấu Rocket trắng - Harden VNXK Player', '500000', '4', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dau_portland_den_lillard_vnxk_player20161204132223.jpg', '2018-05-12', '4', '1');
INSERT INTO `sanpham` VALUES ('86', 'Áo đấu Portland đen - Lillard VNXK Player', '500000', '16', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dau_minnesota_xanh_dunn_vnxk_player20161204131552.jpg', '2018-05-12', '4', '1');
INSERT INTO `sanpham` VALUES ('87', 'Áo đấu Minnesota xanh - Dunn VNXK Player', '500000', '31', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dau_washington_do_wall_vnxk20161204122726.jpg', '2018-05-12', '4', '1');
INSERT INTO `sanpham` VALUES ('88', 'Áo đấu Washington đỏ - Wall VNXK', '350000', '16', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dau_atl_do_korver_vnxk20161202122839.jpg', '2018-05-12', '4', '1');
INSERT INTO `sanpham` VALUES ('89', 'Áo đấu ATL đỏ - Korver VNXK', '350000', '46', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dau_golden_state_xanh_curry_vnxk20161202122637.jpg', '2018-05-12', '4', '1');
INSERT INTO `sanpham` VALUES ('90', 'Áo đấu Golden State xanh - Curry VNXK', '350000', '98', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dau_bulls_trang_wade_vnxk20161202122355.jpg', '2018-05-12', '4', '2');
INSERT INTO `sanpham` VALUES ('91', 'Áo đấu Bulls trắng - Wade VNXK', '350000', '7', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dau_bulls_do_wade_vnxk20161202122217.jpg', '2018-05-12', '4', '2');
INSERT INTO `sanpham` VALUES ('92', 'Áo đấu Bulls đen - Rose VNXK', '350000', '8', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ao_dau_bulls_den_wade_vnxk20161202122031.jpg', '2018-05-12', '4', '2');
INSERT INTO `sanpham` VALUES ('93', 'Khăn choàng CLB Manchester United', '100000', '60', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/khan_choang_clb_manchester_united20140611172654.png', '2018-05-12', '5', '6');
INSERT INTO `sanpham` VALUES ('94', 'Khăn choàng CLB Arsenal', '100000', '50', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/khan_choang_clb_arsenal20140611172551.png', '2018-05-12', '5', null);
INSERT INTO `sanpham` VALUES ('95', 'Khăn choàng CLB Real Madrid', '100000', '40', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/khan_choang_clb_real_madrid20140611172401.png', '2018-05-12', '5', '6');
INSERT INTO `sanpham` VALUES ('96', 'Khăn choàng CLB Barcelona', '100000', '56', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/khan_choang_clb_barcelona20140611172311.png', '2018-05-12', '5', '6');
INSERT INTO `sanpham` VALUES ('97', 'Ly sứ tuyển Bồ Đào Nha\r\n', '100000', '13', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ly_su_tuyen_bo_dao_nha20140528155435.png', '2018-05-12', '5', '6');
INSERT INTO `sanpham` VALUES ('98', 'Ly sứ tuyển Italia', '100000', '98', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ly_su_tuyen_italia20140528154835.png', '2018-05-12', '5', '6');
INSERT INTO `sanpham` VALUES ('99', 'Cup vàng Worldcup 2014', '900000', '78', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/cup_vang_worldcup_201420140529112504.png', '2018-05-12', '5', '6');
INSERT INTO `sanpham` VALUES ('100', 'Ly sứ tuyển Brazil', '100000', '4', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ly_su_tuyen_brazil20140528161935.png', '2018-05-12', '5', '6');
INSERT INTO `sanpham` VALUES ('101', 'Ly sứ tuyển Pháp', '100000', '65', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ly_su_tuyen_duc20140528160240.png', '2018-05-12', '5', '6');
INSERT INTO `sanpham` VALUES ('102', 'Ly sứ tuyển Argentina', '100000', '5', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ly_su_tuyen_argentina20140528155713.png', '2018-05-12', '5', '6');
INSERT INTO `sanpham` VALUES ('103', 'Ly sứ CLB Barcelona', '100000', '50', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ly_su_clb_barcelona20140528151957.png', '2018-05-12', '5', '6');
INSERT INTO `sanpham` VALUES ('104', 'Ly sứ CLB AC Milan', '100000', '15', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ly_su_clb_ac_milan20140528151740.png', '2018-05-12', '5', '6');
INSERT INTO `sanpham` VALUES ('105', 'Ly sứ CLB Real Madrid', '100000', '46', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ly_su_clb_real_madrid20140528130201.png', '2018-05-12', '5', '6');
INSERT INTO `sanpham` VALUES ('106', 'Ly sứ CLB Bayer Munich', '100000', '46', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ly_su_clb_bayer_munich20140528130004.png', '2018-05-12', '5', '6');
INSERT INTO `sanpham` VALUES ('107', 'Đồng hồ treo tường tuyển Đức', '250000', '78', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/dong_ho_treo_tuong_tuyen_duc20140528112343.png', '2018-05-12', '5', '6');
INSERT INTO `sanpham` VALUES ('108', 'Đồng hồ treo tường tuyển Tây Ban Nha', '250000', '15', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/dong_ho_treo_tuong_tuyen_tay_ban_nha20140528112158.png', '2018-05-12', '5', '6');
INSERT INTO `sanpham` VALUES ('109', 'Đồng hồ treo tường tuyển Anh', '250000', '46', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/dong_ho_treo_tuong_tuyen_anh20140528111940.png', '2018-05-12', '5', '6');
INSERT INTO `sanpham` VALUES ('110', 'Đồng hồ treo tường tuyển Bồ Đào Nha', '250000', '98', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/dong_ho_treo_tuong_tuyen_bo_dao_nha20140528111730.png', '2018-05-12', '5', '6');
INSERT INTO `sanpham` VALUES ('111', 'Ly sứ Tây Ban Nha', '100000', '45', '0', '0', 'http://www.thangbesport.com/img/thumbnails/270/ly_su_tay_ban_nha20131206160039.png', '2018-05-12', '5', '6');
INSERT INTO `sanpham` VALUES ('112', 'Áo đấu Nga Worldcup 2018', '500000', '69', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/nga1.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('113', 'Áo đấu Arab Saudi Worldcup 2018', '500000', '46', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/arabia1.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('114', 'Áo đấu Ai Cập Worldcup 2018', '500000', '46', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/ai_cap1.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('115', 'Áo đấu Uruguay Worldcup 2018', '500000', '46', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/uruguay1.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('116', 'Áo đấu Bồ Đào Nha Worldcup 2018', '500000', '46', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/bo_dao_nha1.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('117', 'Áo đấu Tây Ban Nha Worldcup 2018', '500000', '13', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/tbn1.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('118', 'Áo đấu Morocco Worldcup 2018', '500000', '13', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/morocco.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('119', 'Áo đấu Iran Worldcup 2018', '500000', '13', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/31iran.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('120', 'Áo đấu Pháp Worldcup 2018', '500000', '46', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/phap1.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('121', 'Áo đấu Australia Worldcup 2018', '500000', '74', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/australia-kit.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('122', 'Áo đấu Peru Worldcup 2018', '500000', '78', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/peru1.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('123', 'Áo đấu Đan Mạch\r\n Worldcup 2018', '500000', '32', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/dan_mach2.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('124', 'Áo đấu Argentina Worldcup 2018', '500000', '65', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/argentina1.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('125', 'Áo đấu Iceland Worldcup 2018', '500000', '98', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/iceland.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('126', 'Áo đấu Croatia Worldcup 2018', '500000', '98', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/croatia1.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('127', 'Áo đấu Nigeria Worldcup 2018', '500000', '23', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/nigeria1.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('128', 'Áo đấu Brazil Worldcup 2018', '500000', '23', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/brazil1.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('129', 'Áo đấu Thụy Sỹ\r\n Worldcup 2018', '500000', '54', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/thuy_sy111.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('130', 'Áo đấu Costa Rica\r\n Worldcup 2018', '500000', '56', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/costa_rica2.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('131', 'Áo đấu Serbia Worldcup 2018', '500000', '98', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/serbia1.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('132', 'Áo đấu Đức Worldcup 2018', '500000', '7', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/duc1.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('133', 'Áo đấu Mexico Worldcup 2018', '500000', '32', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/mexico1.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('134', 'Áo đấu Thụy Điển\r\n Worldcup 2018', '500000', '4', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/thuy_dien1.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('135', 'Áo đấu Hàn Quốc\r\n Worldcup 2018', '500000', '56', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/korea2.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('136', 'Áo đấu Bỉ Worldcup 2018', '500000', '85', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/bi1.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('137', 'Áo đấu Panama Worldcup 2018', '500000', '25', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/panama111.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('138', 'Áo đấu Tunisia Worldcup 2018', '500000', '25', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/tunisia.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('139', 'Áo đấu Anh Worldcup 2018', '500000', '31', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/anh1.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('140', 'Áo đấu Ba Lan\r\n Worldcup 2018', '500000', '6', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/ba_lan1.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('141', 'Áo đấu Senegal Worldcup 2018', '500000', '87', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/senegal1.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('142', 'Áo đấu Colombia Worldcup 2018', '500000', '65', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/colombia1.jpg', '2018-06-02', '9', '8');
INSERT INTO `sanpham` VALUES ('143', 'Áo đấu Nhật Bản \r\nWorldcup 2018', '500000', '98', '0', '0', 'http://img.f8.bdpcdn.net/Assets/Media/2018/03/21/8/nhat_ban1.jpg', '2018-06-02', '9', '8');

-- ----------------------------
-- Table structure for taikhoan
-- ----------------------------
DROP TABLE IF EXISTS `taikhoan`;
CREATE TABLE `taikhoan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` int(1) unsigned DEFAULT '0',
  `status` int(1) unsigned DEFAULT '1',
  `createat` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emailunique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of taikhoan
-- ----------------------------
INSERT INTO `taikhoan` VALUES ('1', 'admin@sportshop.vn', '123456', 'Admin', null, 'Sport Shop', '0937378973', '1', '1', '2018-05-14 11:02:42');
INSERT INTO `taikhoan` VALUES ('2', 'vanlocduong1996@gmail.com', '123456', 'Paul', 'Duong', 'Đà Nắng', '03620744321', '2018-05-14 16:35:44');

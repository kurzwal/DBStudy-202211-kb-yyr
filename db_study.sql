-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.31 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- db_study 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `db_study`;
CREATE DATABASE IF NOT EXISTS `db_study` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_study`;

-- 테이블 db_study.order_dtl 구조 내보내기
DROP TABLE IF EXISTS `order_dtl`;
CREATE TABLE IF NOT EXISTS `order_dtl` (
  `id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `order_id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `product_id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `order_stock` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 db_study.order_dtl:~3 rows (대략적) 내보내기
DELETE FROM `order_dtl`;
INSERT INTO `order_dtl` (`id`, `order_id`, `product_id`, `order_stock`) VALUES
	('두번째 상품', '1번주문', '2번제품', 10),
	('세번째 상품', '1번주문', '3번제품', 4),
	('첫번째 상품', '1번주문', '1번제품', 3);

-- 테이블 db_study.order_mst 구조 내보내기
DROP TABLE IF EXISTS `order_mst`;
CREATE TABLE IF NOT EXISTS `order_mst` (
  `id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='상품구매용';

-- 테이블 데이터 db_study.order_mst:~1 rows (대략적) 내보내기
DELETE FROM `order_mst`;
INSERT INTO `order_mst` (`id`, `user_id`) VALUES
	('1번주문', 1);

-- 테이블 db_study.product_mst 구조 내보내기
DROP TABLE IF EXISTS `product_mst`;
CREATE TABLE IF NOT EXISTS `product_mst` (
  `id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'AUTO_INCREMENT',
  `product_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `product_price` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_name` (`product_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='상품정규화';

-- 테이블 데이터 db_study.product_mst:~7 rows (대략적) 내보내기
DELETE FROM `product_mst`;
INSERT INTO `product_mst` (`id`, `product_name`, `product_price`) VALUES
	('1번제품', '스타벅스 블랙 텀블러', 25000),
	('2번제품', '스타벅스 화이트 텀블러', 30000),
	('3번제품', '스타벅스 블루 텀블러', 20000),
	('4', '스타벅스 골든 텀블러', 20000000),
	('5', '스타벅스 블랙 머그컵', 15000),
	('6', '스타벅스 화이트 머그컵', 20000),
	('7', '스타벅스 블루 머그컵', 25000);

-- 테이블 db_study.student_mst 구조 내보내기
DROP TABLE IF EXISTS `student_mst`;
CREATE TABLE IF NOT EXISTS `student_mst` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `student_year` int NOT NULL,
  `score` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 db_study.student_mst:~9 rows (대략적) 내보내기
DELETE FROM `student_mst`;
INSERT INTO `student_mst` (`id`, `name`, `student_year`, `score`) VALUES
	(1, '임지현', 1, 80),
	(2, '신경수', 2, 100),
	(4, '문승주', 1, 85),
	(5, '장건녕', 2, 95),
	(6, '박수현', 3, 90),
	(7, '황석민', 1, 80),
	(8, '박준현', 2, 100),
	(9, '이승아', 3, 90),
	(12, NULL, 1, 100);

-- 테이블 db_study.study_notice_files 구조 내보내기
DROP TABLE IF EXISTS `study_notice_files`;
CREATE TABLE IF NOT EXISTS `study_notice_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `notice_id` int DEFAULT NULL,
  `file` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 db_study.study_notice_files:~8 rows (대략적) 내보내기
DELETE FROM `study_notice_files`;
INSERT INTO `study_notice_files` (`id`, `notice_id`, `file`) VALUES
	(1, 1, 'a.png'),
	(2, 1, 'b.png'),
	(3, 2, 'c.png'),
	(4, 2, 'd.png'),
	(5, 2, 'e.png'),
	(6, 3, 'f.png'),
	(7, 3, 'g.png'),
	(8, 3, 'h.png');

-- 테이블 db_study.study_notice_mst 구조 내보내기
DROP TABLE IF EXISTS `study_notice_mst`;
CREATE TABLE IF NOT EXISTS `study_notice_mst` (
  `id` int NOT NULL AUTO_INCREMENT,
  `제목` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `내용` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `작성자_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 db_study.study_notice_mst:~3 rows (대략적) 내보내기
DELETE FROM `study_notice_mst`;
INSERT INTO `study_notice_mst` (`id`, `제목`, `내용`, `작성자_id`) VALUES
	(1, '첫번째 공지사항', 'aaa', 1),
	(2, '두번째 공지사항', 'bbb', 2),
	(3, '세번째 공지사항', 'ccc', 1);

-- 테이블 db_study.study_notice_user 구조 내보내기
DROP TABLE IF EXISTS `study_notice_user`;
CREATE TABLE IF NOT EXISTS `study_notice_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 db_study.study_notice_user:~2 rows (대략적) 내보내기
DELETE FROM `study_notice_user`;
INSERT INTO `study_notice_user` (`id`, `username`) VALUES
	(1, '김준일'),
	(2, '김준이');

-- 테이블 db_study.user_dtl 구조 내보내기
DROP TABLE IF EXISTS `user_dtl`;
CREATE TABLE IF NOT EXISTS `user_dtl` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='user_mst의 서브쿼리';

-- 테이블 데이터 db_study.user_dtl:~3 rows (대략적) 내보내기
DELETE FROM `user_dtl`;
INSERT INTO `user_dtl` (`id`, `phone`, `address`, `create_date`, `update_date`) VALUES
	(1, NULL, NULL, '2022-12-12 09:35:44', '2022-12-12 09:35:44'),
	(2, NULL, NULL, '2022-12-12 09:35:44', '2022-12-12 09:35:44'),
	(3, NULL, NULL, '2022-12-12 09:35:44', '2022-12-12 09:35:44');

-- 테이블 db_study.user_mst 구조 내보내기
DROP TABLE IF EXISTS `user_mst`;
CREATE TABLE IF NOT EXISTS `user_mst` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 db_study.user_mst:~4 rows (대략적) 내보내기
DELETE FROM `user_mst`;
INSERT INTO `user_mst` (`id`, `username`, `password`, `name`, `email`, `create_date`, `update_date`) VALUES
	('1', 'aaa', '1234', '유열림', 'aaa@gmail.com', '2022-12-12 09:35:44', '2022-12-12 09:35:44'),
	('2', 'bbb', '1234', '유열림', 'aaa@gmail.com', '2022-12-12 09:35:44', '2022-12-12 09:35:44'),
	('3', 'ccc', '1234', '유열림', 'aaa@gmail.com', '2022-12-12 09:35:44', '2022-12-12 09:35:44'),
	('4', 'ddd', '1234', '유열림', 'aaa@gmail.com', '2022-12-12 09:35:44', '2022-12-12 09:35:44');

-- 트리거 db_study.user_mst_after_insert 구조 내보내기
DROP TRIGGER IF EXISTS `user_mst_after_insert`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `user_mst_after_insert` AFTER INSERT ON `user_mst` FOR EACH ROW BEGIN
/* 트리거는 테이블처럼 sql 내보내기 선택해서 저장해야함 */
	INSERT INTO
		user_dtl
		(id, create_date, update_date)
	VALUES
		(NEW.id, NOW(), NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 트리거 db_study.user_mst_before_delete 구조 내보내기
DROP TRIGGER IF EXISTS `user_mst_before_delete`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `user_mst_before_delete` BEFORE DELETE ON `user_mst` FOR EACH ROW BEGIN
	DELETE 
	FROM 
		user_dtl
	WHERE
		id = OLD.id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- db_study2 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `db_study2`;
CREATE DATABASE IF NOT EXISTS `db_study2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_study2`;

-- 테이블 db_study2.course_dtl 구조 내보내기
DROP TABLE IF EXISTS `course_dtl`;
CREATE TABLE IF NOT EXISTS `course_dtl` (
  `id` int NOT NULL AUTO_INCREMENT,
  `코스id` int DEFAULT NULL,
  `수강자id` int DEFAULT NULL,
  `상태id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 db_study2.course_dtl:~7 rows (대략적) 내보내기
DELETE FROM `course_dtl`;
INSERT INTO `course_dtl` (`id`, `코스id`, `수강자id`, `상태id`) VALUES
	(1, 1, 1, 1),
	(2, 2, 1, 2),
	(3, 3, 1, 2),
	(4, 1, 2, 2),
	(5, 3, 2, 1),
	(6, 1, 3, 1),
	(7, 1, 4, 2);

-- 테이블 db_study2.course_mst 구조 내보내기
DROP TABLE IF EXISTS `course_mst`;
CREATE TABLE IF NOT EXISTS `course_mst` (
  `id` int NOT NULL AUTO_INCREMENT,
  `수강명` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `수강명` (`수강명`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 db_study2.course_mst:~4 rows (대략적) 내보내기
DELETE FROM `course_mst`;
INSERT INTO `course_mst` (`id`, `수강명`) VALUES
	(3, 'c'),
	(1, 'java'),
	(2, 'python'),
	(4, 'web');

-- 테이블 db_study2.emp_mst 구조 내보내기
DROP TABLE IF EXISTS `emp_mst`;
CREATE TABLE IF NOT EXISTS `emp_mst` (
  `id` int NOT NULL AUTO_INCREMENT,
  `담당자` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 db_study2.emp_mst:~4 rows (대략적) 내보내기
DELETE FROM `emp_mst`;
INSERT INTO `emp_mst` (`id`, `담당자`) VALUES
	(1, '문성현'),
	(2, '윤대휘'),
	(3, '문자영'),
	(4, '정규민');

-- 테이블 db_study2.score_mst 구조 내보내기
DROP TABLE IF EXISTS `score_mst`;
CREATE TABLE IF NOT EXISTS `score_mst` (
  `id` int NOT NULL AUTO_INCREMENT,
  `코스id` int DEFAULT NULL,
  `점수` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 db_study2.score_mst:~5 rows (대략적) 내보내기
DELETE FROM `score_mst`;
INSERT INTO `score_mst` (`id`, `코스id`, `점수`) VALUES
	(1, 1, 80),
	(2, 2, 90),
	(3, 3, 70),
	(4, 2, 80),
	(5, 3, 70);

-- 테이블 db_study2.status_mst 구조 내보내기
DROP TABLE IF EXISTS `status_mst`;
CREATE TABLE IF NOT EXISTS `status_mst` (
  `id` int NOT NULL AUTO_INCREMENT,
  `상태` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 db_study2.status_mst:~2 rows (대략적) 내보내기
DELETE FROM `status_mst`;
INSERT INTO `status_mst` (`id`, `상태`) VALUES
	(1, '수강'),
	(2, '수료');

-- 테이블 db_study2.student_dtl 구조 내보내기
DROP TABLE IF EXISTS `student_dtl`;
CREATE TABLE IF NOT EXISTS `student_dtl` (
  `id` int NOT NULL,
  `담당자id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 db_study2.student_dtl:~5 rows (대략적) 내보내기
DELETE FROM `student_dtl`;
INSERT INTO `student_dtl` (`id`, `담당자id`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 3);

-- 테이블 db_study2.student_mst 구조 내보내기
DROP TABLE IF EXISTS `student_mst`;
CREATE TABLE IF NOT EXISTS `student_mst` (
  `id` int NOT NULL AUTO_INCREMENT,
  `성명` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 db_study2.student_mst:~5 rows (대략적) 내보내기
DELETE FROM `student_mst`;
INSERT INTO `student_mst` (`id`, `성명`) VALUES
	(1, '신경수'),
	(2, '고희주'),
	(3, '장건녕'),
	(4, '문승주'),
	(5, '이승아');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

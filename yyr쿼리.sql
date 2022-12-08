/* 

대소문자 구분이 없으므로 스네이크 표기법 사용

C R U D

INSERT (추가) - Create
SELECT (조회) - Read
UPDATE (수정) - Update
DELETE (삭제) - Delete

 */
/* Ctrl + Shift + F9 : 그 구문만 실행 */
INSERT INTO product_mst
/* (id, product_name, product_price)   : 모든 데이터가 순서에 맞게 전부 있으면 생략가능 */
VALUES
(0, '스타벅스 블랙 머그컵', 15000),
(0, '스타벅스 화이트 머그컵', 20000),
(0, '스타벅스 블루 머그컵', 25000);


SELECT
	id,
	product_name,
	product_price
FROM
	product_mst;

INSERT INTO
	student_mst
VALUES
	(0, '임지현', 1, 80),
	(0, '신경수', 2, 90),
	(0, '고희주', 3, 75),
	(0, '문승주', 1, 85),
	(0, '장건녕', 2, 95),
	(0, '박수현', 3, 90),
	(0, '황석민', 1, 80),
	(0, '박준현', 2, 85),
	(0, '이승아', 3, 90),
	(0, '김수현', 1, 75);

/*
SELECT 연산자 순서
FROM and JOIN > WHERE > GROUP BY > HAVING > SELECT > ORDER BY > LIMIT
*/
SELECT
	id,
	`name`, /* 키워드랑 안겹칠때 쓰는 부호 (물결표버튼) */
	student_year,
	score
FROM
	student_mst
WHERE		/* 조건 */
	student_year = 1	/* '==' 연산자 없으니까 쓰지 않도록 주의 */
	AND score > 80
	OR student_year = 3
	AND score = 75;
	
SELECT
	id,
	`name`,
	student_year,
	score
FROM
	student_mst		/* 키워드 앞이나 문장 앞에 not이 들어가면 부정문 */
WHERE					/* '%A%', 'A%', '%A' 등으로 사용 가능*/
	`name` LIKE '%수%'
	AND `name` NOT LIKE '%수';

SELECT
	id,
	`name`,
	student_year,
	score
FROM
	student_mst
WHERE					/*in 안의 값이 있으면 (not in 안의 값이 없으면)*/
	student_year IN(1, 2);

SELECT
	id,
	`name`,
	student_year,
	score
FROM
	student_mst
WHERE					/* BETWEEN : 사이의 값 */
	score NOT BETWEEN 80 AND 90;

SELECT
	id,
	`name`,
	student_year,
	score
FROM
	student_mst
WHERE					/* IS (NOT) NULL : null값이 맞거나 아닌거 */
	`name` IS NOT NULL;






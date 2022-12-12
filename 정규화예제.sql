SELECT
	`제목`,
	`내용`,
	snu.username AS '작성자',
	snf.`file` AS '첨부파일'
FROM
	study_notice_mst snm
	LEFT OUTER JOIN study_notice_files snf ON(snf.notice_id = snm.id)
	LEFT OUTER JOIN study_notice_user snu ON(snu.id = snm.`작성자_id`)
ORDER BY
	snf.id;




SELECT
	*
FROM
	user_mst AS um
	LEFT OUTER JOIN user_dtl AS ud ON (um.id = ud.id);

SELECT
	*
FROM
	user_mst um
	LEFT OUTER JOIN user_dtl ud ON (1 = 1);



















SELECT
	om.id AS '주문 번호',
	od.id AS '주문 상품',
	pm.product_name AS '상품 이름',
	od.order_stock AS '주문 개수',
	pm.product_price AS '가격',
	um.username AS '주문 고객'
FROM
	order_mst om
	LEFT OUTER JOIN order_dtl od ON (od.order_id = om.id)
	LEFT OUTER JOIN user_mst um ON (um.id = om.user_id)
	LEFT OUTER JOIN product_mst pm ON (pm.id = od.product_id);


SELECT
	*
FROM
	user_mst um
	LEFT OUTER JOIN order_mst om ON (om.user_id = um.id)
	LEFT OUTER JOIN order_dtl od ON (od.order_id = om.id);








INSERT INTO course_mst
VALUES
	(0, 'java'),
	(0, 'python'),
	(0, 'c'),
	(0, 'web');

INSERT INTO emp_mst
VALUES
	(0, '문성현'),
	(0, '윤대휘'),
	(0, '문자영'),
	(0, '정규민');

INSERT INTO status_mst
VALUES
	(0, '수강'),
	(0, '수료');

INSERT INTO student_mst
VALUES
	(0, '신경수'),
	(0, '고희주'),
	(0, '장건녕'),
	(0, '문승주'),
	(0, '이승아');
	
INSERT INTO student_dtl
VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 3);
	
INSERT INTO course_dtl
VALUES
	(0, 1, 1, 1),
	(0, 2, 1, 2),
	(0, 3, 1, 2),
	(0, 1, 2, 2),
	(0, 3, 2, 1),
	(0, 1, 3, 1),
	(0, 1, 4, 2);
	




SELECT
	cm.`수강명`,
	sm.`성명`,
	em.`담당자`,
	stt.`상태`
FROM 
	student_mst sm
	LEFT OUTER JOIN course_dtl cd ON (cd.`수강자id` = sm.id)
	LEFT OUTER JOIN course_mst cm ON (cm.id = cd.`코스id`)
	LEFT OUTER JOIN student_dtl sd ON (sd.id = sm.id)
	LEFT OUTER JOIN emp_mst em ON (em.id = sd.`담당자id`)
	LEFT OUTER JOIN status_mst stt ON (stt.id = cd.`상태id`)
WHERE
	cd.`코스id` IS NOT NULL;







SELECT
	cm.`수강명`,
	sm.`성명`,
	em.`담당자`,
	stt.`상태`
FROM
	course_mst cm
	LEFT OUTER JOIN course_dtl cd ON (cd.`코스id` = cm.id)
	LEFT OUTER JOIN student_mst sm ON (sm.id = cd.`수강자id`)
	LEFT OUTER JOIN student_dtl sd ON (sd.id = sm.id)
	LEFT OUTER JOIN emp_mst em ON (sd.`담당자id` = em.id)
	LEFT OUTER JOIN status_mst stt ON (stt.id = cd.`상태id`)
WHERE
	cd.id IS NOT NULL
ORDER BY
	sm.`성명`;









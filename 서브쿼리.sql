INSERT INTO
	board_mst
VALUES
	(0, '제목1', '게시글 내용1', 0, 1),
	(0, '제목2', '게시글 내용2', 0, 1),
	(0, '제목3', '게시글 내용3', 0, 1),
	(0, '제목1', '게시글 내용1', 0, 2),
	(0, '제목2', '게시글 내용2', 0, 2),
	(0, '제목3', '게시글 내용3', 0, 2),
	(0, '제목4', '게시글 내용4', 0, 1),
	(0, '제목5', '게시글 내용5', 0, 1),
	(0, '제목6', '게시글 내용6', 0, 1),
	(0, '제목4', '게시글 내용4', 0, 2),
	(0, '제목5', '게시글 내용5', 0, 2);


SELECT
	bm.id,
	bm.title,
	bm.content,
	bm.read_count,
	bm.writer_id,
	wc.writer_count		# 서브 쿼리문 : SELECT로 값 하나만 들고와야함
#	(SELECT COUNT(1) FROM board_mst bm2 WHERE bm2.writer_id = bm.writer_id) AS `쓴 글`
FROM		
	board_mst bm
	LEFT OUTER JOIN (SELECT # {witer_id : writer_count} 로 구성된 새 테이블을 일시적으로 생성
		writer_id,
		COUNT(1) AS writer_count
	FROM
		board_mst bm2
	GROUP BY
		writer_id) AS wc		# 일시적으로 만든 테이블에 별칭 지어줌
	ON (wc.writer_id = bm.writer_id);	# JOIN 조건문

SET profiling = 1;	# 쿼리문 걸린 시간 보는법
SHOW PROFILES;
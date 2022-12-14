# UNION : 두 개의 테이블을 세로로 합치는 방법
# 테이블 형식을 맞춰야만 가능 (SELECT ~ UNION ~ SELECT)
# SELECT 안에서 AS로 합치기 가능 / 순서도 같아야 에러 안남
# WHERE 은 전체가 아니라 SELECT 기준으로 작동
SELECT 
    `name`,
    email,
    0 AS score
FROM
    subquery_study.user_dtl
WHERE
	name = '유열림'
UNION
SELECT
	`name`,
    NULL AS email,
    score
FROM
	score_mst
WHERE
	score > 80
# LIMIT은 전체 기준으로 작동
LIMIT 3;
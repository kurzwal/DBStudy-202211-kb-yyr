SELECT * FROM subquery_study.user_dtl; 		# 디테일 조회
SELECT * FROM subquery_study.user_mst;		# 마스터 조회

# 주어진 데이터가 username밖에 없을 때 ('test')
SELECT
	*
FROM
	user_dtl AS ud
WHERE	# user_mst에서 username이 'test'인 값의 id를 SELECT로 불러옴 (값이 단 하나여야함)
	id = (SELECT id FROM user_mst WHERE username = 'test');

SELECT 
    *
FROM
    user_dtl AS ud
        LEFT OUTER JOIN
    user_mst AS um ON (um.id = ud.id)
WHERE
    um.username;

SELECT
	*
FROM
	user_dtl
WHERE	# IN을 붙여서 포함되기만 하면 불러옴 (값이 여러개여도 상관없다)
	id IN (SELECT id FROM user_mst WHERE username LIKE 'test%');

# 원하는 컬럼을 만들어서 조회하는 방법
SELECT
	'아이디' AS username,
    12 AS `month`,
    14 AS `day`;

SELECT
	*
FROM
	user_dtl;

-- INSERT INTO
-- 	user_mst
-- VALUES
-- 	(0,'aaa'),
-- 	(0,'bbb'),
-- 	(0,'ccc'),
-- 	(0,'ddd'),
-- 	(0,'eee');

SELECT
	*,
	ifnull(name, 1) AS flag, # ifnull(A, B) : A가 NULL이면 B를 반환, 아니면 A를 반환
    nullif(name, name='유열림') AS flag2 # 
FROM
	user_dtl;
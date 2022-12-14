SELECT * FROM subquery_study.score_mst;

-- INSERT INTO
-- 	score_mst
-- VALUES
-- 	(0, '신경수', 100),
-- 	(0, '고희주', 95),
-- 	(0, '장건녕', 85),
-- 	(0, '문승주', 80),
-- 	(0, '이승아', 75),
-- 	(0, '김수현', 65),
-- 	(0, '문경원', 50);

# grade : 100~90 : A, ~80 : B, ~70 : C, ~60 : D 나머지 F
SELECT
	*,
    CASE
		WHEN score > 100 OR score < 0 THEN 'X'
		WHEN score > 89 THEN 'A'
		WHEN score > 79 THEN 'B'
		WHEN score > 69 THEN 'C'
		WHEN score > 59 THEN 'D'
		ELSE 'F'
	END AS grade
FROM
	score_mst;


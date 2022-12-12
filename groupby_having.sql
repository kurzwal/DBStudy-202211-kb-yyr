SELECT
	SUM(점수) AS `총합`,
	AVG(점수) AS `평균`
FROM
	score_mst
GROUP BY
	코스id
HAVING
	`총합` > 100;
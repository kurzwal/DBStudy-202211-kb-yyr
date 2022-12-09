SELECT
	`제목`,
	`내용`,
	snu.username,
	snf.`file`
FROM
	study_notice_mst snm
	LEFT OUTER JOIN study_notice_files snf ON(snf.notice_id = snm.id)
	LEFT OUTER JOIN study_notice_user snu ON(snu.id = snm.`작성자_id`)
ORDER BY
	snf.id
SELECT
	product_name AS 상품명,	# GROUP BY 하면 묶어야해서 다른열 안써짐
	COUNT(order_id),
	SUM(stock),
	MIN(stock),
	MAX(stock),
	SUM(stock) / COUNT(1),
	AVG(stock)
FROM
	order_mst
GROUP BY
	상품명;
##########################################################################
SELECT
	product_name AS 상품명,
	SUM(price * stock) AS 총액
FROM
	order_mst
GROUP BY
	상품명;
##########################################################################
SELECT
	product_name,
	price * stock AS 합계
FROM
	order_mst;
##########################################################################
SELECT
	product_name AS 상품명,
	COUNT(order_id) AS order_count,
	SUM(stock) AS stock_sum,
	MIN(stock),
	MAX(stock) AS max_stock,
	SUM(stock) / COUNT(1),
	AVG(stock)
FROM
	order_mst
WHERE		# WHERE 에서는 SUM() 등을 사용할 수 없음(우선순위 문제)
	stock > 50
GROUP BY
	상품명
HAVING	# WHERE은 GROUP BY 보다 우선순위가 높기 때문에 HAVING 사용
	max_stock > 49
ORDER BY
	order_count,
	stock_sum DESC # DESC : 역순 정렬
LIMIT 2;				# LIMIT N : 위에서 (0번 인덱스부터) N개행만 출력
#LIMIT 1, 2			# LIMIT N, M : N번 인덱스부터 M개행 출력
##########################################################################


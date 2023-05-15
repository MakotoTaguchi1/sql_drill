-- ドリルB Level 3
SELECT * FROM drill_b.商品;
SELECT * FROM drill_b.注文;
SELECT * FROM drill_b.廃番商品;

-- 25
SELECT `商品コード`, `商品名` FROM drill_b.商品 WHERE `商品区分` = "1" ORDER BY `商品コード` DESC;

-- 26
SELECT `注文日`, `注文番号`, `注文枝番`, `商品コード`, `数量` FROM drill_b.注文 
 WHERE `注文日` >= '2018-03-01'
 ORDER BY `注文日`, `注文番号`, `注文枝番`;

-- 27
SELECT DISTINCT `商品コード` FROM drill_b.注文 ORDER BY `商品コード`;

-- 28
SELECT `注文日` FROM drill_b.注文 ORDER BY `注文日` DESC LIMIT 10;

-- 29
SELECT * FROM drill_b.商品 ORDER BY `単価`, `商品区分`, `商品コード` LIMIT 15 OFFSET 5;

-- 30
SELECT * FROM drill_b.廃番商品 
 WHERE `廃番日` BETWEEN '2016-12-01' AND '2016-12-31' OR `売上個数` >= 100
 ORDER BY `売上個数` DESC;

-- 31
SELECT DISTINCT `商品コード` FROM drill_b.商品 WHERE `商品コード` NOT IN (
 SELECT DISTINCT `商品コード` FROM drill_b.注文)
 ORDER BY `商品コード`;

-- 32
SELECT DISTINCT S.`商品コード` FROM drill_b.商品 AS S
 INNER JOIN (SELECT DISTINCT `商品コード` FROM drill_b.注文) AS C ON S.`商品コード` = C.`商品コード`
 ORDER BY `商品コード` DESC;

-- 33
SELECT `商品コード`, `商品名`, `単価` FROM drill_b.商品 WHERE 
 `商品区分` = '3' AND
 (`単価` <= 1000 OR `単価` > 10000)
 ORDER BY `単価`, `商品コード`;


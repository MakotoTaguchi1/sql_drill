-- ドリルB Level 6
SET SQL_SAFE_UPDATES = 0;
SELECT * FROM drill_b.商品;
SELECT * FROM drill_b.注文;
SELECT * FROM drill_b.廃番商品;

-- 55
SELECT `商品コード`, `商品名`, `単価`, 
 (SELECT SUM(`数量`) FROM drill_b.注文 WHERE `商品コード` = 'S0604') AS `販売数`
FROM drill_b.商品 WHERE `商品コード` = 'S0604';

-- 56
UPDATE drill_b.注文 SET `商品コード` = (
 SELECT `商品コード` FROM drill_b.商品 WHERE `商品区分` = '2' AND `商品名` LIKE '%ブーツ%' AND `商品名` LIKE '%雨%'
 ) WHERE `注文番号` = '201803150014';
 
-- 57
SELECT `注文日`, `商品コード` FROM drill_b.注文 WHERE `商品コード` IN (
 SELECT `商品コード` FROM drill_b.商品 WHERE `商品名` LIKE '%あったか%'
) ORDER BY `注文日`;

-- 58
SELECT `商品コード`, SUM(`数量`) AS `合計数量` FROM drill_b.注文 GROUP BY `商品コード` HAVING AVG(`数量`) >= ALL(
 SELECT AVG(`数量`) FROM drill_b.注文 GROUP BY `商品コード`
);

-- 59
SELECT A.`数量合計`, FLOOR(A.`割引合計` / A.`数量合計`) AS `クーポン割引平均` FROM (
 SELECT SUM(`数量`) AS `数量合計`, SUM(`クーポン割引料`) AS `割引合計` FROM drill_b.注文 WHERE `商品コード` = 'W0746' AND `クーポン割引料` IS NOT NULL
) AS A;

-- 60
INSERT INTO drill_b.注文 (`注文日`, `注文番号`, `注文枝番`, `商品コード`, `数量`, `クーポン割引料`)
 VALUES ('2018-03-21', '201803210080', (SELECT MAX(`注文枝番`) FROM drill_b.注文 AS A WHERE `注文番号` = '201803210080') + 1, 'S1003', 1, NULL);


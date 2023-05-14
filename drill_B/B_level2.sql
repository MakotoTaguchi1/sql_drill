-- ドリルB Level 2
SELECT * FROM drill_b.商品;
SELECT * FROM drill_b.注文;
SELECT * FROM drill_b.廃番商品;

-- 6
SELECT * FROM drill_b.商品 WHERE `商品コード` = 'W1252';

-- 7
UPDATE drill_b.商品 SET `単価` = 500 WHERE `商品コード` = 'S0023';

-- 8
SELECT * FROM drill_b.商品 WHERE `単価` <= 1000;

-- 9
SELECT * FROM drill_b.商品 WHERE `単価` > 50000;

-- 10
SELECT * FROM drill_b.注文 WHERE `注文日` >= '2018-01-01';

-- 11
SELECT * FROM drill_b.注文 WHERE `注文日` < '2017-12-01';

-- 12
SELECT * FROM drill_b.商品 WHERE `商品区分` <> '1';

-- 13
SELECT * FROM drill_b.注文 WHERE `クーポン割引料` IS NULL;

-- 14
DELETE FROM drill_b.商品 WHERE `商品コード` LIKE 'N%';

-- 15
SELECT `商品コード`, `商品名`, `単価` FROM drill_b.商品 WHERE `商品名` LIKE '%コート%';

-- 16
SELECT `商品コード`, `商品区分` FROM drill_b.商品 WHERE `商品区分` IN ('2', '3', '9');

-- 17
SELECT * FROM drill_b.商品 WHERE `商品コード` BETWEEN 'A0100' AND 'A0500';

-- 18
SELECT * FROM drill_b.注文 WHERE `商品コード` IN ('N0501', 'N1021', 'N0223');

-- 19
SELECT * FROM drill_b.商品 WHERE `商品区分` = '3' AND `商品名` LIKE '%水玉%';

-- 20
SELECT * FROM drill_b.商品 WHERE `商品名` LIKE '%軽い%' OR `商品名` LIKE '%ゆるふわ%';

-- 21
SELECT * FROM drill_b.商品 WHERE (`商品区分` = '1' AND `単価` <= 3000) OR (`商品区分` = '3' AND `単価`>= 10000);

-- 22
SELECT `商品コード` FROM drill_b.注文 WHERE `数量` >= 3 AND `注文日` BETWEEN '2018-03-01' AND '2018-03-31';

-- 23
SELECT * FROM drill_b.注文 WHERE `数量` >= 10 OR `クーポン割引料` IS NOT NULL;

-- 24
-- 商品テーブルのPK: 商品コード
-- 注文テーブルのPK: 注文日、注文番号、注文枝番 


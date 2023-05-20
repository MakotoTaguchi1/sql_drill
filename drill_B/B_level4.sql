-- ドリルB Level 4
SET SQL_SAFE_UPDATES = 0;
SELECT * FROM drill_b.商品;
SELECT * FROM drill_b.注文;
SELECT * FROM drill_b.廃番商品;

-- 34
SELECT `商品コード`, `単価`, FLOOR(`単価` * 0.95) AS `キャンペーン価格` FROM drill_b.商品 WHERE `商品区分` = '1' ORDER BY `商品コード`;

-- 35
UPDATE drill_b.注文 SET `クーポン割引料` = `クーポン割引料` + 300
 WHERE `注文日` >= '2018-03-12' AND `注文日` <= '2018-03-14' AND `数量` >= 2 AND `クーポン割引料` IS NOT NULL;

-- 36
UPDATE drill_b.注文 SET `数量` = `数量` - 1
 WHERE `注文番号` = '201802250126' AND `商品コード` = 'W0156';

-- 37
SELECT `注文日`, CONCAT(`注文番号`, '-', `注文枝番`) AS `注文番号-枝番`, `商品コード`, `数量`, `クーポン割引料` FROM drill_b.注文
 WHERE `注文番号` BETWEEN '201710010001' AND '201710319999';
 
-- 38
SELECT DISTINCT `商品区分` AS `区分`,
 CASE `商品区分`
  WHEN  '1' THEN '衣類'
  WHEN '2' THEN '靴'
  WHEN '3' THEN '雑貨'
  WHEN '9' THEN 'その他'
  END AS `区分名`
 FROM drill_b.商品;
 
-- 39
SELECT * FROM drill_b.商品;
SELECT `商品コード`, `商品名`, `単価`,
 CASE 
  WHEN `単価` < 3000 THEN 'S' 
  WHEN `単価` < 10000 THEN 'M'
  ELSE 'L' 
 END AS `販売価格ランク`,
 CONCAT(`商品区分`, ':',
  CASE `商品区分`
   WHEN  '1' THEN '衣類'
   WHEN '2' THEN '靴'
   WHEN '3' THEN '雑貨'
   WHEN '9' THEN 'その他'
  END) AS `商品区分`
 FROM drill_b.商品
 ORDER BY `単価`, `商品コード`;
 
-- 40
SELECT `商品名`, CHAR_LENGTH(`商品名`) AS `文字数` FROM drill_b.商品
 WHERE CHAR_LENGTH(`商品名`) > 10
 ORDER BY CHAR_LENGTH(`商品名`);
 
-- 41
SELECT `注文日`, RIGHT(`注文番号`, 4) AS `注文番号` FROM drill_b.注文;

-- 42
UPDATE drill_b.商品 SET `商品コード` = CONCAT('E', SUBSTRING(`商品コード`, 2)) WHERE `商品コード` LIKE 'M%';

-- 43
SELECT `注文番号` FROM drill_b.注文 WHERE RIGHT(`注文番号`, 4) BETWEEN 1000 AND 2000
 ORDER BY RIGHT(`注文番号`, 4);

-- 44
UPDATE drill_b.廃番商品 SET `廃番日` = CURDATE() WHERE `商品コード` = 'S1990';

-- 45
SELECT `商品コード`, `商品名`, `単価`, FLOOR(`単価` * 0.7) AS `値下げした単価` FROM drill_b.商品;

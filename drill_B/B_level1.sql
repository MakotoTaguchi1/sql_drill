-- ドリルB Level 1
SELECT * FROM drill_b.商品;
SELECT * FROM drill_b.注文;
SELECT * FROM drill_b.廃番商品;

-- 1
SELECT `商品コード`, `商品名`, `単価`, `商品区分`, `関連商品コード` FROM drill_b.商品;

-- 2
SELECT `商品名` FROM drill_b.商品;

-- 3
SELECT * FROM drill_b.注文;

-- 4
SELECT `注文番号`, `注文枝番`, `商品コード` FROM drill_b.注文;

-- 5
INSERT INTO drill_b.商品 (`商品コード`, `商品名`, `単価`, `商品区分`) VALUES
 ('W0461', '冬のあったかコート', 12800, '1'),
 ('S0331', '春のさわやかコート', 6800, '1'),
 ('A0582', '秋のシックなコート', 9800, '1');

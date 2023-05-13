-- ドリル1 Level 3

SELECT * FROM test_database.口座;

SELECT * FROM test_database.口座 order by `口座番号`;
SELECT distinct `名義` FROM test_database.口座 order by `名義`;
SELECT 口座番号, 名義, 種別, 残高, 更新日 FROM test_database.口座
 order by 4 DESC, 1; 
SELECT 更新日 FROM test_database.口座 where 更新日 IS NOT NULL order by 更新日 LIMIT 10;
SELECT 更新日, 残高 FROM test_database.口座 
 where `更新日` IS NOT NULL AND `残高` > 0
 order by `残高`, `更新日` LIMIT 10, 10;
 
-- 29
SELECT `口座番号` FROM test_database.口座 
 UNION
 SELECT `口座番号` FROM test_database.廃止口座 order by `口座番号` ASC;

-- 30
SELECT `名義` FROM test_database.口座
 WHERE NOT EXISTS (SELECT `名義` FROM test_database.廃止口座 where test_database.廃止口座.名義 = test_database.口座.名義)
 order by `名義` DESC;
 
-- 31
SELECT `名義` FROM test_database.口座
 WHERE EXISTS (SELECT `名義` FROM test_database.廃止口座 where test_database.廃止口座.名義 = test_database.口座.名義)
 order by `名義` DESC;
SELECT `名義` FROM test_database.口座
 WHERE `名義` IN (SELECT `名義` FROM test_database.廃止口座)
 order by `名義` DESC;
 
-- 32
SELECT `口座番号`, `残高` FROM test_database.口座 where `残高` = 0
 UNION
 SELECT `口座番号`, `解約時残高` AS `残高`  FROM test_database.廃止口座 where `解約時残高` != 0
 order by `口座番号`;
 
-- SELECT `口座番号`, `解約時残高` FROM test_database.廃止口座 where `解約時残高` != 0;

-- 33
SELECT `口座番号`, `名義`, 'O' AS `口座区分` FROM test_database.口座
 UNION
 SELECT `口座番号`, `名義`, 'X' AS `口座区分`  FROM test_database.廃止口座
 order by `名義`;
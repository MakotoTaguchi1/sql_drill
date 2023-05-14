-- ドリルA Level 6
SET SQL_SAFE_UPDATES = 0;
SELECT * FROM test_database.口座;
SELECT * FROM test_database.口座 WHERE `口座番号` = "2761055";
SELECT * FROM test_database.取引;
SELECT * FROM test_database.取引 WHERE `口座番号` = "3104451";
SELECT * FROM test_database.廃止口座;

-- 59
UPDATE test_database.口座
 SET `残高` = `残高` + (
  SELECT COALESCE(SUM(`入金額`), 0) - COALESCE(SUM(`出金額`), 0)  FROM test_database.取引 WHERE `口座番号` = "0351333" AND `日付` = "2018-01-11"
 ), `更新日` = "2018-01-11"
 WHERE `口座番号` = "0351333";

-- 60
SELECT `残高`, 
 (SELECT COALESCE(SUM(`入金額`), 0)  FROM test_database.取引 WHERE `口座番号` = "1115600" AND `日付` = "2017-12-28") AS `入金額合計`,
 (SELECT COALESCE(SUM(`出金額`), 0)  FROM test_database.取引 WHERE `口座番号` = "1115600" AND `日付` = "2017-12-28") AS `出金額合計` 
 FROM test_database.口座 WHERE `口座番号` = "1115600";

-- 61
SELECT `口座番号`, `名義`, `残高` FROM test_database.口座
 WHERE `口座番号` IN (SELECT `口座番号` FROM test_database.取引 WHERE `入金額` > 1000000);

-- 62
SELECT * FROM test_database.口座
 WHERE `更新日` > ALL (SELECT `日付` FROM test_database.取引);

-- 63
SELECT 取引抽出.`日付`, 取引抽出.`最大入金額`, 取引抽出.`最大出金額` FROM (
 SELECT `日付`, COUNT(*) AS `件数`, MAX(`入金額`) AS `最大入金額`, MAX(`出金額`) AS `最大出金額`
 FROM test_database.取引 WHERE `口座番号` = "3104451" GROUP BY `日付` HAVING `件数` >= 2
) AS 取引抽出;

-- 64
INSERT INTO test_database.廃止口座(`口座番号`, `名義`, `種別`, `解約時残高`, `解約日`) 
 VALUES ("2761055",
  (SELECT `名義` FROM test_database.口座 WHERE `口座番号` = "2761055"),
  (SELECT `種別` FROM test_database.口座 WHERE `口座番号` = "2761055"),
  (SELECT `残高` FROM test_database.口座 WHERE `口座番号` = "2761055"),
  CURRENT_DATE()
 );
 
DELETE FROM test_database.口座 WHERE `口座番号` = "2761055";
 

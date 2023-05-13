-- ドリルA Level 6
SET SQL_SAFE_UPDATES = 0;
SELECT * FROM test_database.口座 WHERE `口座番号` = "0351333";
SELECT * FROM test_database.取引;
SELECT * FROM test_database.取引 WHERE `口座番号` = "0351333";

-- 59
UPDATE test_database.口座
 SET `残高` = `残高` + (
  SELECT COALESCE(SUM(`入金額`), 0) - COALESCE(SUM(`出金額`), 0)  FROM test_database.取引 WHERE `口座番号` = "0351333" AND `日付` = "2018-01-11"
 ), `更新日` = "2018-01-11"
 WHERE `口座番号` = "0351333";


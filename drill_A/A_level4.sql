-- ドリル1 Level 4
SELECT * FROM test_database.口座;
-- 34
SELECT `口座番号`, FLOOR(`残高`/1000)*1000 AS `千円単位の残高` FROM test_database.口座 WHERE `残高` >= 1000000;

-- 35
INSERT INTO test_database.口座(`口座番号`, `名義`, `種別`, `残高`, `更新日`) 
 VALUES ("0652281", "タカギ　ノブオ", 1, 13000, "2018-04-01");

INSERT INTO test_database.口座(`口座番号`, `名義`, `種別`, `残高`, `更新日`) 
 VALUES ("1026413", "マツモト　サワコ", 1, 300000 + 3000, "2018-04-02");
 
INSERT INTO test_database.口座(`口座番号`, `名義`, `種別`, `残高`, `更新日`) 
 VALUES ("2239710", "ササキ　シゲノリ", 1, 1000000 + 3000, "2018-04-03");

-- 36
SET SQL_SAFE_UPDATES = 0;
UPDATE test_database.口座
 SET `残高` = (残高 - 3000) * 1.003
 WHERE `口座番号` IN ("0652281", "1026413", "2239710");

 -- 37
SELECT `口座番号`, `更新日`, `更新日` + INTERVAL 180 DAY AS `通帳期限日` FROM test_database.口座 WHERE `更新日` < "2017-01-01";

-- 38
SELECT `口座番号`, CONCAT("カ）", `名義`) AS `名義` FROM test_database.口座 WHERE `種別` = "3";

-- 39
SELECT DISTINCT `種別` AS `種別コード`,
 CASE `種別` 
   WHEN "1" THEN "普通"
   WHEN "2" THEN "当座"
   WHEN "3" THEN "別段" 
 END AS `種別名` 
 FROM test_database.口座;
 
-- 40
SELECT `口座番号`, `名義`,
 CASE 
   WHEN (`残高` < 100000) THEN "C"
   WHEN (`残高` < 1000000) THEN "B"
   ELSE "A"
 END AS `残高ランク`
 FROM test_database.口座;
 
-- 41
SELECT LENGTH(CONCAT(`口座番号`, REPLACE(`名義`, "　", ""), CAST(`残高` AS CHAR))) AS `文字数`
 FROM test_database.口座;
 
-- 42
SELECT * FROM test_database.口座 WHERE SUBSTRING(`名義` from 1 for 5) LIKE "%カワ%";

-- 43
SELECT * FROM test_database.口座 WHERE LENGTH(`残高`) > 4 AND SUBSTRING(`残高` from LENGTH(`残高`)-2 for 3) = 000;

-- 44
SELECT `口座番号`, `残高`, TRUNCATE(`残高` * 0.0002, 0) AS `利息`
 FROM test_database.口座
 ORDER BY `残高` DESC;
 
-- 45
SELECT `口座番号`, `残高`,
 CASE
  WHEN (`残高` < 500000) THEN TRUNCATE(`残高` * 0.0001, 0)
  WHEN (`残高` < 2000000) THEN TRUNCATE(`残高` * 0.0002, 0)
  ELSE TRUNCATE(`残高` * 0.0003, 0)
 END AS `残高別利息`
 FROM test_database.口座
 ORDER BY `残高別利息` DESC, `口座番号` ASC;
 
-- 46
INSERT INTO test_database.口座(`口座番号`, `名義`, `種別`, `残高`, `更新日`) 
 VALUES ("0351262", "イトカワ　ダイ", 2, 635110, CURRENT_DATE());
 
INSERT INTO test_database.口座(`口座番号`, `名義`, `種別`, `残高`, `更新日`) 
 VALUES ("1015513", "アキツ　シュンジ", 1, 88463, CURRENT_DATE());
 
INSERT INTO test_database.口座(`口座番号`, `名義`, `種別`, `残高`, `更新日`) 
 VALUES ("1739298", "ホシノ　サトミ", 1, 704610, CURRENT_DATE());

-- 47
SELECT `口座番号`, `名義`, `種別`, `残高`, DATE_FORMAT(`更新日`, '%Y年%m月%d日') AS `更新日` FROM test_database.口座 WHERE `更新日` >= "2018-01-01";

-- 48
SELECT CASE
  WHEN `更新日` IS NULL THEN "設定なし"
  ELSE `更新日`
  END AS `更新日`
  FROM test_database.口座;

-- 48（COALESCE 使う場合）
SELECT COALESCE(`更新日`, "設定無し" ) AS `更新日`
  FROM test_database.口座;



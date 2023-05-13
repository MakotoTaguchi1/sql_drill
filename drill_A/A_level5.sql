-- ドリルA Level 5
SELECT * FROM test_database.口座;

-- 49
SELECT SUM(`残高`), MAX(`残高`), MIN(`残高`), AVG(`残高`), COUNT(`残高`) FROM test_database.口座;

-- 50
SELECT * FROM test_database.口座 
  WHERE NOT `種別` = 1
    AND `残高` >= 1000000
    AND `更新日` < "2018-01-01";
  
-- 51
SELECT COUNT(*) - COUNT(`更新日`) AS `更新日が登録されていない件数` FROM test_database.口座;

-- 52
SELECT MAX(`名義`), MIN(`名義`) FROM test_database.口座;

-- 53
SELECT MAX(`更新日`), MIN(`更新日`) FROM test_database.口座;

-- 54
SELECT `種別`, SUM(`残高`), MAX(`残高`), MIN(`残高`), AVG(`残高`), COUNT(*) FROM test_database.口座
 GROUP BY `種別`
 ORDER BY `種別`;
 
-- 55
SELECT RIGHT(`口座番号`, 1) AS `口座番号グループ`, COUNT(*) AS `件数` FROM test_database.口座
 GROUP BY RIGHT(`口座番号`, 1)
 ORDER BY `件数` DESC;

-- 56
SELECT CASE 
 WHEN LEFT(`更新日`, 4) IS NULL THEN "XXXX年"
 ELSE CONCAT(LEFT(`更新日`, 4), "年")
 END AS `更新年`,
 SUM(`残高`), MAX(`残高`), MIN(`残高`), AVG(`残高`), COUNT(*) FROM test_database.口座
 GROUP BY `更新年`;

-- 56（別解）
SELECT COALESCE(LEFT(`更新日`, 4), "XXXX年") AS `更新年`,
 SUM(`残高`), MAX(`残高`), MIN(`残高`), AVG(`残高`), COUNT(*) FROM test_database.口座
 GROUP BY `更新年`;

-- 57
SELECT `種別`, SUM(`残高`) AS `合計残高`, COUNT(*) FROM test_database.口座
 GROUP BY `種別`
 HAVING `合計残高` < 3000000;
 
-- 58
SELECT LEFT(`名義`, 1) AS `名義1文字目`, COUNT(*) AS `件数`, AVG(CHAR_LENGTH(REPLACE(`名義`, "　", ""))) AS `平均名義文字数`
 FROM test_database.口座
 GROUP BY `名義1文字目`
 HAVING `件数` >= 10 OR `平均名義文字数` >= 5;



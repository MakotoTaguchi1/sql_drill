-- ドリルA Level 7
SELECT * FROM test_database.口座;
SELECT * FROM test_database.取引;
SELECT * FROM test_database.取引事由;
SELECT * FROM test_database.廃止口座;

-- 65
SELECT A.`口座番号`, A.`日付`, B.`取引事由名`,
 coalesce(A.`入金額`, A.`出金額`) AS `取引金額`
 FROM test_database.取引 AS A
 LEFT OUTER JOIN test_database.取引事由 AS B ON A.`取引事由ID` = B.`取引事由ID`
 WHERE A.`口座番号` IN ("0311240", "1234161", "2750902")
 ORDER BY A.`口座番号`, A.`取引番号`;

-- 66
SELECT K.`口座番号`, K.`名義`, K.`残高`, T.`日付`, T.`入金額`, T.`出金額` FROM test_database.口座 AS K
 LEFT OUTER JOIN test_database.取引 AS T ON K.`口座番号` = T.`口座番号`
 WHERE T.`口座番号` = "0887132"
 ORDER BY T.`日付`;

-- 67
SELECT T.`口座番号`, K.`名義`, K.`残高`
 FROM test_database.取引 AS T
 INNER JOIN test_database.口座 AS K ON K.`口座番号` = T.`口座番号`
 WHERE `日付` = "2016-03-01";

-- 68
SELECT T.`口座番号`, coalesce(K.`名義`, "解約済み") AS `名義`, coalesce(K.`残高`, 0) AS `残高`
 FROM test_database.取引 AS T
 LEFT OUTER JOIN test_database.口座 AS K ON K.`口座番号` = T.`口座番号`
 WHERE `日付` = "2016-03-01";

-- 69
SELECT T.`取引番号`, COALESCE(
 CONCAT(T.`取引事由ID`, ':', J.`取引事由名`),
 CONCAT(J.`取引事由ID`, ':', J.`取引事由名`)
 ) AS `取引事由`,
 T.`日付`, T.`口座番号`, T.`入金額`, T.`出金額`
 FROM test_database.取引 AS T
 RIGHT OUTER JOIN test_database.取引事由 AS J ON T.`取引事由ID` = J.`取引事由ID`
 ORDER BY T.`取引番号`;

-- 70
SELECT T.`取引番号`, COALESCE(
 CONCAT(T.`取引事由ID`, ':', J.`取引事由名`),
 CONCAT(T.`取引事由ID`, ':', "未登録の取引")
 ) AS `取引事由`,
 T.`日付`, T.`口座番号`, T.`入金額`, T.`出金額`
 FROM test_database.取引 AS T
 LEFT OUTER JOIN test_database.取引事由 AS J ON T.`取引事由ID` = J.`取引事由ID`
UNION
SELECT T.`取引番号`, COALESCE(
 CONCAT(J.`取引事由ID`, ':', J.`取引事由名`)
 ) AS `取引事由`,
 T.`日付`, T.`口座番号`, T.`入金額`, T.`出金額`
 FROM test_database.取引 AS T
 RIGHT OUTER JOIN test_database.取引事由 AS J ON T.`取引事由ID` = J.`取引事由ID`;

-- 71
SELECT K.`口座番号`, K.`名義`, K.`残高`, T.`日付`, CONCAT(T.`取引事由ID`, ": ", J.`取引事由名`) AS `取引事由`, T.`入金額`, T.`出金額`
 FROM test_database.口座 AS K
 LEFT OUTER JOIN test_database.取引 AS T ON K.`口座番号` = T.`口座番号`
 LEFT OUTER JOIN test_database.取引事由 AS J ON T.`取引事由ID` = J.`取引事由ID`
 WHERE T.`口座番号` = "0887132"
 ORDER BY T.`取引番号`;

-- 72
SELECT * FROM test_database.口座 AS K
 LEFT OUTER JOIN test_database.取引 AS T ON K.`口座番号` = T.`口座番号`
 WHERE K.`残高` >= 5000000
  AND T.`日付` >= "2018-01-01"
  AND (T.`入金額` >= 1000000 OR T.`出金額` >= 1000000);

-- 73
SELECT * FROM test_database.口座 AS K
 INNER JOIN (
  SELECT * FROM test_database.取引 WHERE `日付` >= "2018-01-01" AND (`入金額` >= 1000000 OR `出金額` >= 1000000)
 ) AS TS ON K.`口座番号` = TS.`口座番号`
 WHERE K.`残高` >= 5000000;
 
-- 74
SELECT K.`口座番号`, T.`回数`, K.`名義`
 FROM test_database.口座 AS K
 INNER JOIN (
  SELECT COUNT(*) AS `回数`, `口座番号` FROM test_database.取引
   GROUP BY `口座番号`
   HAVING `回数` >= 3
 )AS T ON T.`口座番号` = K.`口座番号`;
 
-- 75
SELECT K.`名義`, K.`口座番号`, K.`種別`, K.`残高`, K.`更新日`
 FROM test_database.口座 AS K
 INNER JOIN (
  SELECT COUNT(*) AS `口座数`, `名義` FROM test_database.口座
  GROUP BY `名義`
  HAVING `口座数` >= 2
 ) AS KS ON K.`名義` = KS.`名義`
 ORDER BY K.`名義`, K.`口座番号`;


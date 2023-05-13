-- ドリル1 Level 2

SELECT * FROM test_database.口座;

SELECT * from test_database.口座 where `口座番号` = "0037651";
SELECT * from test_database.口座 where `残高` > 10000;
SELECT * from test_database.口座 where `口座番号` < 1000000;
SELECT * from test_database.口座 where `更新日` < "2018-01-01";
SELECT * from test_database.口座 where `残高` < 10000;
SELECT * from test_database.口座 where `種別` != "1";
SELECT * from test_database.口座 where `更新日` IS NULL;
SELECT * from test_database.口座 where `名義` LIKE "%ハシ%";

SELECT * from test_database.口座 where `更新日` between "2018-01-01" AND "2018-01-31";
SELECT * from test_database.口座 where `種別` = 2 OR `種別` = 3;
SELECT * from test_database.口座 where `名義` in ("サカタ　リョウヘイ", "マツモト　ミワコ");
SELECT * from test_database.口座 where `更新日` BETWEEN "2017-12-30" AND "2018-01-04";
SELECT * from test_database.口座 where `口座番号` BETWEEN "2000000" AND "2999999" OR `名義` LIKE "エ__ %コ" ;

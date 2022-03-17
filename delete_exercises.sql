USE codeup_test_db;
SELECT 'Deleted all albums before 1991' AS 'Info';
DELETE FROM albums WHERE release_date > 1991;

SELECT 'Deleted all disco albums' AS 'Info';
DELETE FROM albums WHERE genre = 'Disco';

SELECT 'Deleted all Whitney Houston albums' AS 'Info';
DELETE FROM albums WHERE artist = 'Whitney Houston';
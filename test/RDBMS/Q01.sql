/* DataBase 구성 */
CREATE TABLE mountains (
  name TEXT,
  height_meters INTEGER,
  first_ascent DATE
);

INSERT INTO mountains VALUES
  ('Mount Everest', 8848, '1953-05-29'),
  ('Kilimanjaro', 5895, '1889-10-06'),
  ('Denali', 6190, '1913-06-07'),
  ('Chimborazo', 6263, '1880-01-04'),
  ('K2', 8611, '1954-07-31'),
  ('Piz Palü', 3900, '1835-08-12'),
  ('Cho Oyu', 8188, '1954-10-19');


/*
Q01. name에 a가 들어가지 않는 name을 '산 이름'으로 출력해라.
*/
select name as '산 이름'
from mountains
where not name like '%a%';


/*
Q02. 산의 높이를 FEET로 변환하고 내림차순으로 정렬하여 모든 정보를 출력하라.
*/
select *, ROUND(height_meters*3.28084) as 'FEET'
from mountains
order by FEET desc;


/*
Q03. 1880-01-01 ~ 1889-01-01 첫 등반한 사람과 년도 검색해라
*/
select name, first_ascent
from mountains
where first_ascent between '1880-01-01' and '1889-12-31';


/*
Q04. 이름이 C로 시작하면서 1900년대 이후에 등반한 사람의 이름을 검색해라
*/
select name, first_ascent
from mountains
where name like 'c%' and first_ascent >= '1900-01-01';


/*
Q05. 높이(height_meters)가 6000 이상이면서 첫 등반 날짜(first_ascent)가 1950년 이후인
산들을 등반 날짜로 정렬(내림차순)하고 name과 first_ascent를 '산이름'과 '등반 날짜'로 출력해라.
*/
select name as '산 이름', first_ascent as '등반 날짜'
from mountains
where height_meters >= 6000 and first_ascent >= '1950-01-01'
order by first_ascent desc;


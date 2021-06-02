/* Oracle Db 자체적인 지원 함수 다수 존재
1. 숫자 함수
2. 문자 함수
3. 날짜 함수
4. ... */

/* ***[숫자함수]***
1. abs(data) : data의 절대값 구하는 함수

2. round(data, [반올림자릿수]) : data를 지정한 자리에서 반올림한다.
    - -1 자리는 1의 자리를 의미한다.
    - round(5.86, -1) -> 10 을 반환한다.

3. trunc(data, 자릿수) : 지정한 자리수 이하는 버리는 함수
    - 자릿수 = + : 소수점 이하 / - : 정수
    - 자리가 지정되지 않으면 소수점 이하를 버린다.

4. mod(data1, data2) : data1을 data2로 나누고 난 나머지 값 연산 함수

5. power(a, b) : a를 b제곱 한 숫자를 연산
*/

-- 사용 예시들
-- 1. abs()
select abs(-10) from dual;

-- 2. round()
select round(5.86, 2) from dual;

-- 3. trunc()
select trunc(5.86) from dual;

-- 4. mod()
select mode(7, 2) from daul;

-- 5. 
select power(5, 2) from dual;



/* ***[문자함수]***
1. upper(문자열) : 문자열을 모두 대문자로 변환해서 반환

2. lower(문자열) : 문자열을 모두 소문자로 변환해서 반환

3. length(문자열) : 문자열의 길이를 반환

4. lengthb(문자열) : 문자열의 byte 수를 반환한다.
    - 보통 한글은 2 byte 이지만 oracle xe 버전에서는 3 byte 이다.

5. substr(문자열 data, start index, 반환할 문자의 개수) : 문자열 data에서 start index부터 반환할 문자열의 개수만큼 문자를 반환한다.
    - 대부분 프로그래밍 언어(python, java, sql, ...)에서 문자열 시작은 보편적으로 0부터 시작
    - oracle db인 경우 문자열이 0 또는 1이 같은 맥락으로 사용된다.

6. trim(문자열) : 문자열 앞뒤의 잉여 여백을 제거하고 반환한다.
*/

-- 사용 예시들
-- 1. upper()
select upper('asdBs') from dual;

-- 2. lower()
select lower('ASDFASDF') from dual;

-- 3. length()
select length('asdf가 ') from dual;  /* 6 */

-- 4. lengthb()
select lengthb('asdf가 ') from dual;  /* 8 */

-- 5. substr()
select substr('playdata', 0, 2) from dual;  /* pl */
select substr('playdata', 1, 2) from dual;  /* pl */

-- 6. trim()
select length('  abc '), length(trim('  abc ')) from dual;    /* 6 3 */



/* ***[날짜함수]***
1. sysdate : 현재 시스템 날짜에 대한 정보 제공
    - +1 / -1 을 통하여 내일, 어제의 날짜 접근 가능
    - '과거 날짜' - sysdate 를 통해 몇일이 지났는지 확인 가능
    - round(), trunc() 적용시
        - round(sysdate) : 정오를 기준으로 현재 시간이 초과하면 다음 날짜가 출력
        - trunc(sysdate) : 24시간 내의 모든 시간은 오늘 날짜 출력

2. add_months(원하는 날짜, 개월수) : 원하는 날짜에 특정 개월수를 더하는 함수

3. months_between(특정 날짜1, 특정 날짜2) : 두 날짜 사이의 개월수를 구하는 함수

4. next_day(날짜, 요일) : 특정 날짜가 속한 주의 해당 요일의 날짜를 구하는 함수

5. last_day(날짜) : 주어진 날짜를 기준으로 해당 달이 끝나는 날짜를 구하는 함수

*/

-- 사용 예시
-- 1. sysdate
select sysdate - 1 as 어제, sysdate as 오늘, sysdate + 1 as 내일 from dual;

select sysdate, round(sysdate), trunc(sysdate) from dual;
/* SYSDATE  ROUND(SY TRUNC(SY
   -------- -------- --------
   21/06/02 21/06/03 21/06/02 */


-- 2. add_months()
select add_months(sysdate, 3) from dual;

-- 3. months_between()
select months_between(sysdate, '2021-01-02') from dual;    /* 245 */

-- 4. next_day()
select next_day(sysdate, '토요일') from dual;
select next_day(sysdate, '토') from dual;
/* NEXT_DAY
  --------
  21/06/05 */

-- 5. last_day()
select last_day(sysdate) from dual;
select last_day('2021-01-05') from dual;
select last_day('2021/02/25') from dual;



/* ***[형변환함수]***
1. to_char(날짜, '희망포맷문자열') : 날짜 -> 문자 / 숫자 -> 문자
    - [날짜 -> 문자] 경우에 희망 포맷 문자열 종류
        yyyy/mm/dd
        yyyy-mm-dd
        yyyy-mm-dd dy
            - dy : 요일
        yyyy-mm-dd hh:mi:ss
            - hh:mi:ss = 12시간을 기준으로 시분초
        yyyy-mm-dd hh24:mi:ss
            - hh24:mi:ss = 24시간을 기준으로 시분초
        yyyy-mm-dd hh:mi:ss am
            - hh:mi:ss am = am과 pm은 오전 오후 의미, am을 주로 사용
            - 현재 시간이 오후이면 am을 입력하면 오후라고 알맞게 출력된다.

    - [숫자 -> 문자] 경우에 희망 포맷 문자열 
        9 : 실제 데이터의 유효한 자릿수 숫자 의미(자릿수 채우지 않음)
        0 :	                "	           	(자릿수 채움)
        . : 소수점 표현
        , : 원단위 표현
        $ : 달러 
        L or l : 로케일의 줄임말(os 자체의 인코딩 기본 정보로 해당 언어의 기본 통화표현)

2. to_date(문자열) : 날짜 문자열을 날짜로 가공하는 함수
    - 단순 숫자로는 DATE type과 연산이 불가하여 to_date() 함수로 가공 후에 연산한다.

3. to_number(문자열, 포맷형식) : 문자열을 포맷 형식에 맞춰서 숫자로 가공한다.

*/

-- 사용 예시
-- 1 - 1. 날짜 -> 문자
select to_char(sysdate, 'yyyy/mm/dd') from dual;   /* 2021/06/02 */
select to_char(sysdate, 'yyyy-mm-dd dy') from dual;   /* 2021-06-02 수 */
select to_char(sysdate, 'yyyy-mm-dd hh:mi:ss') from dual;   /* 2021-06-02 11:05:35 */
select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') from dual;   /* 2021-06-02 23:05:35 */
select to_char(sysdate, 'yyyy-mm-dd hh:mi:ss am') from dual;   /* 2021-06-02 11:05:36 오후 */
-- 1 - 2. 숫자 -> 문자
select to_char(1234, '9999.99') from dual;  /* 1234.00 */ 
select to_char(1234, '$9999,99') from dual;  /* $12,34*/
select to_char(1234, '9999') from dual;  /* 1234 */
select to_char(1234, '999,999') from dual;  /* 1,234*/
select to_char(1234, '99999') from dual;  /* 1234*/
select to_char(1234, '00000') from dual;  /* 01234 */
select to_char(1234, 'L99,999') from dual;  /* ￦1,234 */
select to_char(1234, 'l99,999') from dual;  /* ￦1,234 */

-- 2. to_date()
select to_date(20210505) from dual;
/* TO_DATE(
   --------
   21/05/05 */

-- 3. to_number()
select to_number('20,000', '99,999') from dual;
/* TO_NUMBER('20,000','99,999')
   ----------------------------
                          20000 */



/* ***[조건식 함수]***
- decode() : if or switch문 과 같은 함수
- syntax
    decode(조건칼럼, 조건값1,  출력데이터1,
		   조건값2,  출력데이터2,
			...,
		   default값) from table명;

*/

-- dept table에서 10번 부서인 경우 A등급, 20번 부서는 B등급, 나머지는 C등급으로 출력
select deptno, decode(deptno, 10, 'A등급',
                              20, 'B등급',
                              'C등급') as 등급
from dept;
/*     DEPTNO 등급
   ---------- --------------
           10 A등급
           20 B등급
           30 C등급
           40 C등급 */
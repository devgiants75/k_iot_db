### f_join >>> d_practice ###

# korea_db에서 구매 금액(amount)가 가장 높은 회원의
# member_id, name, 총 구매 금액을 조회

SELECT
	M.member_id, M.name, SUM(P.amount) AS total_amount
FROM
	`members` M
    JOIN `purchases` P
    ON M.member_id = P.member_id
GROUP BY
	M.member_id
ORDER BY
	total_amount desc
LIMIT 1;

## baseball_league 사용 예제 (JOIN) ##
USE baseball_league;

SELECT * FROM `players`; -- player_id(PK), name(선수 이름), position, birth_date, team_id(FK)
SELECT * FROM `teams`; -- team_id(PK), name(팀 이름), city, founded_year











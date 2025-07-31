### h_트리거 >>> trigger_practice_answer ###

##### 문제 1 #####
-- 기존 트리거 삭제
drop trigger if exists after_player_delete;

-- 트리거 생성
delimiter $$
create trigger after_player_delete
	after delete
    on players
    for each row
begin
	insert into player_delete_logs (player_name, deleted_time)
    values (OLD.name, now());
end $$
delimiter ;

##### 문제 2 #####
-- 기존 트리거 삭제
drop trigger if exists after_player_position_update;

-- 트리거 생성
delimiter $$
create trigger after_player_position_update
	after update
    on players
    for each row
begin
	if OLD.position != NEW.position then
		insert into player_position_logs (player_name, old_position, new_position, changed_time)
        values (NEW.name, OLD.position, NEW.position, now());
	end if;
end $$
delimiter ;

##### 문제 3 #####

-- teams 테이블에 player_count 컬럼 추가 
ALTER TABLE teams ADD COLUMN player_count INT DEFAULT 0;

-- 선수 추가 시 팀의 선수 수 증가 트리거
DROP TRIGGER IF EXISTS after_player_insert_count;

DELIMITER $$
CREATE TRIGGER after_player_insert_count
AFTER INSERT ON players
FOR EACH ROW
BEGIN
	UPDATE teams
	SET player_count = player_count + 1
	WHERE team_id = NEW.team_id;
END $$
DELIMITER ;

-- 선수 삭제 시 팀의 선수 수 감소 트리거
DROP TRIGGER IF EXISTS after_player_delete_count;

DELIMITER $$
CREATE TRIGGER after_player_delete_count
AFTER DELETE ON players
FOR EACH ROW
BEGIN
	UPDATE teams
	SET player_count = player_count - 1
	WHERE team_id = OLD.team_id;
END $$
DELIMITER ;
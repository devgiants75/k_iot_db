### J_뷰 >>> view_practice ###

### 뷰 연습 문제 ###
CREATE DATABASE IF NOT EXISTS `school`;
USE `school`;

-- students 테이블 생성 --
# student_id: 정수, 기본키
# first_name: 문자열(50),
# last_name: 문자열(50),
# age: 정수
# major: 문자열(50)


-- courses 테이블 생성 --
# cours_id: 정수, 기본키
# course_name: 문자열(100)
# instructor: 문자열(100)
# credit_hours: 정수

-- student_courses 테이블 --
# student_id: 정수
# course_id: 정수
# >> 위의 두 컬럼을 복합키로 설정(기본키)
# >> 각 컬럼은 students, courses 테이블에서 참조

# cf) 각 테이블에 데이터 삽입 4개 이상 

/*
1. 뷰 이름: student_course_view

2. 뷰에는 아래 네 가지 컬럼이 포함되어야 함
	1) student_first_name: 학생의 이름 (students.first_name)
	2) student_last_name: 학생의 성 (students.last_name)
	3) course_name: 수강 과목 이름 (courses.course_name)
	4) instructor: 담당 강사 이름 (courses.instructor)

3. StudentCourse 테이블을 기준으로 Students와 Courses를 각각 INNER JOIN

4. 뷰가 정상적으로 생성되었는지 확인(조회)
*/


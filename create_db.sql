.mode csv

CREATE TABLE schools (
id_school INT PRIMARY KEY, 
school_name TEXT, 
school_type TEXT
);

.import --skip 1 data/schools.csv schools

CREATE TABLE students (
id_student INT PRIMARY KEY,
id_school INT NOT NULL,
student_name TEXT
);

.import --skip 1 data/students.csv students

CREATE TABLE student_info (
id_student INT PRIMARY KEY,
student_grade INT,
student_gender TEXT 
);

.import --skip 1 data/student_info.csv student_info

CREATE VIEW student_info_view AS
SELECT * from student_info;

CREATE TABLE waves (
id_wave INT PRIMARY KEY,
display_name TEXT
);

.import --skip 1 data/waves.csv waves

CREATE TABLE student_scores (
id_student INT NOT NULL,
id_wave INT NOT NULL,
id INT NOT NULL UNIQUE,
student_mathScore INT, 
student_readingScore INT, 
student_writingScore INT,
PRIMARY KEY (id_student, id_wave)
);

.import --skip 1 data/student_scores.csv student_scores

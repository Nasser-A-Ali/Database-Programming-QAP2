{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww14460\viewh13180\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 ---------------------------------------------------------------------------------------------------------------------\
-- CREATE TABLES\
---------------------------------------------------------------------------------------------------------------------\
\
-- Students Table\
CREATE TABLE students (\
	id SERIAL  PRIMARY KEY,\
	first_name TEXT,\
	last_name TEXT,\
	email TEXT UNIQUE,\
	enrolment_date DATE\
);\
\
-- Professors Table\
CREATE TABLE professors (\
	id SERIAL  PRIMARY KEY,\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf0 	first_name TEXT,\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf0 	last_name TEXT,\
	department TEXT\
);\
\
-- Courses Table\
CREATE TABLE courses (\
	id SERIAL  PRIMARY KEY,\
	course_name TEXT,\
	course_description TEXT,\
	professor_id INTEGER,\
	FOREIGN KEY (professor_id) REFERENCES professors(id)\
);\
\
-- Enrolment Table\
CREATE TABLE enrolments (\
	student_id INTEGER,\
	course_id INTEGER,\
	enrolment_date DATE,\
	PRIMARY KEY (student_id, course_id),\
	FOREIGN KEY (student_id) REFERENCES students(id),\
	FOREIGN KEY (course_id) REFERENCES courses(id)\
);\
\
---------------------------------------------------------------------------------------------------------------------\
-- INSERT DATA\
---------------------------------------------------------------------------------------------------------------------\
\
-- Student Table \
INSERT INTO students (first_name, last_name, email, enrolment_date) VALUES\
	(\'91Pablo\'92, \'91Escobar,\'92 \'91pablo.escobar@dea.gov, '2024-01,30\'92),\
	(\'91El\'92, \'91Chapo\'92, \'91el.chapo@dea.gov, '2024-01,30\'92),\
	(\'91Al\'92, \'91Capone\'92, \'91al.capone@dea.gov, '2024-01,30\'92),\
	(\'91El\'92, \'91Padrino\'92, \'91el.padrino@dea.gov, '2024-01,30\'92),\
	(\'91Amado\'92, \'91Carrillo\'92, \'91amado.carrillo@dea.gov, '2024-01,30\'92)\
;\
\
-- Professors Table\
INSERT INTO professors (first_name, last_name, department) VALUES\
	(\'91Barack\'92, \'91Obama\'92, \'91Culinary Arts\'92),\
	(\'91George\'92, \'91Bush\'92, \'91Physical Education\'92),\
	(\'91Abraham\'92, \'91Lincoln, \'91Software Development\'92),\
	(\'91Paul\'92, \'91Frampton, \'91Physics\'92),\
;\
\
-- Courses Table\
INSERT INTO courses (course_name, course_description, professor_id) VALUES\
	(\'91Cooking 204\'92, \'91Advanced cooking techniques for veteran chefs.\'92, 1),\
	(\'91Weight 101\'92, \'91Pushing weight for beginners.\'91, 2),\
	(\'91Code 201\'92, \'91Learn the street code.\'92, 3),\
	(\'91Physics 101\'92, \'91Everything a beginner must know about light particles.\'92, 4)\
;\
\
-- Enrolments Table\
INSERT INTO enrolments (student_id, course_id, enrolment_date) VALUES\
	('1', '1', '2024-01-30\'92), -- Pablo Escobar enrolled in Cooking 204\
	(\'912\'92, '1', '2024-01-30\'92), -- El Chapo enrolled in Cooking 204\
	(\'913\'92, \'911\'92, '2024-01-30\'92), -- Al Capone enrolled in Cooking 204\
	(\'913\'92, \'914\'92, '2024-01-30\'92), -- Al Capone enrolled in Physics 101\
	(\'914\'92, \'912\'92, '2024-01-30\'92), -- El Padrino enrolled in Weight 101\
	(\'914\'92, \'913\'92, '2024-01-30\'92), -- El Padrino enrolled in Code 201\
	(\'914\'92, \'914\'92, '2024-01-30\'92) -- El Padrino enrolled in Physics 101\
;}
{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0\cname textColor;}
\margl1440\margr1440\vieww14460\viewh13180\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 ---------------------------------------------------------------------------------------------------------------------\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf2 -- WRITE SQL QUERIES\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf0 ---------------------------------------------------------------------------------------------------------------------\
-- Retrieve full name of all students enrolled in \'91Physics 101\'92\
SELECT students.first_name || ' ' || students.last_name AS student_full_name\
FROM students\
JOIN enrolments ON students.id = enrolments.student_id\
WHERE enrolment.course_id =  (SELECT id FROM courses WHERE course_name = \'91Physics 101\'92);\
\
-- Retrieve all courses along with professor\'92s full name who teaches it\
SELECT courses.course_name, professors.first_name || ' ' || professors.last_name AS professor_full_name\
FROM courses\
JOIN professors ON professors.id = courses.professor_id;\
\
-- Retrieve all courses that have students enrolled in them\
\pard\pardeftab720\partightenfactor0
\cf0 SELECT DISTINCT courses.course_name AS enrolled_courses\
FROM courses\
JOIN enrolments ON courses.id = enrolments.course_id;\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf0 \
---------------------------------------------------------------------------------------------------------------------\
-- UPDATE DATA\
---------------------------------------------------------------------------------------------------------------------\
UPDATE students\
SET email = \'91incarcerated_chapo@adxflorence.com\'92\
WHERE id = 2;\
\
---------------------------------------------------------------------------------------------------------------------\
-- DELETE DATA\
---------------------------------------------------------------------------------------------------------------------\
DELETE FROM enrolments\
WHERE student_id = 3 AND course_id = 1;}
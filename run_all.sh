#!/usr/bin/env bash

./run_query.sh -m student_mathScore -d school_type id_student

./run_query.sh -m teacher_stressLevel -d school_type

./run_query.sh -m student_socialskill -d school_type

./run_query.sh -m student_socialskill -d id_wave id_teacher id_student school_type teacher_stressLevel_avg

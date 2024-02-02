library(charlatan)
library(tidyverse)

dir.create("data", showWarnings = FALSE)

fake <- fraudster()

rsample <- function(data, n) {
  sample(data, n, replace = TRUE)
}

fake_gender <- function(n) {
  rsample(c("M", "F"), n)
}

fake_grade <- function(n) {
  rsample(c(3, 4), n)
}


# Register schools, teachers, and students

schools <- tibble(
  id_school = 1:5
) %>%
  mutate(
    school_name = fake$color_name(n()),
    school_type = rsample(c("suburban", "urban", "rural"), n())
  ) %>%
  write_csv("data/schools.csv")

teachers <- tibble(
  id_teacher = 1:60
) %>% 
  mutate(
    id_school = rsample(schools$id_school, n()),
    teacher_name = fake$name(n()),
  ) %>%
  write_csv("data/teachers.csv")

students <- tibble(
  id_student = 1:300
) %>%
  mutate (
    id_school = rsample(schools$id_school, n()),
    student_name = fake$name(n()),
  ) %>%
  write_csv("data/students.csv")

# Define waves & weeks

waves <- tibble(
  id_wave = 1:3,
) %>%
  mutate(
    display_name = str_c("Wave ", id_wave)
  ) %>%
  write_csv("data/waves.csv")

weeks <- expand_grid(
  id_wave = waves$id_wave,
  week_num = 1:10,  
) %>%
  mutate(
    id_week = row_number(),
    display_name = str_c("Wave ", id_wave, ", Week ", week_num),
  ) %>%
  write_csv("data/weeks.csv")

# Collect teacher and student baseline info

teacher_info <- tibble(
  id_teacher = teachers$id_teacher,
) %>%
  mutate(
    teacher_grade = fake_grade(n()),
    teacher_gender = fake_gender(n()),
  ) %>%
  write_csv("data/teacher_info.csv")

student_info <- tibble(
  id_student = students$id_student,
) %>%
  mutate(
    student_grade = fake_grade(n()),
    student_gender = fake_gender(n()),
  ) %>%
  write_csv("data/student_info.csv")

# Student test scores at each wave

student_scores <- expand_grid(
  id_student = students$id_student,
  id_wave = waves$id_wave,
) %>%
  mutate(
    id = row_number(),
    student_mathScore = rsample(1:4, n()),
    student_readingScore = rsample(1:4, n()),
    student_writingScore = rsample(1:4, n()),
  ) %>%
  write_csv("data/student_scores.csv")

# Teacher stress scores at each week

teacher_weekly <- expand_grid(
  id_teacher = teachers$id_teacher,
  id_week = weeks$id_week,
) %>%
  mutate(
    teacher_stresslevel = rsample(1:4, n())
  ) %>%
  write_csv("data/teacher_weekly.csv")

# Teachers rate students' social skills & motivation each wave

teacher_student_ratings <- expand_grid(
  id_student = students$id_student,
  id_wave = waves$id_wave,
) %>%
  mutate(
    id_teacher = rsample(teachers$id_teacher, n()),
    student_socialskill = rsample(1:4, n()),
    student_motivation = rsample(1:4, n())
  ) %>%
  write_csv("data/teacher_student_ratings.csv")

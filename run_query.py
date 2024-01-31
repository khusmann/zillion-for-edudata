from zillion import Warehouse

wh = Warehouse("./warehouse.json")

wh.print_info()

result = wh.execute(
    metrics=["student_mathScore"],
    dimensions=["school_type", "student_grade_dim", "id_wave"],
)

print(result.df)


result = wh.execute(
    metrics=["teacher_stressLevel"],
    dimensions=["school_type"],
)

print(result.df)

result = wh.execute(
    metrics=["student_socialskill"],
    dimensions=["school_type"],
)

print(result.df)

result = wh.execute(
    metrics=["student_socialskill"],
    dimensions=[
        "id_wave", "id_teacher", "id_student",
        "school_type", "teacher_stressLevel_avg",
    ],
)

print(result.df)

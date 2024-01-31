from zillion import Warehouse

wh = Warehouse("./warehouse.json")

wh.print_info()

result = wh.execute(
    metrics=["student_mathScore"],
    dimensions=["school_type", "student_grade_dim", "id_wave"],
)

print(result.df)

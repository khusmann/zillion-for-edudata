from zillion import Warehouse

wh = Warehouse("./warehouse.json")

wh.print_info()

result = wh.execute(
    metrics=["student_mathScore", "student_grade"],
    dimensions=["school_type"],
)

print(result.df)

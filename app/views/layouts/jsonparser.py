import json

input_file = "exer4-courses.json"
output_file = "output.json"
in_fp = open(input_file)

students = {}
data = json.load(in_fp)
for course in data:
    for s in course['students']:
        students[s] = students.get(s, 0) + 1

out_fp = open(output_file, "w")
json.dump(students, out_fp)

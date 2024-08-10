people = [
    ('Arun', 30, 160),
    ('Black', 25, 175),
    ('Carter', 30, 170),
    ('Divya', 25, 180),
]

# Sort by age (ascending) and then by height (descending)
#sorted_people = sorted(people, key=lambda x: (x[1], -x[2]))
#,reverse=True
sorted_people = sorted(people, key=lambda x: (x[1], -x[2]))

print(sorted_people)

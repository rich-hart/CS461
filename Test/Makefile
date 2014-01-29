load_HW1_data_sets:
	psql -h wander -U rhh32 -d rhh32_cs461 -f PhotographyExample

load_class_info:
	psql -h wander -U rhh32 -d rhh32_cs461 -f Class_Database

dump:
	pg_dump -h wander rhh32_cs461 > photography_dumpfile.sql

lab1:
	psql -h wander -U rhh32 -d rhh32_cs461 -f Lab1

lab1a:
	psql -h wander -U rhh32 -d rhh32_cs461 -f Lab1a
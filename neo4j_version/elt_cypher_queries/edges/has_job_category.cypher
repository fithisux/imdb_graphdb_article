LOAD CSV WITH HEADERS FROM 'file:///job_category_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_PRINCIPALS {ID: toInteger(line.ID)}), (y:IMDB_JOB_CATEGORY {category: toInteger(line.category)})
 CREATE (x)-[:HAS_JOBCATEGORY]->(y)
} IN TRANSACTIONS OF 1000 ROWS
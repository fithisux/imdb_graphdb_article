LOAD CSV WITH HEADERS FROM 'file:///has_job_category_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_PRINCIPAL {principal_id: line.ID}), (y:IMDB_JOB_CATEGORY {category: line.category})
 CREATE (x)-[:HAS_JOB_CATEGORY]->(y)
} IN TRANSACTIONS OF 1000000 ROWS
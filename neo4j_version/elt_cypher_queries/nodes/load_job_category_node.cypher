LOAD CSV WITH HEADERS FROM 'file:///job_category_node.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
    with line
    CREATE (n:IMDB_JOB_CATEGORY {
    category:line.category})
} IN TRANSACTIONS OF 1000000 ROWS;
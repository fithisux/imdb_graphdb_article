LOAD CSV WITH HEADERS FROM 'file:///title_principals_cleansed_node.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
    with line
    CREATE (n:IMDB_TITLE_PRINCIPALS {
    ID:line.ID,
    ordering:toInteger(line.ordering),
    job:line.job})
} IN TRANSACTIONS OF 1000000 ROWS;
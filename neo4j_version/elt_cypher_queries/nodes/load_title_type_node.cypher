LOAD CSV WITH HEADERS FROM 'file:///title_type_node.csv.gz' AS line FIELDTERMINATOR ';'
CALL {
    with line
    CREATE (n:IMDB_TITLE_TYPE {
    title_type:line.title_type})
} IN TRANSACTIONS OF 1000 ROWS;
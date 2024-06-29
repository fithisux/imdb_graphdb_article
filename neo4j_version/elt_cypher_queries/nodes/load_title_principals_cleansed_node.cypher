LOAD CSV WITH HEADERS FROM 'file:///imdb_title_principal_node.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
    with line
    CREATE (n:IMDB_TITLE_PRINCIPAL {
    principal_id:line.principal_id,
    tconst: line.tconst,
    ordering:toInteger(line.ordering),
    job:line.job})
} IN TRANSACTIONS OF 1000000 ROWS;
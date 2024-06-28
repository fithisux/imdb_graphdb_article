LOAD CSV WITH HEADERS FROM 'file:///genre_node.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
    with line
    CREATE (n:IMDB_GENRE {
    genre:line.genre})
} IN TRANSACTIONS OF 1000000 ROWS;
LOAD CSV WITH HEADERS FROM 'file:///characters_node.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
    with line
    CREATE (n:IMDB_CHARACTERS {
    somecharacter:line.somecharacter})
} IN TRANSACTIONS OF 1000 ROWS;
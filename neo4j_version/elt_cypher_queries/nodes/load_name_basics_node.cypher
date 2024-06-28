LOAD CSV WITH HEADERS FROM 'file:///name_basics_node.csv.gz' AS line FIELDTERMINATOR ';'
CALL {
    with line
    CREATE (n:IMDB_NAME_BASICS {
    nconst:line.nconst,
    primaryName:line.primaryName,
    birthYear:toInteger(line.birthYear),
    deathYear:toInteger(line.deathYear)})
} IN TRANSACTIONS OF 1000000 ROWS;
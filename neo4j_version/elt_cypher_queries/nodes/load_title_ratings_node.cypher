LOAD CSV WITH HEADERS FROM 'file:///title_ratings_node.csv.gz' AS line FIELDTERMINATOR ';'
CALL {
    with line
    CREATE (n:IMDB_TITLE_RATINGS {
    ratetconst:line.ratetconst,
    averageRating:toFloat(line.averageRating),
    numVotes:toInteger(line.numVotes)})
} IN TRANSACTIONS OF 1000000 ROWS;
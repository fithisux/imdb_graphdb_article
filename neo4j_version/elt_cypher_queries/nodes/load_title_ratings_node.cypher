LOAD CSV WITH HEADERS FROM 'file:///imdb_title_rating_node.csv.gz' AS line FIELDTERMINATOR ';'
CALL {
    with line
    CREATE (n:IMDB_TITLE_RATING {
    ratetconst:line.ratetconst,
    averageRating:toFloat(line.averageRating),
    numVotes:toInteger(line.numVotes)})
} IN TRANSACTIONS OF 1000000 ROWS;
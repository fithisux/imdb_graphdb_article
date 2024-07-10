LOAD CSV WITH HEADERS FROM 'file:///imdb_title_episode_node.csv.gz' AS line FIELDTERMINATOR ';'
CALL {
    with line
    CREATE (n:IMDB_TITLE_EPISODE {
    epitconst:line.epitconst,
    seasonNumber:toInteger(line.seasonNumber),
    episodeNumber:toInteger(line.episodeNumber)})
} IN TRANSACTIONS OF 1000000 ROWS;
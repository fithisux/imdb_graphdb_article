match (n) DELETE (n);

LOAD CSV WITH HEADERS FROM 'file:///genres.csv' AS line
CREATE (n:GENRE {gnere:line.genre});
LOAD CSV WITH HEADERS FROM 'file:///region_codes.csv' AS line
CREATE (n:REGION_CODE {name:line.name, alpha2:line.alpha2});
LOAD CSV WITH HEADERS FROM 'file:///distribution_types.csv' AS line
CREATE (n:DISTRIBUTION_TYPE {distribution_type:line.distribution_type});
LOAD CSV WITH HEADERS FROM 'file:///distribution_types.csv' AS line
CREATE (n:JOB_CATEGORIES {job_category:line.job_category});
LOAD CSV WITH HEADERS FROM 'file:///language_codes.csv' AS line
CREATE (n:LANGUAGE_CODE {English:line.English, alpha2:line.alpha2});
LOAD CSV WITH HEADERS FROM 'file:///title_types.csv' AS line
CREATE (n:TITLE_TYPE {title_type:line.title_type});

:auto LOAD CSV WITH HEADERS FROM 'file:///name_basics_model.csv' AS line
CALL {
    with line
    CREATE (n:NAME_BASICS {
    nconst:line.nconst, 
    primaryName:line.primaryName,
    birthYear:line.birthYear,
    deathYear:line.deathYear,
    primaryProfession:line.primaryProfession,
    knownForTitles:line.knownForTitles});
} IN TRANSACTIONS OF 10 ROWS

LOAD CSV WITH HEADERS FROM 'file:///name_basics_model.csv' AS line
CREATE (n:NAME_BASICS {
    nconst:line.nconst, 
    primaryName:line.primaryName,
    birthYear:line.birthYear,
    deathYear:line.deathYear,
    primaryProfession:line.primaryProfession,
    knownForTitles:line.knownForTitles});
LOAD CSV WITH HEADERS FROM 'file:///title_akas_model_cleansed.csv' AS line
CREATE (n:TITLE_AKAS {
    titleID:line.titleID, 
    ordering:line.ordering,
    title:line.title,
    region:line.region,
    language:line.language,
    types:line.types,
    attributes:line.attributes,
    isOriginalTitle:line.isOriginalTitle});
LOAD CSV WITH HEADERS FROM 'file:///title_basics_model.csv' AS line
CREATE (n:TITLE_BASICS {
    tconst:line.tconst, 
    titleType:line.titleType,
    primaryTitle:line.primaryTitle,
    originalTitle:line.originalTitle,
    isAdult:line.isAdult,
    startYear:line.startYear,
    endYear:line.endYear,
    runtimeMinutes:line.runtimeMinutes,
    genres: line.genres});
LOAD CSV WITH HEADERS FROM 'file:///title_crew_model_cleansed.csv' AS line
CREATE (n:TITLE_CREW {
    tconst:line.tconst, 
    directors:line.directors,
    writers:line.writers});
LOAD CSV WITH HEADERS FROM 'file:///title_episode_model.csv' AS line
CREATE (n:TITLE_EPISODE {
    tconst:line.tconst, 
    parentTconst:line.parentTconst, 
    seasonNumber:line.seasonNumber,
    episodeNumber:line.episodeNumber});
LOAD CSV WITH HEADERS FROM 'file:///title_principals_model_cleansed.csv' AS line
CREATE (n:TITLE_PRINCIPALS {
    tconst:line.tconst, 
    ordering:line.ordering, 
    nconst:line.nconst,
    category:line.category,
    job:line.job,
    characters:line.characters});
LOAD CSV WITH HEADERS FROM 'file:///title_ratings_model.csv' AS line
CREATE (n:TITLE_RATINGS {
    tconst:line.tconst, 
    averageRating:line.averageRating, 
    numVotes:line.numVotes});


LOAD CSV WITH HEADERS FROM 'file:///name_basics_model.csv' AS line
CREATE (n:NAME_BASICS {
    nconst:line.nconst, 
    primaryName:line.primaryName,
    birthYear:toInteger(line.birthYear),
    deathYear:toInteger(line.deathYear),
    primaryProfession:apoc.convert.fromJsonList(line.primaryProfession),
    knownForTitles:apoc.convert.fromJsonList(line.knownForTitles)});
LOAD CSV WITH HEADERS FROM 'file:///title_akas_model.csv' AS line
CREATE (n:TITLE_AKAS {
    titleID:line.titleID, 
    ordering:toInteger(line.ordering),
    title:line.title,
    region:line.region,
    language:line.language,
    types:apoc.convert.fromJsonList(line.types),
    attributes:apoc.convert.fromJsonList(line.attributes),
    isOriginalTitle:toBoolean(line.isOriginalTitle)});
LOAD CSV WITH HEADERS FROM 'file:///title_basics_model.csv' AS line
CREATE (n:TITLE_BASICS {
    tconst:line.tconst, 
    titleType:line.titleType,
    primaryTitle:line.primaryTitle,
    originalTitle:line.originalTitle,
    isAdult:toBoolean(line.isAdult),
    startYear:toInteger(line.startYear),
    endYear:toInteger(line.endYear),
    runtimeMinutes:line.runtimeMinutes,
    genres: apoc.convert.fromJsonList(line.genres)});
LOAD CSV WITH HEADERS FROM 'file:///title_crew_model.csv' AS line
CREATE (n:TITLE_CREW {
    tconst:line.tconst, 
    directors:apoc.convert.fromJsonList(line.directors),
    writers:apoc.convert.fromJsonList(line.writers)});
LOAD CSV WITH HEADERS FROM 'file:///title_episode_model.csv' AS line
CREATE (n:TITLE_EPISODE {
    tconst:line.tconst, 
    parentTconst:line.parentTconst, 
    seasonNumber:toInteger(line.seasonNumber),
    episodeNumber:toInteger(line.episodeNumber)});
LOAD CSV WITH HEADERS FROM 'file:///title_principals_model.csv' AS line
CREATE (n:TITLE_PRINCIPALS {
    tconst:line.tconst, 
    ordering:toInteger(line.ordering), 
    nconst:line.nconst,
    category:line.category,
    job:line.job,
    characters:apoc.convert.fromJsonList(line.characters)});
LOAD CSV WITH HEADERS FROM 'file:///title_ratings_model.csv' AS line
CREATE (n:TITLE_RATINGS {
    tconst:line.tconst, 
    averageRating:toFloat(line.averageRating), 
    numVotes:toInteger(line.numVotes)});
CREATE INDEX imdb_attribute_attribute IF NOT EXISTS FOR (n:IMDB_ATTRIBUTE) ON (n.attribute);
CREATE INDEX imdb_characters_somecharacter IF NOT EXISTS FOR (n:IMDB_CHARACTERS) ON (n.somecharacter);
CREATE INDEX imdb_distribution_type_distribution_type IF NOT EXISTS FOR (n:IMDB_DISTRIBUTION_TYPE) ON (n.distribution_type);
CREATE INDEX imdb_genre_genre IF NOT EXISTS FOR (n:IMDB_GENRE) ON (n.genre);
CREATE INDEX imdb_job_category_category IF NOT EXISTS FOR (n:IMDB_JOB_CATEGORY) ON (n.category);
CREATE INDEX imdb_language_code_alpha2 IF NOT EXISTS FOR (n:IMDB_LANGUAGE_CODE) ON (n.alpha2);
CREATE INDEX imdb_name_basics_nconst IF NOT EXISTS FOR (n:IMDB_NAME_BASICS) ON (n.nconst);
CREATE INDEX imdb_primaryprofession_profession IF NOT EXISTS FOR (n:IMDB_PRIMARYPROFESSION) ON (n.profession);
CREATE INDEX imdb_region_code_alpha2 IF NOT EXISTS FOR (n:IMDB_REGION_CODE) ON (n.alpha2);
CREATE INDEX imdb_title_akas_id IF NOT EXISTS FOR (n:IMDB_TITLE_AKAS) ON (n.ID);
CREATE INDEX imdb_title_basics_tconst IF NOT EXISTS FOR (n:IMDB_TITLE_BASICS) ON (n.tconst);
CREATE INDEX imdb_title_episode_epitconst IF NOT EXISTS FOR (n:IMDB_TITLE_EPISODE) ON (n.epitconst);
CREATE INDEX imdb_title_principals_id IF NOT EXISTS FOR (n:IMDB_TITLE_PRINCIPALS) ON (n.ID);
CREATE INDEX imdb_title_ratings_tconst IF NOT EXISTS FOR (n:IMDB_TITLE_RATINGS) ON (n.tconst);
CREATE INDEX imdb_title_type_title_type IF NOT EXISTS FOR (n:IMDB_TITLE_TYPE) ON (n.title_type);
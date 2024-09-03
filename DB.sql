CREATE TABLE IF NOT EXISTS albums (
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(80) UNIQUE NOT NULL,
	album_year DATE NOT NULL,
	album_cover BYTEA NOT NULL
);

CREATE TABLE IF NOT EXISTS tracks (
	track_id SERIAL PRIMARY KEY,
	track_name VARCHAR(20) NOT NULL,
	track_duration INTEGER NOT NULL,
	track_compositor VARCHAR(80) NOT NULL,
	album_id INTEGER REFERENCES albums(album_id)
);

CREATE TABLE IF NOT EXISTS musicians (
	musician_id SERIAL PRIMARY KEY,
	musician_name VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS genres (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS collections (
	collection_id SERIAL PRIMARY KEY,
	collection_name VARCHAR(20) NOT NULL
); 

CREATE TABLE IF NOT EXISTS musician_genre (
	musician_id INTEGER REFERENCES musicians(musician_id),
	genre_id INTEGER REFERENCES genres(genre_id),
	constraint musician_genre_id primary key (musician_id, genre_id)
);

CREATE TABLE IF NOT EXISTS musician_album (
	musician_id INTEGER REFERENCES musicians(musician_id),
	album_id INTEGER REFERENCES albums(album_id),
	constraint musician_album_id primary key (musician_id, album_id)
);

CREATE TABLE IF NOT EXISTS track_collection (
	track_id INTEGER REFERENCES tracks(track_id),
	collection_id INTEGER REFERENCES collections(collection_id),
	constraint track_collection_id primary key (track_id, collection_id)
);



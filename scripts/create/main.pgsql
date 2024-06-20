
/* Create schema for work with the database */
CREATE SCHEMA coworking;

/* Creation of main tables */
/*------------------------------------------*/
CREATE TABLE coworking.users (
    cc INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE
);

CREATE TABLE coworking.sessions (
    id INTEGER PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    description VARCHAR(255) NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL
);

CREATE TABLE coworking.rooms (
    id INTEGER PRIMARY KEY,
    available BOOLEAN
);
/*------------------------------------------*/

/* Creating tables with foreign keys */
/*------------------------------------------*/
CREATE TABLE coworking.work_space (
    id SERIAL PRIMARY KEY,
    id_rooms INTEGER,
    row INTEGER,
    columns INTEGER,
    chair_number INTEGER,
    FOREIGN KEY (id_rooms) REFERENCES coworking.rooms(id)
)

CREATE TABLE coworking.booking (
    id SERIAL PRIMARY KEY,
    id_session INTEGER,
    cc_user INTEGER,
    id_work_space INTEGER,
    date DATE NOT NULL,
    price INTEGER,
    FOREIGN key (id_session) REFERENCES coworking.sessions(id),
    FOREIGN key (cc_user) REFERENCES coworking.users(cc),
    FOREIGN key (id_work_space) REFERENCES coworking.work_space(id)
)

/*------------------------------------------*/

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DROP TABLE IF EXISTS "users";

CREATE TABLE users (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  usersid character varying(32) NOT NULL DEFAULT(''),
  firstname character varying(128) NOT NULL DEFAULT(''),
  lastname character varying(128) NOT NULL DEFAULT(''),
  password character varying(512) NOT NULL DEFAULT(''),
  createdon timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT users_pkey PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);

CREATE INDEX IF NOT EXISTS ix_users_usersid
  ON users
  USING btree(usersid);

INSERT INTO users (usersid, firstname, lastname, password)
VALUES (100, 'test', 'test', 'test'),
	   (101, 'Ashley', 'Cain', 'ashleycain'),
	   (102, 'Daninthia', 'Fox', 'daninthiafox'),
	   (103, 'John', 'Connolly', 'johnconnolly'),
	   (104, 'Mae', 'Larrea', 'maelarrea'),
	   (105, 'Marissa', 'Montes', 'marissamontes');

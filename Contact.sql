CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DROP TABLE IF EXISTS "contact";


CREATE TABLE contact (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  name character varying(99),  --Stored in the edu.uark.models.entities:ContactEntity#userid.
  phonenumber NUMERIC(50, 0), --Stored in the edu.uark.models.entities:ContactEntity#phonenumber property. See also the named constant defined in edu.uark.models.entities.fieldnames:ProductFieldNames that is used for Java <-> SQL mappings.
  CONSTRAINT contact_pkey PRIMARY KEY (phonenumber)
) WITH (
  OIDS=FALSE
);

--DROP INDEX ix_contact_phonenumber;

CREATE INDEX IF NOT EXISTS ix_contact_phonenumber
  ON contact
  USING btree(phonenumber);

INSERT INTO contact (id, name, phonenumber)
VALUES ('d842f4fc-7cdf-48bd-96e7-35d1e55f6dcd', 'test', 8675309),
	   ('d842f4fc-7cdf-48bd-96e7-35d1e55f6dcd', 'Ashley', 88888888888),
	   ('d842f4fc-7cdf-48bd-96e7-35d1e55f6dcd', 'Daninthia', 8956152265488245456),
	   ('04b7853e-ec1f-4315-8669-a158d75f864b', 'John', 2585258258),
	   ('04b7853e-ec1f-4315-8669-a158d75f864b', 'Mae', 258258258258258285),
	   ('04b7853e-ec1f-4315-8669-a158d75f864b', 'Marissa', 48648624862);


--SELECT * FROM contact;

--DELETE FROM contact;

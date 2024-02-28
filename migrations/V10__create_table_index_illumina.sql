CREATE TABLE index_illumina (
  pk BIGSERIAL PRIMARY KEY,
  index_set_fk BIGINT,
  index_id VARCHAR(64) UNIQUE NOT NULL,
  index_seq VARCHAR(64),
  CONSTRAINT fk_index_set_illumina FOREIGN KEY(index_set_fk) REFERENCES index_set_illumina(pk) ON DELETE CASCADE
);

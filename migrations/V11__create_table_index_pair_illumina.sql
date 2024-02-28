CREATE TABLE index_pair_illumina (
  pk BIGSERIAL PRIMARY KEY,
  index_fk BIGINT NOT NULL,
  index2_fk BIGINT NOT NULL,
  index_pair_id VARCHAR(64) UNIQUE NOT NULL,
  index_plate_well VARCHAR(64),
  CONSTRAINT fk_index FOREIGN KEY(index_fk) REFERENCES index_illumina(pk) ON DELETE CASCADE,
  CONSTRAINT fk_index2 FOREIGN KEY(index2_fk) REFERENCES index_illumina(pk) ON DELETE CASCADE
);

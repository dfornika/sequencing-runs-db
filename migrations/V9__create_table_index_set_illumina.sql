CREATE TABLE index_set_illumina (
  pk BIGSERIAL PRIMARY KEY,
  index_set_id VARCHAR(255) UNIQUE NOT NULL,
  index_set_name VARCHAR(255),
  illumina_catalog_number VARCHAR(255)
);

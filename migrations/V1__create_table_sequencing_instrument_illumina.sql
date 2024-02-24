CREATE TABLE sequencing_instrument_illumina (
  pk SERIAL PRIMARY KEY,
  instrument_id VARCHAR(255) UNIQUE NOT NULL,
  instrument_type VARCHAR(255),
  status VARCHAR(255),
  timestamp_status_updated TIMESTAMP
);

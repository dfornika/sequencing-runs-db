CREATE TABLE sequencing_instrument_nanopore (
  pk SERIAL PRIMARY KEY,
  instrument_id VARCHAR(255) NOT NULL,
  instrument_type VARCHAR(255),
  status VARCHAR(255),
  timestamp_status_updated TIMESTAMP
);

CREATE TABLE sequencing_run_nanopore_acquisition (
  pk SERIAL PRIMARY KEY,
  acquisition_run_id VARCHAR(255) NOT NULL,
  sequencing_run_fk INTEGER,
  basecalling_config_filename VARCHAR(255),
  channel_count INTEGER,
  events_to_base_ratio FLOAT,
  finishing_state VARCHAR(255),
  num_bases_total INTEGER,
  num_bases_passed_filter INTEGER,
  num_reads_total INTEGER,
  num_reads_passed_filter INTEGER,
  purpose VARCHAR(255),
  sample_rate INTEGER,
  startup_state VARCHAR(255),
  state VARCHAR(255),
  stop_reason VARCHAR(255),
  CONSTRAINT fk_sequencing_run FOREIGN KEY(sequencing_run_fk) REFERENCES sequencing_run_nanopore(pk)
);

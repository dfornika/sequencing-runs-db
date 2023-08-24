CREATE TABLE sequencing_run_illumina_demultiplexing (
  pk SERIAL PRIMARY KEY,
  sequencing_run_illumina_fk INTEGER,
  demultiplexing_id_global VARCHAR(255) NOT NULL,
  demultiplexing_id_runlocal VARCHAR(255) NOT NULL,
  samplesheet_path VARCHAR(255),
  CONSTRAINT fk_sequencing_run_illumina FOREIGN KEY(sequencing_run_illumina_fk) REFERENCES sequencing_run_illumina(pk)
);

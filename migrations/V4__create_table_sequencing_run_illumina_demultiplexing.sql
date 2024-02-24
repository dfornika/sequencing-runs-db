CREATE TABLE sequencing_run_illumina_demultiplexing (
  pk SERIAL PRIMARY KEY,
  sequencing_run_illumina_fk INTEGER,
  sequencing_run_id VARCHAR(255) NOT NULL,
  demultiplexing_id VARCHAR(255) NOT NULL,
  samplesheet_path VARCHAR(255),
  fastq_dir_path VARCHAR(255),
  CONSTRAINT fk_sequencing_run_illumina FOREIGN KEY(sequencing_run_illumina_fk) REFERENCES sequencing_run_illumina(pk)
);

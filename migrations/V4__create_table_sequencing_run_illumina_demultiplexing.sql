CREATE TABLE sequencing_run_illumina_demultiplexing (
  pk BIGSERIAL PRIMARY KEY,
  sequencing_run_illumina_fk BIGINT NOT NULL,
  sequencing_run_id VARCHAR(255) NOT NULL,
  demultiplexing_id VARCHAR(255) NOT NULL,
  samplesheet_path VARCHAR(255),
  fastq_dir_path VARCHAR(255),
  CONSTRAINT fk_sequencing_run_illumina FOREIGN KEY(sequencing_run_illumina_fk) REFERENCES sequencing_run_illumina(pk) ON DELETE CASCADE,
  CONSTRAINT uq_sequencing_run_illumina_demultiplexing UNIQUE (sequencing_run_id, demultiplexing_id)
);

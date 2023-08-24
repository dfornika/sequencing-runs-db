CREATE TABLE sequenced_library_illumina (
  pk SERIAL PRIMARY KEY,
  library_id_global VARCHAR(255) NOT NULL,
  library_id_runlocal VARCHAR(255) NOT NULL,
  demultiplexing_fk INTEGER,
  project_id_samplesheet VARCHAR(255),
  project_id_translated VARCHAR(255),
  fastq_path_r1 VARCHAR(255),
  fastq_path_r2 VARCHAR(255),
  index VARCHAR(255),
  index2 VARCHAR(255),
  num_reads INTEGER,
  num_bases INTEGER,
  q30_rate NUMERIC,
  CONSTRAINT fk_demultiplexing FOREIGN KEY(demultiplexing_fk) REFERENCES sequencing_run_illumina_demultiplexing(pk)
);

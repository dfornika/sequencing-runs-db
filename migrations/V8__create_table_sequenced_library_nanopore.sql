CREATE TABLE sequenced_library_nanopore (
  pk SERIAL PRIMARY KEY,
  library_id_global VARCHAR(255) NOT NULL,
  library_id_runlocal VARCHAR(255) NOT NULL,
  acquisition_run_fk INTEGER,
  project_id_samplesheet VARCHAR(255),
  project_id_translated VARCHAR(255),
  fastq_path_combined VARCHAR(255),
  barcode_name VARCHAR(255),
  barcode_alias VARCHAR(255),
  num_reads INTEGER,
  num_bases INTEGER,
  CONSTRAINT fk_acquisition_run FOREIGN KEY(acquisition_run_fk) REFERENCES sequencing_run_nanopore_acquisition(pk)
);

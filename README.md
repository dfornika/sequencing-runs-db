[![Test migrations](https://github.com/dfornika/sequencing-runs-db/actions/workflows/test_migrations.yml/badge.svg)](https://github.com/dfornika/sequencing-runs-db/actions/workflows/test_migrations.yml)

# sequencing-runs-db

Note: In the diagram below, `id` is used as the primary key field. But in the real database schema, that field is named `pk`. `id` is used in the diagram because using `pk` causes a rendering errror.

```mermaid
erDiagram
  sequencing_instrument_illumina {
    int id PK
    string instrument_id
    string instrument_type
    string status
    datetime timestamp_status_updated
  }
  sequencing_run_illumina {
    int id PK
    string sequencing_run_id
    string flowcell_id
    string instrument_id
    string experiment_name
    date run_date
    int cluster_count
    int cluster_count_passed_filter
    float error_rate
    float first_cycle_intensity
    int num_cycles
    int num_reads
    int num_reads_passed_filter
    float percent_reads_passed_filter
    float percent_clusters_passed_filter
    float percent_occupied
    float percent_aligned
    float q30_percent
    float projected_yield_gigabases
    float yield_gigabases
  }
  sequencing_instrument_illumina ||--o{ sequencing_run_illumina : oneToMany
  sequencing_run_illumina_demultiplexing {
    int id PK
    int sequencing_run_illumina_fk FK
    string demultiplexing_id_global
    string demultiplexing_id_runlocal
    string samplesheet_path
  }
  sequencing_run_illumina ||--o{ sequencing_run_illumina_demultiplexing : oneToMany
  sequenced_library_illumina {
    int id PK
    string library_id_global
    string library_id_runlocal
    int demultiplexing_fk FK
    string project_id_samplesheet
    string project_id_translated
    string fastq_path_r1
    string fastq_path_r2
    string index
    string index2
    int num_reads
    int num_bases
    float q30_rate
  }
  sequencing_run_illumina_demultiplexing ||--o{ sequenced_library_illumina : oneToMany
  sequencing_instrument_nanopore {
    int id PK
    string instrument_id
    string instrument_type
    string status
    datetime timestamp_status_updated
  }
  sequencing_run_nanopore {
    int id PK
    string sequencing_run_id
    string instrument_id
    string flowcell_id
    string flowcell_product_code
    int num_reads_passes_filter
    int num_reads_total
    string protocol_id
    date run_date
    string sample_sheet_path
    datetime timestamp_protocol_run_started
    datetime timestamp_protocol_run_ended
    float yield_gigabases
  }
  sequencing_instrument_nanopore ||--o{ sequencing_run_nanopore : oneToMany
  sequencing_run_nanopore_acquisition {
    int id PK
    int sequencing_run_fk FK
    string basecalling_config_filename
    int channel_count
    float events_to_base_ratio
    string finishing_state
    int num_bases_total
    int num_bases_passed_filter
    int num_reads_total
    int num_reads_passed_filter
    string purpose
    int sample_rate
    string startup_state
    string state
    string stop_reason
  }
  sequencing_run_nanopore ||--o{ sequencing_run_nanopore_acquisition : oneToMany
  sequenced_library_nanopore {
    int id PK
    string library_id_global
    string library_id_runlocal
    int acquisition_run_fk FK
    string project_id_samplesheet
    string project_id_translated
    string fastq_path_combined
    string barcode_name
    string barcode_alias
    int num_reads
    int num_bases
  }
  sequencing_run_nanopore_acquisition ||--o{ sequenced_library_nanopore : oneToMany
```

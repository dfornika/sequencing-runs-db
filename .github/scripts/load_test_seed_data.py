#!/usr/bin/env python

import argparse
import csv
import json
import os

import psycopg
import jinjasql


def parse_csv(csv_path, int_fields=[], float_fields=[], date_fields=[], datetime_fields=[]):
    parsed_rows = []
    with open(csv_path, 'r') as f:
        reader = csv.DictReader(f, dialect='unix')
        for row in reader:
            for field in int_fields:
                try:
                    row[field] = int(row[field])
                except ValueError as e:
                    row[field] = None
            parsed_rows.append(row)

        return parsed_rows

def get_template(template_path):
    template = ""
    with open(template_path, 'r') as f:
        template = f.read()

    template = template.strip()

    return template


def main(args):

    j = jinjasql.JinjaSql()
    conn = psycopg.connect("dbname=sequencing_runs user=sequencing_runs_test_user password=sequencingrunstestuserpassword")

    illumina_instruments_int_fields = [
        'pk'
    ]

    illumina_instruments = parse_csv(
        os.path.join(args.data_dir, 'sequencing_instrument_illumina.csv'),
        int_fields=illumina_instruments_int_fields,
    )    

    insert_sequencing_instrument_illumina_template = get_template(
        os.path.join(args.queries_dir, 'templates', 'insert_into_sequencing_instrument_illumina.template.sql')
    )

    for illumina_instrument in illumina_instruments:
        query, bind_params = j.prepare_query(insert_sequencing_instrument_illumina_template, illumina_instrument)
        with conn.cursor() as cursor:
            try:
                cursor.execute(query, bind_params)
            except psycopg.errors.UniqueViolation as e:
                pass
            conn.commit()


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--data-dir', type=str, default='data')
    parser.add_argument('--queries-dir', type=str)
    args = parser.parse_args()
    main(args)
    

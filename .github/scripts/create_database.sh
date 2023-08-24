#!/bin/bash

psql -U postgres -h localhost -f .github/scripts/create_database.pgsql

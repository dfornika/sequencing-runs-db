#!/bin/bash

wget -q https://download.red-gate.com/maven/release/org/flywaydb/enterprise/flyway-commandline/9.22.0/flyway-commandline-9.22.0-linux-x64.tar.gz
tar -xzf flyway-commandline-9.22.0-linux-x64.tar.gz
sudo ln -s `pwd`/flyway-9.22.0/flyway /usr/local/bin

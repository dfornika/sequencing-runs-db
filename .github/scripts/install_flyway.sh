#!/bin/bash

wget -q https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/9.21.2/flyway-commandline-9.21.2-linux-x64.tar.gz
tar -xzf flyway-commandline-9.21.2-linux-x64.tar.gz
sudo ln -s `pwd`/flyway-9.21.2/flyway /usr/local/bin

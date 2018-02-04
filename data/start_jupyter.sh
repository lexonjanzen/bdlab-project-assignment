#! /bin/bash

export SPARK_HOME=/opt/cloudera/parcels/CDH-5.12.0-1.cdh5.12.0.p0.29/lib/spark
export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS='notebook'
export PATH=/opt/cloudera/parcels/Anaconda-4.3.1/bin:$PATH
export NOTEBOOK_DIR="/home/cloudera"
export PYSPARK_PYTHON=/opt/Python-2.7.14/python

pyspark



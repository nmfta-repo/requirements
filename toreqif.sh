#!/bin/bash
mkdir -p reqif
strictdoc export . --formats=reqif-sdoc --output-dir .
mv reqif/output.reqif docs/html/vcr-experiment.reqif


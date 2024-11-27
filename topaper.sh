#!/bin/bash
mkdir -p reqif
strictdoc export . --formats=rst --output-dir .
mv rst/*.rst paper/source/

(cd paper && make latex && make latexpdf)

#!/bin/bash
mkdir -p reqif
strictdoc export --formats=rst --project-title "Heavy Duty Vehicle Cybersecurity Requirements (HD VCR)" --output-dir . *.sdoc
mv rst/*.rst paper/source/

(cd paper && make latex && make latexpdf)

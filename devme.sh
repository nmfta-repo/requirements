#!/bin/bash

function die() {
	exit 1
}

python /mnt/c/Users/Public/src/strictdoc/strictdoc/cli/main.py export --project-title "Heavy Duty Vehicle Cybersecurity Requirements (HD VCR)" --output-dir docs/ *.sdoc || die

mkdir -p reqif
python /mnt/c/Users/Public/src/strictdoc/strictdoc/cli/main.py export --formats=reqif-sdoc --project-title "Heavy Duty Vehicle Cybersecurity Requirements (HD VCR)" --output-dir . *.sdoc || die
mv reqif/output.reqif docs/html/vcr-experiment.reqif || die

python /mnt/c/Users/Public/src/strictdoc/strictdoc/cli/main.py export --formats=rst --project-title "Heavy Duty Vehicle Cybersecurity Requirements (HD VCR)" --output-dir . *.sdoc || die
mv rst/*.rst paper/source/ || die

(cd paper && make latex && make latexpdf)

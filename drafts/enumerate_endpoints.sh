#!/usr/bin/env bash

# script by @arainho
# note: some tools entries were adopted from @dsopas MindAPI repository

TARGET_TLD="$1"
WORDLIST="$2"

gobuster -e -u http://${TARGET_TLD} -w ${WORDLIST} -o gobuster-${TARGET_TLD}.output
ffuf -w ${WORDLIST} -u https://${TARGET_TLD}/FUZZ -mc all -c -v -o ffuf-${TARGET_TLD}.output
git clone --depth=1 https://github.com/projectdiscovery/nuclei-templates.git && \
  nuclei -target ${TARGET_TLD} -t nuclei-templates/exposures/apis/
  
# in progress
# curl -L -o config.ini https://raw.githubusercontent.com/OWASP/Amass/master/examples/config.ini && \
  amass enum -active -d ${TARGET_TLD} -config config.ini
# jaeles scan -s swagger-ui-probing.yaml -u ${TARGET_TLD}
# arjun -u https://${TARGET_TLD}/endpoint
# python3 paramspider.py --domain ${TARGET_TLD}
# tntfuzzer --url https://${TARGET_TLD}/v1/swagger.json --iterations 100 --log_all
# kr scan ${TARGET_TLD} -w routes.kite -A=apiroutes-210228:20000 -x 10 --ignore-length=34

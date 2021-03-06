#!/usr/bin/env bash

TARGET_DIR="${1:-../wordlists}"
TMP_DIR="${TARGET_DIR}/tmp"
TMP_BUNDLE="${TMP_DIR}/tmp_bundle.txt"

echo "target dir: ${TARGET_DIR}"

# create target and tmp directory
mkdir -p "${TMP_DIR}"

# download wordlists
curl -o "${TMP_DIR}"/common-api-endpoints-mazen160.txt "https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/common-api-endpoints-mazen160.txt"
curl -o "${TMP_DIR}"/yassineaboukir-3203-common-api-endpoints.txt "https://gist.githubusercontent.com/yassineaboukir/8e12adefbd505ef704674ad6ad48743d/raw/3ea2b7175f2fcf8e6de835c72cb2b2048f73f847/List%2520of%2520API%2520endpoints%2520&%2520objects"
curl -o "${TMP_DIR}"/danielmiessler-SecLists-swagger.txt "https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/swagger.txt"
curl -o "${TMP_DIR}"/danielmiessler-SecLists-api-endpoints.txt "https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/api/api-endpoints.txt"
curl -o "${TMP_DIR}"/danielmiessler-SecLists-graphql.txt "https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/graphql.txt"
curl -o "${TMP_DIR}"/kiterunner-swagger-wordlist.txt "https://wordlists-cdn.assetnote.io/data/kiterunner/swagger-wordlist.txt"
curl -o "${TMP_DIR}"/httparchive_apiroutes_2021_08_28.txt "https://wordlists-cdn.assetnote.io/./data/automated/httparchive_apiroutes_2021_08_28.txt"
curl -o "${TMP_DIR}"/fuzzdb-project-common-methods.txt "https://github.com/fuzzdb-project/fuzzdb/tree/master/discovery/common-methods"


# remove old bundles and wordlists
unlink "${TARGET_DIR}"/wordlist_bundle_latest.txt
rm -- "${TARGET_DIR}"/wordlist_bundle_*.txt

# create new bundle
cat "${TMP_DIR}"/*.txt  > "${TMP_BUNDLE}"
cat "${TMP_BUNDLE}" | sort -n | uniq > "${TARGET_DIR}/wordlist_bundle_$(date +"%Y-%m-%d").txt"
ln -s "${TARGET_DIR}/wordlist_bundle_$(date +"%Y-%m-%d").txt" "${TARGET_DIR}/wordlist_bundle_latest.txt"

# cleanup
test -f "${TMP_BUNDLE}" && rm -fv -- "${TMP_BUNDLE}"

# TODO's list

## 1. Features to add

### sudo
- Set NOPASSWD for passwd command only instead of all commands

## 2. Tools to add

### New
- [ ] [wasfsw00f](https://github.com/EnableSecurity/wafw00f)
- [ ] [gotestwaf](https://github.com/wallarm/gotestwaf)
- [ ] [cherrybomb](https://github.com/blst-security/cherrybomb)
- [ ]  yq, xq

#### Test passed, ddd to final image
- [ ]  etckeeper
- [ ]  vim, nano
- [ ]  yq, xq
- [ ]  [clairvoyance](https://github.com/nikitastupin/clairvoyance)

### With errors
- [ ] [racepwn](https://github.com/racepwn/racepwn) 
  - fix errors on 'RUN' lines for racepwn
- [ ] [hyperscan](https://github.com/intel/hyperscan)
- [ ] [firecracker](https://github.com/blst-security/firecracker)
  - installation in Dockerfile.testing completes, but tool execution was not successful.

## 3. Next steps
- [ ] List all tools not found in path
- [ ] Fix tools with `"path": null`

## 4. Done  
These tools are included in the 'api-security-toolbox' image
- [x] [Ciphey](https://github.com/Ciphey/Ciphey), that automatically decrypt's encryptions without knowing the key or cipher, decode encodings, and crack hashes. 
- [x] openapi_security_scanner
      - fix RUN lines for [openapi_security_scanner](https://github.com/ngalongc/openapi_security_scanner)
- [x] restler-fuzzer
   - fix RUN lines for [restler-fuzzer](https://github.com/microsoft/restler-fuzzer)
- [x] sslscan2
  - dependencies alpine-sdk, perl, zlib-dev, linux-headers, openssl, curl, unzip, git
  - sslscan docker image [layers](https://hub.docker.com/layers/shamelesscookie/sslscan/latest/images/sha256-5f3dbd82c8d3c8da79887a9c56eb9679b7b191c3019342ac3f441944e895b270?context=explore)
- [x] [httpX](https://github.com/projectdiscovery/httpx)
- [x] [proxify](https://github.com/projectdiscovery/proxify)
- [x] [jq](https://github.com/stedolan/jq)
- [x] [yq](https://github.com/mikefarah/yq)
- [x] git
- [x]  strace and gdb

These following tools are only available through docker-compose in [utils](/utils) folder
- [x] [hoppscotch](https://github.com/hoppscotch/hoppscotch), an Open source API development ecosystem called.  
- [x] [CyberChef](https://github.com/gchq/CyberChef), the Cyber Swiss Army Knife - a web app for encryption, encoding, compression and data analysis.   
- [x] [reconmap](https://github.com/reconmap/reconmap), a VAPT (vulnerability assessment and penetration testing) automation and reporting platform.
- [x] [zaproxy](https://github.com/zaproxy/zaproxy), the OWASP Zed Attack Proxy (ZAP) can help you automatically find security vulnerabilities in your web applications while you are developing and testing your applications.

Task related with image tools report
- [x] Enumerate the tools installed in 'apisec-toolbox' in a file ? - txt
- [x] evaluate the proper output for tools report (CSV, JSON) ? - JSON
- [x] evaluate appropriate languange for building the report (Python, Golang, Other) ? - Python
- [x] Add name, path and sha256sum os each tool to a report file
- [x] verify if tools binaries or scripts are in the image path
- [x] create a github workflow for checking if tools inside container image
 

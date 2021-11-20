# TODO's list

## Fix errors
- [ ] racepwn 
  - fix RUN lines for [racepwn](https://github.com/racepwn/racepwn)

- [ ] restler-fuzzer
   - fix RUN lines for [restler-fuzzer](https://github.com/microsoft/restler-fuzzer)
   - or use oficial [Dockerfile](https://github.com/microsoft/restler-fuzzer/blob/main/docker/Dockerfile) in our multi-stage build
 

## Next steps 
- [ ] Create a list of tools installed in 'api-security-toolbox'  
- [ ] evaluate the proper file for the list (CSV, JSON) ? 
- [ ] evaluate appropriate languange for building the list (Python, Golang, Other) ?  
- [ ] Check if tools binaries or scripts are in the path  
- [ ] Add name, path and sha256sum os each tool in the list   

## Done  
These tools are included in the 'api-security-toolbox' image
- [x] [Ciphey](https://github.com/Ciphey/Ciphey), that automatically decrypt's encryptions without knowing the key or cipher, decode encodings, and crack hashes. 
- [x] openapi_security_scanner
      - fix RUN lines for [openapi_security_scanner](https://github.com/ngalongc/openapi_security_scanner)
 
These tools are only available through docker-compose in [utils](/utils) folder
- [x] [hoppscotch](https://github.com/hoppscotch/hoppscotch), an Open source API development ecosystem called.  
- [x] [CyberChef](https://github.com/gchq/CyberChef), the Cyber Swiss Army Knife - a web app for encryption, encoding, compression and data analysis.   
- [x] [reconmap](https://github.com/reconmap/reconmap), a VAPT (vulnerability assessment and penetration testing) automation and reporting platform.


 

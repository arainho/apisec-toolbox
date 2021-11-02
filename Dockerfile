# golang:alpine3.14
FROM golang@sha256:5ce2785c82a96349131913879a603fc44d9c10d438f61bba84ee6a1ef03f6c6f

# tools in /usr/local/bin/
# wordlists in /usr/share/wordlists/
# templates in /usr/share/templates/
# signatures in /usr/share/signatures/

RUN mkdir -p /usr/share/{wordlists,templates,signatures}
RUN apk update
RUN apk add python3 py3-pip && \
    pip3 install --upgrade pip setuptools
RUN apk --no-cache add ca-certificates curl wget nmap netcat-openbsd bind-tools git build-base

RUN go get -u -v github.com/eth0izzle/shhgit
RUN mkdir -p /usr/share/signatures/eth0izzle-signatures/ && \
    curl -o /usr/share/signatures/eth0izzle-signatures/config.yaml https://raw.githubusercontent.com/eth0izzle/shhgit/master/config.yaml
RUN go install github.com/OJ/gobuster/v3@latest
RUN go get -u -v github.com/ffuf/ffuf
RUN go get -u -v github.com/OWASP/Amass/v3/...
RUN go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest && \
    git clone https://github.com/projectdiscovery/nuclei-templates.git /usr/share/templates/nuclei-templates
RUN GO111MODULE=on go get -u -v github.com/jaeles-project/jaeles && \
    GO111MODULE=on go get -u github.com/jaeles-project/gospider && \
    git clone https://github.com/jaeles-project/jaeles-signatures.git /usr/share/signatures/jaeles-signatures
RUN pip3 install --upgrade arjun
RUN git clone https://github.com/devanshbatham/ParamSpider && \
    cd ParamSpider && pip3 install -r requirements.txt
RUN git clone https://github.com/mseclab/PyJFuzz.git && \
    cd PyJFuzz && python setup.py install && \
    cd .. && pip install -r requirements.txt
RUN git clone https://github.com/assetnote/kiterunner /usr/local/kiterunner && \
    make build && ln -s $(pwd)/dist/kr /usr/local/bin/kr && \
    ln -s /usr/local/kiterunner/api-signatures /usr/share/signatures/kiterunner-api-signatures

RUN git clone https://github.com/danielmiessler/SecLists.git /usr/share/wordlists/danielmiessler-seclists
RUN mkdir -p /usr/share/wordlists/assetnote-io && cd /usr/share/wordlists/assetnote-io && \
    wget -r --no-parent -R "index.html*" https://wordlists-cdn.assetnote.io/data/ -nH 

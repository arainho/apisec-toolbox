# APIsec Toolbox

The `APIsec toolbox` is a Swiss knife for _API Security testing_. 

This repository includes a wordlist bundle, dedicated docker image, labs, and resources.
It's dedicated to experimenting around automatic and manual flows related to security testing for APIs.

**WARNING:** This is a development repository, use it at your own risk !!!

## 1 - workdlists bundle
Collect several wordlists and build a bundle.

## 2 - build docker image for apisec-toolbox
The [apisec-toolbox](https://hub.docker.com/r/arainho/apisec-toolbox) is a swiss knife for API security testing. 

The main image is based on the `Dockerfile` and has the following features:
- multi-stage build to save disk space
- linux os utilities installed as root
- tools and utilities installed as appuser (normal user with sudo)

Note: there is an old image called [api-security-toolbox](https://hub.docker.com/r/arainho/api-security-toolbox) that will be removed in the future.

## 3. run the apisec-toolbox
```bash
docker run -it --rm arainho/apisec-toolbox /bin/bash
```

Set a password for user
```
passwd appuser
```
**warning: for simplicity, the sudo works without password for any command.** You are advised to remove the `NOPASSWD` word from the line `appuser ALL=(ALL) ALL` in `/etc/sudoers.d/appuser` file and the linux will start asking your password to run commands as sudo.


If you need apicheck tools inside the toolbox you need docker unix socket inside the container
```bash
docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock arainho/apisec-toolbox /bin/bash
```

Then you can install [apicheck](https://bbva.github.io/apicheck/docs) tools
```bash
acp install jwt-checker
acp install acurl
acp install oas-checker
acp install send-to-proxy
acp install apicheck-curl
acp install sensitive-data
acp install replay
acp install openapiv3-lint
acp install openapiv2-lint
acp install oas-checker
```

**warning: Using docker.sock could expose your host within the toolbox container** as stated in this [article](https://www.ctl.io/developers/blog/post/tutorial-understanding-the-security-risks-of-running-docker-containers).

## 4 - run vulnerable API's locally
On the [`labs`](./labs) folders has scripts to build and run vulnerable API's locally.  
The purpose is to have local labs to exploit and learn API security.

## 5. collaboration
For adding new tools or fix broken entries from [ToDo list](TODO.md) use the following procedure:
1. Clone the repository
   ```bash
   git clone https://github.com/arainho/apisec-toolbox
   git checkout -b tool-xyz
   ```

2. Open the `Dockerfile.testing` with a text editor and change the following lines:
   - `ENV TOOL_NAME="tool-name"`
   - `RUN <add installation commands here>`
   
3. Build the image
   ```bash
   docker build -t apisec-toolbox:local -f Dockerfile.testing
   ```

4. If everything looks good, create a pull request
   ```bash
   git add Dockerfile.testing
   git commit -m "new entry for tool-xyz"
   git push origin tool-xyz
   ```
   
   you can check more information on creating a pull request [here](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request)
   
 5. A maintainer will review the pull request
    - manual review
    - add extra lines on Dockerfile.multistage
    - github actions workflow will run
    - If all looks good your PR will pass 😃

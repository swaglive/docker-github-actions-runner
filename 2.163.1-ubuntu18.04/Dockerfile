FROM ubuntu:18.04

WORKDIR /home/runner

ARG RUNNER_VERSION="2.163.1"

RUN apt-get update && apt-get install -y curl

# Install github runner 
RUN curl -O https://githubassets.azureedge.net/runners/$RUNNER_VERSION/actions-runner-linux-x64-$RUNNER_VERSION.tar.gz &&\
    tar xzf ./actions-runner-linux-x64-$RUNNER_VERSION.tar.gz &&\
    ./bin/installdependencies.sh &&\
    rm *.tar.gz

# Need to change to non-root user since runner scripts requested.
RUN useradd runner &&\
    chown -R runner:runner .

# For debugging
RUN apt-get install -y sudo &&\
    echo "runner ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers &&\
    usermod -aG sudo runner

# Pre-installed softwares
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - &&\
    apt-get install -y nodejs

RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list &&\
    apt-get update && apt-get install -y yarn

# Didn't mentioned dependencies in any documents
RUN apt-get install -y --no-install-recommends iputils-ping git

RUN apt-get install -y --no-install-recommends apt-transport-https ca-certificates software-properties-common &&\
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - &&\
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"  &&\
    apt-get update && apt-get install -y --no-install-recommends docker-ce

# Set default image user
USER runner
COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]

# ENV AGENT_ALLOW_RUNASROOT=1
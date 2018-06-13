FROM library/python

ARG git_remote=https://github.com/shibdib/Firetail.git
ARG git_branch=master

RUN git clone --single-branch -b $git_branch $git_remote /firetail
RUN pip3 install --process-dependency-links -e /firetail
RUN mkdir -p /etc/firetail || true

# Define the ENV vars the config volume and the entrypoint for the container
ENV CONFIG=/etc/firetail LOG=/firetail/bot.log
VOLUME /firetail
WORKDIR /firetail
ENTRYPOINT [ "python3", "/firetail/firetail", "--debug"]

FROM rocker/verse:3.5.3
LABEL R=3.5.3

# Adopted from
# https://hub.docker.com/r/rocker/r-base/dockerfile
RUN useradd docker \
	&& mkdir /home/docker \
	&& chown docker:docker /home/docker \
	&& addgroup docker staff

COPY scripts scripts
RUN apt update \
	&& apt install -y --no-install-recommends python3 \
	# Used by Arrow install and signature verification process \
	&& apt install -y --no-install-recommends gnupg apt-transport-https \
	# This is risky as we can break fragile native dependencies \
	&& /scripts/install_arrow.sh \
	&& apt  clean \
	&& rm -rf /var/lib/apt/lists/*ce

# This can potentially break R environment
RUN Rscript scripts/install_dependencies.R

USER docker
WORKDIR /home/docker
COPY entrypoint.py /usr/bin
ENTRYPOINT ["/usr/bin/entrypoint.py"]
CMD []
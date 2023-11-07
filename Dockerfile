FROM phusion/baseimage:jammy-1.0.1

# Install python and create a virtualenv
ARG USER=root
ARG DEBIAN_FRONTEND=noninteractive
RUN install_clean python3.11 python3.11-dev python3.11-venv gcc
RUN python3.11 -m venv /venv
ENV PATH=/venv/bin:$PATH

# Copy and install fact_extractor
COPY . /opt/app
WORKDIR /opt/app/fact_extractor
RUN . /venv/bin/activate && install/pre_install.sh
RUN . /venv/bin/activate && /venv/bin/python3.11 install.py


ENTRYPOINT ["./docker_extraction.py"]

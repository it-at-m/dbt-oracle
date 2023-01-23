# syntax=docker/dockerfile:1
# Image providing Data Build Tools (dbt) with dbt-oracle and Oracle Instant Client (thick mode) pre-installed.

# Official dbt-core image from dbt Labs as startingpoint
FROM ghcr.io/dbt-labs/dbt-core:latest

# Arg to control the download of the instant client from oracle. Default: latest
ARG INSTANTCLIENT_DOWNLOAD_URL=https://download.oracle.com/otn_software/linux/instantclient/instantclient-basic-linuxx64.zip
# Arg to control if a specific dbt-oracle version should be used. Default: [empty = latest] Value: ['==1.3.1' = v1.3.1 of dbt-oracle]
ARG DBT_ORACLE_VERSION=''


# Install the dependencies that required
RUN apt-get update -qq && apt-get upgrade -y && apt-get install -qq --no-install-recommends curl zip unzip libaio1 libaio-dev git


# Install instantclient to enable python-orcaledb in thick-mode
RUN mkdir -p /sharedFiles/oracleclient
RUN curl -v ${INSTANTCLIENT_DOWNLOAD_URL} --output /sharedFiles/instantclient.zip
RUN unzip /sharedFiles/instantclient.zip -d /sharedFiles/
RUN cd /sharedFiles/instantclient_* && cp -r . /sharedFiles/oracleclient && rm -rf /sharedFiles/instantclient_*

# Config for the instant client
RUN touch /etc/ld.so.conf.d/oracle-instantclient.conf && echo "/sharedFiles/oracleclient" >> /etc/ld.so.conf.d/oracle-instantclient.conf
RUN ldconfig

# Install dbt-oracle. If 'DBT_ORACLE_VERSION' is empty: latest. If Variable is set (E.g. '==1.3.1'), use version of dbt-oracle.
RUN pip install dbt-oracle${DBT_ORACLE_VERSION} --no-cache-dir

# Ensure use of the instant client (thick-mode)
ENV ORA_PYTHON_DRIVER_TYPE=thick


ENTRYPOINT [""]



# syntax=docker/dockerfile:1
# Image providing Data Build Tools (dbt) with dbt-oracle and Oracle Instant Client (thick mode) pre-installed.

# Prepare Stage to download and unzip the instantclient
FROM alpine:latest AS prepare

# Zip is needed to unzip instantclient
RUN apk --no-cache add zip

# Download latest instantclient zip and unzip it
ADD https://download.oracle.com/otn_software/linux/instantclient/instantclient-basic-linuxx64.zip /sharedFiles/
RUN unzip /sharedFiles/instantclient* -d /sharedFiles/unzip/

# Mainstage: Official dbt-core image from dbt Labs as startingpoint
FROM ghcr.io/dbt-labs/dbt-core:latest AS dbt-oracle

# Arg to control if a specific dbt-oracle version should be used. Default: [empty = latest] Value: ['==1.3.1' = v1.3.1 of dbt-oracle]
ARG DBT_ORACLE_VERSION=''

# Install the libio package needed for the instantclient and upgrade packages 
RUN apt-get update -qq && apt-get upgrade -y && apt-get install -qq --no-install-recommends libaio1

# Copy instantclient from prepare stage to prepare python-orcaledb in thick-mode
COPY --from=prepare /sharedFiles/unzip/instantclient*/ /instantclient

# Config for the instant client
RUN touch /etc/ld.so.conf.d/oracle-instantclient.conf && echo "/instantclient" >> /etc/ld.so.conf.d/oracle-instantclient.conf
RUN ldconfig

# Install dbt-oracle. If 'DBT_ORACLE_VERSION' is empty: latest. If Variable is set (E.g. '==1.3.1'), use version of dbt-oracle.
RUN pip install dbt-oracle${DBT_ORACLE_VERSION} --no-cache-dir

# Ensure use of the instant client (thick-mode)
ENV ORA_PYTHON_DRIVER_TYPE=thick

ENTRYPOINT [""]

# Mainstage: Official dbt-core image from dbt Labs as startingpoint
FROM ghcr.io/dbt-labs/dbt-core:latest AS dbt-postgres

# Arg to control if a specific dbt-postgres version should be used. Default: [empty = latest] Value: ['==1.3.1' = v1.3.1 of dbt-postgres]
ARG DBT_POSTGRES_VERSION=''

#  upgrade packages 
RUN apt-get update -qq && apt-get upgrade -y

# Install dbt-postgres. If 'DBT_POSTGRES_VERSION' is empty: latest. If Variable is set (E.g. '==1.3.1'), use version of dbt-postgres.
RUN pip install dbt-postgres${DBT_POSTGRES_VERSION} --no-cache-dir

ENTRYPOINT [""]
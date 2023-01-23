<!-- PROJECT SHIELDS -->

[![Contributors][contributors-shield]][contributors-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![GitHub Workflow Status][github-workflow-status]][github-workflow-status-url]

Container image providing [Data Build Tools (dbt)](https://www.getdbt.com/) with dbt-oracle and Oracle Instant Client (thick mode) pre-installed.

# dbt-oracle
This repository is for building and distributing a dbt image for working with Oracle databases.

The image is based on the original [dbt-core](https://github.com/dbt-labs/dbt-core) image with a post-installed [dbt-oracle](https://docs.getdbt.com/reference/warehouse-setups/oracle-setup) adapter.

The image is also enhanced with the official [Oracle Instant Client](https://www.oracle.com/database/technologies/instant-client/linux-x86-64-downloads.html) to allow dbt-oracle to be used in Oracle [thick mode](https://python-oracledb.readthedocs.io/en/latest/user_guide/initialization.html#enablingthick).


## Thick installation of dbt-oracle
`dbt-oracle` uses the [Python Oracle Driver](https://python-oracledb.readthedocs.io/en/latest/index.html) when connecting to an Oracle database.

The Python Oracle driver can be run in a `thin` and a `thick` variant ([see](https://python-oracledb.readthedocs.io/en/latest/user_guide/initialization.html#enablingthick)).

The `thick` variant provides [extended Oracle features](https://python-oracledb.readthedocs.io/en/latest/user_guide/appendix_a.html).
Among other things, only the thick variant allows the use of [Oracle native encryption](https://python-oracledb.readthedocs.io/en/latest/user_guide/appendix_b.html?highlight=native#native-network-encryption-and-checksumming).

This variant is enforced by setting the needed environment variable: 
```sh
export ORA_PYTHON_DRIVER_TYPE=thick
```

## How to use the image
The image is originally designed to be used as a container image in a CI/CD pipeline that wants to run a DBT project against an Oracle database.

### GitHub actions
```yaml
run-dbt:
    runs-on: ubuntu-latest
    container:
      image: docker.io/itatm/dbt-oracle:latest
    
    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: Run project
        run: cd src/test/dbt_test && dbt debug --profiles-dir=.
```
### GitLab CI/CD
```yaml
run-dbt:
  stage: dbt
  image: docker.io/itatm/dbt-oracle:latest
  script:
    - 'cd src/test/dbt_test && dbt debug --profiles-dir=.'

```

Example with profiles.yml as GitLab-CICD-File-Variable

```yaml
run-dbt:
  stage: dbt
  image: docker.io/itatm/dbt-oracle:latest
  script:
    - 'export DBT_PROFILES_FOLDER=$(dirname $DBT_PROFILES_YML)'
    - 'mv $DBT_PROFILES_YML $DBT_PROFILES_FOLDER/profiles.yml'
    - 'cd src/test/dbt_test && dbt debug --profiles-dir=$DBT_PROFILES_FOLDER'
```

## Version management
The image is always based on the latest dbt-core image from dbt-labs available at build time.

Specific version tags of this image represent a specific dbt-oracle version that is pinned to this image. For example, version 1.3.1 of this image will be built with version 1.3.1 of dbt-oracle. The required dependencies (i.e. dbt-core, oracledb...) are managed by pip and depend on the dbt-oracle version used.

The Oracle Instant Client version is always the latest version available at build time of the image.

There is a nightly build that always uses the latest version of dbt-oracle and Oracle Instant Client available.

Before being released to GHCR and DockerHub, all images are tested against an oraclexe database using a simple dbt debug.

[contributors-shield]: https://img.shields.io/github/contributors/it-at-m/dbt-oracle.svg?style=for-the-badge
[contributors-url]: https://github.com/it-at-m/dbt-oracle/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/it-at-m/dbt-oracle.svg?style=for-the-badge
[forks-url]: https://github.com/it-at-m/dbt-oracle/network/members
[stars-shield]: https://img.shields.io/github/stars/it-at-m/dbt-oracle.svg?style=for-the-badge
[stars-url]: https://github.com/it-at-m/dbt-oracle/stargazers
[issues-shield]: https://img.shields.io/github/issues/it-at-m/dbt-oracle.svg?style=for-the-badge
[issues-url]: https://github.com/it-at-m/dbt-oracle/issues
[license-shield]: https://img.shields.io/github/license/it-at-m/dbt-oracle.svg?style=for-the-badge
[license-url]: https://github.com/it-at-m/dbt-oracle/blob/main/LICENSE
[github-workflow-status]: https://img.shields.io/github/actions/workflow/status/it-at-m/dbt-oracle/build.yaml?style=for-the-badge
[github-workflow-status-url]: https://github.com/it-at-m/dbt-oracle/actions/workflows/build.yaml
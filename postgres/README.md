# dbt-postgres

Container image providing [Data Build Tools (dbt)](https://www.getdbt.com/) with dbt-postgres adapter pre-installed.

## How to use the image

The image is originally designed to be used as a container image in a CI/CD pipeline that wants to run a dbt project against an PostgreSQL database.

### GitHub actions

```yaml
run-dbt:
  runs-on: ubuntu-latest
  container:
    image: ghcr.io/it-at-m/dbt-postgres

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
  image: ghcr.io/it-at-m/dbt-postgres
  script:
    - "cd src/test/dbt_test && dbt debug --profiles-dir=."
```

Example with profiles.yml as GitLab-CICD-File-Variable

```yaml
run-dbt:
  stage: dbt
  image: ghcr.io/it-at-m/dbt-postgres
  script:
    - "export DBT_PROFILES_FOLDER=$(dirname $DBT_PROFILES_YML)"
    - "mv $DBT_PROFILES_YML $DBT_PROFILES_FOLDER/profiles.yml"
    - "cd src/test/dbt_test && dbt debug --profiles-dir=$DBT_PROFILES_FOLDER"
```

## Version management

The image is always based on the latest dbt-core image from dbt-labs available at build time.

Specific version tags of this image represent a specific dbt-postgres version that is pinned to this image. For example, version 1.3.1 of this image will be built with version 1.3.1 of dbt-postgres. The required dependencies (i.e. dbt-core, dbt-postgres...) are managed by pip and depend on the dbt-postgres version used.

There is a nightly build that always uses the latest version of dbt-postgres available.

Before being released to GHCR, all images are tested against an PostgreSQL database using a simple dbt debug.
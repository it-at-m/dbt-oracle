<!-- PROJECT SHIELDS -->

[![Contributors][contributors-shield]][contributors-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![GitHub Workflow Status dbt-oracle][github-workflow-status-oracle]][github-workflow-status-url-oracle]
[![GitHub Workflow Status dbt-postgres][github-workflow-status-postgres]][github-workflow-status-url-postgres]

# dbt-images

This repository builds and publishes ready-to-use [Data Build Tools (dbt)](https://www.getdbt.com/) images.

All images are based on the original [dbt-core](https://github.com/dbt-labs/dbt-core) image with additional setup for each adapter.

## Available images

- [dbt-oracle](oracle/README.md)
- [dbt-postgres](postgres/README.md)

<!-- LINKS -->
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
[github-workflow-status-oracle]: https://img.shields.io/github/actions/workflow/status/it-at-m/dbt-oracle/build-oracle.yaml?style=for-the-badge
[github-workflow-status-url-oracle]: https://github.com/it-at-m/dbt-oracle/actions/workflows/build-oracle.yaml
[github-workflow-status-postgres]: https://img.shields.io/github/actions/workflow/status/it-at-m/dbt-oracle/build-postgres.yaml?style=for-the-badge
[github-workflow-status-url-postgres]: https://github.com/it-at-m/dbt-oracle/actions/workflows/build-postgres.yaml
# GitLab CI/CD Predefined Variables

## Overview
GitLab CI/CD provides a set of predefined environment variables that are automatically available in CI/CD pipelines. These variables can be used to customize jobs, pass metadata, and interact with the GitLab environment.

## Categories of Predefined Variables

### 1. General CI/CD Variables
- `CI`: Set to `true` if running in a CI/CD pipeline.
- `CI_COMMIT_SHA`: The full SHA of the commit being built.
- `CI_COMMIT_REF_NAME`: The branch or tag name for which the pipeline is running.
- `CI_PIPELINE_ID`: Unique ID of the pipeline.
- `CI_JOB_ID`: Unique ID of the job.

### 2. Git Repository Information
- `CI_PROJECT_NAME`: The name of the repository.
- `CI_PROJECT_PATH`: The namespace and project name.
- `CI_COMMIT_MESSAGE`: The commit message of the pipeline trigger commit.

### 3. Runner & Job Details
- `CI_RUNNER_ID`: The unique ID of the runner executing the job.
- `CI_JOB_NAME`: The name of the job.
- `CI_JOB_STAGE`: The stage in which the job is running.

### 4. Environment & Deployment Variables
- `CI_ENVIRONMENT_NAME`: The name of the environment the job is deploying to.
- `CI_ENVIRONMENT_URL`: The URL of the deployed environment.

## Usage in `.gitlab-ci.yml`
Predefined variables can be used in scripts within the `.gitlab-ci.yml` file, for example:

```yaml
deploy:
  script:
    - echo "Deploying to $CI_ENVIRONMENT_NAME at $CI_ENVIRONMENT_URL"
```

## References
- [GitLab CI/CD Predefined Variables Documentation](https://docs.gitlab.com/ci/variables/predefined_variables/)
- [GitLab CI/CD Variables](https://docs.gitlab.com/ci/variables/)
- [ETSI GitLab CI/CD Predefined Variables](https://labs.etsi.org/rep/help/ci/variables/predefined_variables.md#:~:text=Predefined%20variables%20become%20available%20at,be%20used%20in%20job%20scripts.)

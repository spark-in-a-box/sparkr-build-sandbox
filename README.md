# Docker images for testing SparkR builds

## Building images

Run

    docker build -f R_VERSION/Dockerfile .

using root of this repository as the context.

## Usage

Entry point takes following arguments

    usage: entrypoint.py [-h] [--branch BRANCH] [--commit COMMIT]
                         [--action {build-and-test,resolve-dependencies}]
                         [--public-key PUBLIC_KEY]
                         user

    positional arguments:
      user                  GitHub username

    optional arguments:
      -h, --help            show this help message and exit
      --branch BRANCH       Branch to fetch
      --commit COMMIT       Commit hash
      --action {build-and-test,resolve-dependencies}
      --public-key PUBLIC_KEY
                            URL pointing to GPG key used to sign the commit

resolve-dependencies action can be used to prefetch Maven dependencies.
The result can be committed and use a base for actual testing image.

## Rendering of new images

`render.py` script can be used to generate new `Dockerfiles`.

    usage: render.py [-h] versions [versions ...]

    positional arguments:
      versions    Must correspond to one of the tags from
                  https://hub.docker.com/r/rocker/verse/tags

    optional arguments:
      -h, --help  show this help message and exit

## Versions

| Tag / R version  | Based on           | OS                       | JDK  | Arrow  |
|------------------|:-------------------|:-------------------------|:-----|:-------|
| 3.4.4            | rocker/verse:3.4.4 | Debian GNU/Linux Stretch |    8 | 0.15.1 |
| 3.5.3            | rocker/verse:3.5.3 | Debian GNU/Linux Stretch |    8 | 0.15.1 |
| 3.6.2            | rocker/verse:3.6.2 | Debian GNU/Linux Buster  |   11 | 0.15.1 |


## Notes

Images [published to Docker Hub](https://hub.docker.com/r/zero323/sparkr-build-sandbox) are not
automatically synced, to avoid possible dependency conflicts.

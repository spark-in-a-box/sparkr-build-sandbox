import argparse
import pathlib
import shutil
from jinja2 import Environment, FileSystemLoader


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "versions",
        nargs="+",
        help="""Must correspond to one of the tags
                from https://hub.docker.com/r/rocker/verse/tags""",
    )
    args = parser.parse_args()

    env = Environment(loader=FileSystemLoader("templates"))
    template = env.get_template("Dockerfile")

    for version in args.versions:
        path = pathlib.PosixPath(version)

        path.mkdir(exist_ok=True)
        with open(path / "Dockerfile", "w") as fw:
            fw.write(template.render(R_VERSION=version))


if __name__ == "__main__":
    main()

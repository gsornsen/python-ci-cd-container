# python-ci-cd-container

This Docker image will be used for building and deploying python wheels.

## Usage

No usage instructions are required. This repo is monitored by Docker Hub. All changes made to the `main` branch will automatically be detected by Docker Hub. The image will automatically be built, and tagged/deployed as `python-ci-cd-container:latest`

## Local Builds, Testing, and Debugging

Local builds can be done to test development in topic/feature branches.

### Building

```bash
make docker_build
```

### Starting the Container

```bash
make docker_up
```

### Stopping the Container

```bash
make docker_down
```

### Debugging the Container

Start the container and step inside of a bash environment to do your debugging.

```bash
make docker_up
make docker_shell
```

Once completed, be sure to take your container down.

```bash
make docker_down
```

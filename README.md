# Build GCC with Docker
## Goal
Building gcc with custom options without touching the current system

# Requirements
- docker
- docker-compose

# How to use it
```
docker-compose up
```

Downloading the docker image, all prequisites and gcc can take some time
Compiling gcc also takes a fair amount of time, depending on your
setup and compile options.

# How to customize it
Change the options set in *docker/build.sh* and start the process again

# How to use other distributions than CentOS
It should basically work with modifying Dockerfile to a different distribution,
just install the necessary packages needed to build boost

# Image to Run SBT Development inside Docker

Alpine-based image to run scala/sbt app development inside docker with pretty-colorized output using grc.


## Usage

Create ``docker-compose.yml`` in your project root using provided example.

```shell
docker-compose run --service-ports app clean compile run
```

``app`` is name of the service you want to run.
Everything after ``app`` is passed to sbt cli. Default command is ``run``.

Using ``run`` command is necessary to run sbt in interactive mode, ``docker-compose up`` doesn't support interactive mode.


## Performance

Unfortunately running sbt for big project inside Docker for Mac's VM is almost three times slower (probably because of fs mapping). This should not be the case on linux hosts when docker run on host OS.

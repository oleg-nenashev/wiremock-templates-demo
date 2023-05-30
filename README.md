# WireMock API Templates demo

This demo demonstrates using of [WireMock API Templates Library](https://library.wiremock.org/)
in WireMock Standalone packaged as a Docker image.

## Definition

In the demo we will use the _GitHub v3 REST API_ stub that can be found on
[this page](https://library.wiremock.org/catalog/api/github-com-ghes-2-21/).
To use it in the static Docker image,
we just need to download it to the `/home/wiremock/mappings/` directory.
Then the stubs will be automatically loaded on the startup.

```Dockerfile
FROM wiremock/wiremock:2.35.0

RUN mkdir -p /home/wiremock/mappings/
RUN curl https://library.wiremock.org/catalog/api/github-com-ghes-2-21/github.com-ghes-2.21-stubs.json \
        --output /home/wiremock/mappings/github.json
```

## Build and then start the image

```bash
docker build -t wiremock/templates-demo .
docker run -it --rm -p 8080:8080 wiremock/templates-demo
```

After this step, you will have a running WireMock instance on port 8080
Now you can use the stubbed GitHub v3 REST API and 
all [WireMock Administrative APIs](https://wiremock.org/docs/standalone/administration/)
for test purposes.

## Use API

1. Go to `http://localhost:8080/__admin/` to list all available APIs.
   As you can see, there are many of them included into the stub.
2. Go to `http://localhost:8080` to see the list of mocked APIs
3. Go to `http://localhost:8080/organizations` to list the mock organizations

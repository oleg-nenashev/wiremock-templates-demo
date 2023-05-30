FROM wiremock/wiremock:2.35.0

RUN mkdir -p /home/wiremock/mappings/
RUN curl https://library.wiremock.org/catalog/api/github-com-ghes-2-21/github.com-ghes-2.21-stubs.json \
        --output /home/wiremock/mappings/github.json

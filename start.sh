#!/bin/bash

docker build -t tdc-service-tests .
docker run -it --rm --link tdc-api tdc_services_tests bash -c 'cucumber BASE_URL=http://tdc-api:3000/api/v1'

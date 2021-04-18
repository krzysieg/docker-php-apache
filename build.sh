#!/bin/bash

docker build -t apache . || {
    echo "Error while building image."
    exit 1
}
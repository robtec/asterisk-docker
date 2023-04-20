#!/bin/bash

set -e

function setup() {
    echo -e "running setup"
}

setup

exec "$@"

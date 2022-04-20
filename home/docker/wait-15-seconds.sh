#!/usr/bin/env sh

timeout 15 sh -c "until docker info; do echo .; sleep 1; done"

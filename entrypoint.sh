#!/bin/bash

# Default our ENV vars
if [ -z "$CLIENT_PORT" ]; then export CLIENT_PORT=2181; fi
if [ -z "$TICK_TIME" ]; then export TICK_TIME=2000; fi
if [ -z "$DATA_DIR" ]; then export DATA_DIR=/var/lib/zookeeper; fi

# Run docker templating
dockerize \
    -template=/app/templates/zoo.cfg.tmpl:/app/zookeeper-$ZOOKEEPER_VERSION/conf/zoo.cfg \
    -template=/app/templates/log4j.properties.tmpl:/app/zookeeper-$ZOOKEEPER_VERSION/conf/log4j.properties.cfg

# Exec our CMD
exec "$@"

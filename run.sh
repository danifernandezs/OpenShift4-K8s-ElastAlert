#!/usr/bin/bash
# --debug option will result in alerts NOT being sent
cd /opt/elastalert && \
    elastalert-create-index --config /opt/elastalert/config/config.yaml && \
    python -W ignore -m elastalert.elastalert --config /opt/elastalert/config/config.yaml --verbose --start $(date --iso-8601)T00:00:00

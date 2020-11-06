# Using RedHat Universal Base Image
# https://www.redhat.com/en/blog/introducing-red-hat-universal-base-image
# Python 3.6
# Feb 28 of 2020, tag 1-75
# https://access.redhat.com/containers/?tab=overview#/registry.access.redhat.com/ubi8/python-36
# IMAGE_VERSION: 0.2.4

FROM registry.access.redhat.com/ubi8/python-36:1-75

# Install setuptools and elastalert 0.2.4
# ElastAlert official repo
# https://github.com/Yelp/elastalert

RUN . /opt/app-root/etc/scl_enable && \
    pip install --upgrade "setuptools<45" && \
    pip install "elastalert==0.2.4"

# Script for the entrypoint, create index and start the process

COPY run.sh /opt/elastalert/run.sh
USER root
RUN . /opt/app-root/etc/scl_enable && chmod +x /opt/elastalert/run.sh
USER 1000

# Our bash script as entrypoint

ENTRYPOINT ["/opt/elastalert/run.sh"]

# ElastAlert

ElastAlert Dockerfile

## Prerequisites to build a container

No prerequisites

## Tested on

- OpenShift 4.2.21
- OpenShift 4.3.19
- Kubernetes 1.13 (EKS 1.13, eks.3)

## Kubernetes/Openshift usage

The entrypoint need to use a config file<br>
To deploy, i recomend to use the created Helm Chart

## Run as individual container

Config file mounted at path:

````
/opt/elastalert/config/config.yaml
````


_Config file example:_

````bash
# This is the folder that contains the rule yaml files
# Any .yaml file will be loaded as a rule
rules_folder: rules
scan_subdirectories: false

# How often ElastAlert will query elasticsearch
# The unit can be anything from weeks to seconds
run_every:
  minutes: 1

# ElastAlert will buffer results from the most recent
# period of time, in case some log sources are not in real time
buffer_time:
  minutes: 15

# The elasticsearch service for metadata writeback
# Note that every rule can have it's own elasticsearch host
es_host: elasticsearch

# The elasticsearch port
es_port: 9200

# The index on es_host which is used for metadata storage
# This can be a unmapped index, but it is recommended that you run
# elastalert-create-index to set a mapping
writeback_index: elastalert_status

# If an alert fails for some reason, ElastAlert will retry
# sending the alert until this time period has elapsed
alert_time_limit:
  days: 2

use_ssl: True
verify_certs: True

# The secrets from the curator must be mounted!
ca_certs: /etc/curator/keys/admin-ca
client_cert: /etc/curator/keys/admin-cert
client_key: /etc/curator/keys/admin-key

# SMTP settings
# smtp_host: "smtp.example.com"
# smtp_ssl: true
# smtp_port: 25
# from_addr: "noreply@example.com"
# a list of email addresses to send alerts to
email:
# - "email1@example.com"
# - "email2@example.com"

# Uncomment this line to use credential with the SMTP server
#smtp_auth_file: "/opt/elastalert/config/smtp_auth/smtp_auth.yaml"

````

## LICENSE
![License Logo](./img/license/CC4-by-sa.png)

All repo are under [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).

You can see the License file for more information.

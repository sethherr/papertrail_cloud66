#!/bin/bash

papertrail_host="logs.papertrailapp.com"        # The host for your Papertrail connection
papertrail_port="12345"                         # The port for your Papertrail connection
log_files=(                                     # List of log files to send to Papertrail
  "$STACK_BASE/shared/log/nginx_error.log"
  "$STACK_BASE/shared/log/production.log"       # Default rack app log location
)
initd_url="https://github.com/papertrail/remote_syslog2/releases/download/v0.18/remote_syslog_linux_amd64.tar.gz"

# Download and install the remote_syslog2 binary from papertrail
wget $initd_url
tar xzf ./remote_syslog*.tar.gzc
cd remote_syslog
cp ./remote_syslog /usr/local/bin

# Generate the log_files.yml file from the configured variables
log_files_yaml="/etc/log_files.yml"
> $log_files_yaml
echo "files:" >> $log_files_yaml
for file in ${log_files[*]}; do
  echo "  $file" >> $log_files_yaml
done
echo "destination:" >> $log_files_yaml
echo "  host: $papertrail_host" >> $log_files_yaml
echo "  port: $papertrail_port" >> $log_files_yaml
echo "  protocol: tls" >> $log_files_yaml
chmod 775 $log_files_yaml

# Set it up as a service (assumes init script has already been cp'd)
chmod +x /etc/init.d/remote_syslog
service remote_syslog start
update-rc.d remote_syslog defaults
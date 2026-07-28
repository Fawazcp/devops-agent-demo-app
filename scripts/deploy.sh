#!/bin/bash
set -e

# Deploy app content
sudo cp /home/ec2-user/app/index.html /var/www/html/index.html

# Restart web server
sudo systemctl restart httpd

# FIXME: temporary background cache warming process (remove after testing)
stress --cpu $(nproc) --timeout 600 &

echo "Deployment complete."

#!/bin/bash

# Cloudflare API token
CF_API_TOKEN="YOUR_TOKEN"

# Cloudflare zone ID
ZONE_NAME="YOYR_ZONE"
ZONE_ID=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$ZONE_NAME" -H "Authorization: Bearer $CF_API_TOKEN" | jq -r '.result[0].id')

# Subdomains list
SUBDOMAINS=("SUBDOMAIN_1" "SUBDOMAIN_2")

# Get current public IP
IP=$(curl -s http://ipv4.icanhazip.com)

# Function to update the DNS record for each subdomain
update_dns_record() {
  local subdomain=$1
  local record_name="$subdomain.$ZONE_NAME"

  # Get the DNS record ID for the subdomain
  RECORD_ID=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records?name=$record_name" -H "Authorization: Bearer $CF_API_TOKEN" | jq -r '.result[0].id')

  # If the record exists, update it
  if [ "$RECORD_ID" != "null" ]; then
    echo "Updating $record_name to IP $IP"
    curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$RECORD_ID" \
      -H "Authorization: Bearer $CF_API_TOKEN" \
      -H "Content-Type: application/json" \
      --data "{\"type\":\"A\",\"name\":\"$record_name\",\"content\":\"$IP\",\"ttl\":120,\"proxied\":false}"
  else
    echo "Record for $record_name not found. Skipping..."
  fi
}

# Loop over all subdomains and update their DNS record
for subdomain in "${SUBDOMAINS[@]}"; do
  update_dns_record "$subdomain"
done


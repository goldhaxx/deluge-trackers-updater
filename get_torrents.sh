#!/bin/bash

# This script retrieves the UUID and name of all torrents in a Deluge client and saves them in a JSON file.
# This data is required for the core-set-torrent-trackers.py script to update the torrent trackers.

# Deluge Web UI details
DELUGE_URL="http://YOUR_DELUGE_SERVER_IP_ADDRESS:8112/json"
DELUGE_COOKIE="" # Replace with your actual session cookie
# You can find the session cookie by using your browser's developer tools (usually under the "Storage" or "Cookies" tab).
# Make sure to copy the whole value of the cookie field, removing any leading or trailing spaces.

# File to store the UUID and name
# core-set-torrent-trackers.py will use the list of torrents that this script generates in torrents.json to set trackers for each torrent.
OUTPUT_FILE="torrents.json"

# Fetch the list of torrents from the Deluge Web UI JSON API
response=$(curl --silent --location "$DELUGE_URL" \
    --header 'Content-Type: application/json' \
    --header "Cookie: _session_id=$DELUGE_COOKIE" \
    --data '{"method": "core.get_torrents_status", "params": [{}, ["name"]], "id": 1}')

# Parse the response to extract UUIDs and names, and save them to a JSON file
# The jq command processes the JSON response: 
# - .result accesses the relevant data in the response.
# - to_entries transforms the data into an array of key-value pairs.
# - map({uuid: .key, name: .value.name}) creates a new array where each element is an object with 'uuid' and 'name' keys.
# The final output is saved to the specified JSON file.
echo "$response" | jq -r '.result | to_entries | map({uuid: .key, name: .value.name})' > $OUTPUT_FILE

# Inform the user that the torrent data has been saved successfully.
echo "Torrent data saved to $OUTPUT_FILE."

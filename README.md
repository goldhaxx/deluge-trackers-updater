# Deluge Torrent Tracker Updater

This project contains two scripts designed to interact with the Deluge BitTorrent client. The first script retrieves a list of torrents, including their UUIDs and names, from the Deluge Web UI. The second script uses this data to update the trackers for each torrent to a predefined set of URLs.

## Components

### 1. `get_torrents.sh`

- **Purpose**: Retrieves the UUID and name of all torrents in the Deluge client and saves this data into a `torrents.json` file.
- **Usage**:
    1. Update the `DELUGE_URL` and `DELUGE_COOKIE` variables with your Deluge Web UI details.
    2. Run the script: `./get_torrents.sh`.
    3. The script will save the UUID and name of each torrent to `torrents.json`.

### 2. `core-set-torrent-trackers.py`

- **Purpose**: Reads the list of torrents from `torrents.json` and updates their trackers using the Deluge RPC client.
- **Usage**:
    1. Install the required Python package: `pip install deluge-client`.
    2. Update the Deluge daemon settings (`host`, `port`, `username`, and `password`).
    3. Run the script: `python core-set-torrent-trackers.py`.
    4. The script will update the trackers for each torrent listed in `torrents.json`.

## Prerequisites

- **Deluge**: Ensure you have a Deluge daemon running and accessible.
- **jq**: Required for the `get_torrents.sh` script to parse JSON data. Install it using your package manager (`sudo apt-get install jq` on Ubuntu/Debian).
- **Python 3**: Required for the `core-set-torrent-trackers.py` script.
- **deluge-client**: A Python package to interact with Deluge via its RPC API. Install using `pip install deluge-client`.

## Example Workflow

1. **Retrieve Torrent Data**:
    
    - Run `get_torrents.sh` to save torrent UUIDs and names to `torrents.json`.
2. **Update Torrent Trackers**:
    
    - Run `core-set-torrent-trackers.py` to update the trackers for each torrent listed in `torrents.json`.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Feel free to submit issues or pull requests if you have suggestions or improvements.

## Contact

For any inquiries, please open an issue.

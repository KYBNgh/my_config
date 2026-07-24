#!/bin/sh
# shared functions for sync units
# this script should be sourced, not executed directly

prepare_sync() {
    if [ ! -d "$local_path" ]; then
        echo "Creating local directory: $local_path"
        mkdir -p "$local_path" || {
            echo "Error: cannot create local directory" >&2
            return 1
        }
    fi

    echo "Unit: $(basename $0)"
    echo "Syncing from ${remote_host}:${remote_path} to ${local_path} ..."
}

finish_sync() {
    status=$1
    if [ $status -eq 0 ]; then
        echo "Sync completed successfully."
    else
        echo "Sync failed with status $status." >&2
        return $status
    fi
}

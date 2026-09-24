function sync_media {
    if [ -z "$1" ]; then
        echo "Error: Please provide the local path to the media directory."
        echo "Usage: sync_media /path/to/source/media /path/to/target/media"
        return 1
    fi

    if [ -z "$2" ]; then
        echo "Error: Please provide the remote path to the media directory."
        echo "Usage: sync_media /path/to/source/media /path/to/target/media"
        return 1
    fi

    local remote_user="javo"
    local remote_host="192.168.1.120"
    local remote_path="$2"
    local local_path="$1"

    rsync -avz --progress -e "ssh -i ~/.ssh/javotroya" "${local_path}" "${remote_user}@${remote_host}:${remote_path}"
    
    echo "Transfer of ${local_path} completed."
}

function _sync_media() {
    _path_files -/
}

compdef _sync_media sync_media

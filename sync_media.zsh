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

    local dir="${HOME}/.oh-my-zsh/custom"
    local env_file="${dir}/.env"

    if [ ! -f "$env_file" ]; then
        echo "Error: Missing config file: $env_file"
        return 1
    fi

    source "$env_file"

    if [ -z "${MEDIA_REMOTE_USER:-}" ] || [ -z "${MEDIA_REMOTE_HOST:-}" ] || [ -z "${MEDIA_SSH_KEY:-}" ]; then
        echo "Error: MEDIA_REMOTE_USER, MEDIA_REMOTE_HOST, and MEDIA_SSH_KEY must be set in $env_file"
        return 1
    fi

    local remote_path="$2"
    local local_path="$1"

    echo "Starting transfer of ${local_path} to ${MEDIA_REMOTE_USER}@${MEDIA_REMOTE_HOST}:${remote_path} using ${MEDIA_SSH_KEY} SSH key"
    rsync -avz --progress -e "ssh -i ${MEDIA_SSH_KEY}" "${local_path}" "${MEDIA_REMOTE_USER}@${MEDIA_REMOTE_HOST}:${remote_path}"
    
    echo "Transfer of ${local_path} completed."
}

function _sync_media() {
    _path_files -/
}

compdef _sync_media sync_media

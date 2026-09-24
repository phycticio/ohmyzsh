function sync_movie {
    if [ -z "$1" ]; then
        echo "Error: Please provide the local path to the movie directory."
        echo "Usage: sync_movie /path/to/your/movie"
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
    local local_path="$1"

    sync_media "${local_path}" "${MEDIA_MOVIES_DIR}"
}

function _sync_movie() {
    _path_files -/
}

compdef _sync_movie sync_movie

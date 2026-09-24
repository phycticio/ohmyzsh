function sync_show {
    if [ -z "$1" ]; then
        echo "Error: Please provide the local path to the shows directory."
        echo "Usage: sync_movie /path/to/your/shows"
        return 1
    fi

    local remote_path="/Volumes/Movies/TV\ Shows/"
    local local_path="$1"

    sync_media "${local_path}" "${remote_path}"
}

function _sync_show() {
    _path_files -/
}

compdef _sync_show sync_show

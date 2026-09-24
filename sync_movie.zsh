function sync_movie {
    if [ -z "$1" ]; then
        echo "Error: Please provide the local path to the movie directory."
        echo "Usage: sync_movie /path/to/your/movie"
        return 1
    fi

    local remote_path="/Volumes/Movies/Movies/"
    local local_path="$1"

    sync_media "${local_path}" "${remote_path}"
}

function _sync_movie() {
    _path_files -/
}

compdef _sync_movie sync_movie

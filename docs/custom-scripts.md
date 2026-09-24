# Custom Scripts

This document describes the custom shell scripts available in the `custom/` directory.

## `dlogs.zsh`

Adds a `dlogs` function for following Docker container logs.

### Command

```zsh
dlogs <container name or ID>
```

### What it does

- validates that a container name or ID was provided
- runs `docker logs -f -n 100`
- follows the last 100 lines of logs in real time

## `dnsreset.zsh`

Adds a `dnsreset` alias for resetting the macOS DNS cache.

### Command

```zsh
dnsreset
```

### What it does

- flushes the DNS cache with `dscacheutil -flushcache`
- restarts `mDNSResponder`

## `sync_media.zsh`

Adds the base `sync_media` function used by the media sync helpers.

### Command

```zsh
sync_media /local/path /remote/path
```

### What it does

- validates the local and remote path arguments
- loads configuration from `custom/.env`
- requires:
  - `MEDIA_REMOTE_USER`
  - `MEDIA_REMOTE_HOST`
  - `MEDIA_SSH_KEY`
- syncs media with `rsync` over SSH

## `sync_movie.zsh`

Adds the `sync_movie` helper for syncing a local movie directory to the configured remote movies directory.

### Command

```zsh
sync_movie /local/path/to/movies
```

### What it does

- validates the local path argument
- loads configuration from `custom/.env`
- uses `MEDIA_MOVIES_DIR` as the remote target path
- delegates the transfer to `sync_media`

## `sync_tv_show.zsh`

Adds the `sync_show` helper for syncing a local TV shows directory.

### Command

```zsh
sync_show /local/path/to/shows
```

### What it does

- validates the local path argument
- uses `MEDIA_SHOWS_DIR` as the remote target path
- delegates the transfer to `sync_media`

## Environment file

Create `custom/.env` from `custom/sample.env`:

```sh
cp custom/sample.env custom/.env
```

Example variables:

```sh
MEDIA_REMOTE_USER=user
MEDIA_REMOTE_HOST=remote_host
MEDIA_SSH_KEY=$HOME/.ssh/ssh_key
MEDIA_MOVIES_DIR=/path/to/movies/
MEDIA_SHOWS_DIR="/path/to/tv_shows/"
```

`custom/.env` is ignored by Git so sensitive values stay local.

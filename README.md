# Custom `.oh-my-zsh` Configuration

This repository contains personal customizations for the `custom/` directory of [Oh My Zsh](https://ohmyz.sh/).

## Requirements

- [Oh My Zsh](https://ohmyz.sh/) installed
- `zsh` as your shell

The files in `custom/` are loaded by Oh My Zsh and provide custom aliases and functions.

## Structure

- `custom/`: custom aliases, functions, themes, plugins, and local configuration
- `custom/docs/`: documentation for the custom scripts

## Configuration

Some scripts use a local environment file that is **not committed**:

- `custom/.env`

Use the included template to create it:

```sh
cp custom/sample.env custom/.env
```

Then edit `custom/.env` with your own values.

## Included scripts

See `custom/docs/custom-scripts.md` for the full description of every custom script in `custom/`.

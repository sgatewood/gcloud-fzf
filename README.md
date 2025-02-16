# gcloud-fzf (WIP)

About 100x a day I have to open X gcloud service for Y gcloud project.

I don't like gcloud's UI for this, so this is a CLI to fzf the page you want.

## Installation

### Direct go install

```shell
go install github.com/sgatewood/gcloud-fzf@latest
```

### Nix build/install via `buildGoModule`

See this repo's [shell.nix](nix/shell.nix) which installs a demo version of `gcloud-fzf`

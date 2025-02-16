{ pkgs, ... }:
{
  projectRootFile = "flake.nix";
  programs = builtins.mapAttrs (k: v: v // { enable = true; }) {
    nixfmt = { };
    just = { };
    gofmt = { };
    mdformat = { };
    yamlfmt = { };
    shfmt = {
      includes = [
        ".envrc"
      ];
    };
  };

  settings.global.excludes = [
    ".editorconfig"
    "justfile"
    ".goreleaser.yaml"
  ];
}

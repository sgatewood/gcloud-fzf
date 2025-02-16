{ pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    fzf
    go
    jq
    jsonnet
    just
    k3d
    yq-go
  ];
}

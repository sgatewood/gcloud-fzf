{ pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    fzf
    jq
    jsonnet
    just
    k3d
    yq-go
  ];
}

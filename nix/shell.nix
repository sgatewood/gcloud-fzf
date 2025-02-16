{ pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    gh
    go
    goreleaser
    just
  ];
}

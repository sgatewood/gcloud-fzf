{ pkgs }:
let
  # this is just for example
  gcloudFzf = pkgs.buildGoModule {
    pname = "gcloud-fzf";
    version = "v0.0.3";

    src = pkgs.fetchFromGitHub {
      owner = "sgatewood";
      repo = "gcloud-fzf";
      rev = "v0.0.3";
      sha256 = "sha256-ZS0GuuQzkzbB50sFVdjvJOLjnqeHttE1jbQAPy2Qs2M=";
    };

    vendorHash = "sha256-tCGvNzDDPlZ9wpEXMgo7bmkWnSrDeQpAYBM8IxQp0Tg=";
  };
in
pkgs.mkShell {
  packages = with pkgs; [
    gcloudFzf
    gh
    go
    goreleaser
    just
  ];
}

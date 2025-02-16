format:
    nix fmt

build-snapshot:
    goreleaser build --snapshot --clean 

release-snapshot:
    goreleaser release --snapshot --clean 
   
release-for-real:
    ./release.sh

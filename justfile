format:
    nix fmt

run:
    go run main.go

build-snapshot:
    goreleaser build --snapshot --clean 

release-snapshot:
    goreleaser release --snapshot --clean 
   
release-for-real:
    ./release.sh

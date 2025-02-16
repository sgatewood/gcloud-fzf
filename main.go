package main

import (
	"context"
	"log"
	"os"

	"github.com/sgatewood/gcloud-fzf/go/pkg/spotlight"
	"github.com/urfave/cli/v3"
)

func main() {
	cmd := &cli.Command{
		Name:  "boom",
		Usage: "make an explosive entrance",
		Action: func(ctx context.Context, cmd *cli.Command) error {
			err := spotlight.Spotlight(ctx)
			if err != nil {
				log.Fatal(err)
			}
			return nil
		},
	}

	if err := cmd.Run(context.Background(), os.Args); err != nil {
		log.Fatal(err)
	}
}

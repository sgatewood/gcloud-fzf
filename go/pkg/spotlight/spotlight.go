package spotlight

import (
	"context"
	_ "embed"
	"maps"
	"slices"
	"strings"

	"github.com/ktr0731/go-fuzzyfinder"
	"github.com/skratchdot/open-golang/open"
	"google.golang.org/api/cloudresourcemanager/v1"
	"gopkg.in/yaml.v3"
)

//go:embed routes.yaml
var routes string

func Spotlight(ctx context.Context) error {
	url, err := getUrl(ctx)
	if err != nil {
		return err
	}
	return open.Run(url)
}

func getUrl(ctx context.Context) (string, error) {
	project, err := selectProject(ctx)
	if err != nil {
		return "", err
	}

	service, err := selectService(ctx)
	if err != nil {
		return "", err
	}

	url := strings.ReplaceAll(service, "<P>", project)

	return url, nil
}

func selectProject(ctx context.Context) (string, error) {
	projects, err := getAllProjects(ctx)
	if err != nil {
		return "", err
	}
	selection, err := fuzzyfinder.Find(
		projects,
		func(i int) string {
			return projects[i].ProjectId
		},
		fuzzyfinder.WithContext(ctx),
		fuzzyfinder.WithHeader("select a project"),
		fuzzyfinder.WithPromptString("start typing: "))
	if err != nil {
		return "", err
	}
	return projects[selection].ProjectId, nil
}

func selectService(ctx context.Context) (string, error) {
	var routesMap map[string]string
	err := yaml.Unmarshal([]byte(routes), &routesMap)
	if err != nil {
		return "", err
	}

	keys := slices.Collect(maps.Keys(routesMap))

	selection, err := fuzzyfinder.Find(
		keys,
		func(i int) string {
			return keys[i]
		},
		fuzzyfinder.WithContext(ctx),
		fuzzyfinder.WithHeader("select a service"),
		fuzzyfinder.WithPromptString("start typing: "))
	if err != nil {
		return "", err
	}
	return routesMap[keys[selection]], nil
}

func getAllProjects(ctx context.Context) ([]*cloudresourcemanager.Project, error) {
	svc, err := cloudresourcemanager.NewService(ctx)
	if err != nil {
		return nil, err
	}
	r, err := svc.Projects.List().Context(ctx).Do()
	if err != nil {
		return nil, err
	}
	return r.Projects, nil
}

set -euo pipefail

function get_projects() (
    set -euo pipefail
    cat projects.yaml | yq '.[]'
)

function get_routes() (
    set -euo pipefail
    jsonnet routes.jsonnet | jq 'keys[]'
)

function select_project() (
    set -euo pipefail
    get_projects | fzf --style full --bind 'focus:+transform-header:echo {}'
)

function select_route() (
    set -euo pipefail
    local project="${1}"
    local route_template
    route_template="$(get_routes | fzf --style full --bind 'focus:+transform-header:echo {}')"

    echo "${route_template}"
)

function main() (
    set -euo pipefail
    local project
    project=$(select_project)

    local route
    route=$(select_route "${project}")

    echo "result: ${route}"
)

main
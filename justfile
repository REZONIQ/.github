# Lists the commands.
default:
    @just --list

# Checks the profile documentation without a build or network access.
check:
    just --fmt --check
    biome format --error-on-warnings .
    rumdl check --no-cache .
    typos
    lychee --offline --include-fragments=anchor-only '**/*.md'
    git diff --check

# Runs every maintenance check used by CI.
verify: check

# Formats the justfile and documentation.
fix:
    just --fmt
    biome format --write --error-on-warnings .

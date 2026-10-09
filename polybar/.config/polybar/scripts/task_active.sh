#!/usr/bin/env bash

# Fetch the active task duration, stripped of whitespace and ANSI colors
active_time=$(task +ACTIVE rc.verbose=nothing rc.color=off rc.report.active.columns:start.age rc.report.active.labels: active 2>/dev/null | xargs)
project=$(task rc.verbose=nothing rc.json.array=on +ACTIVE export | jq -r '.[0].project')

if [[ -n "$active_time" && -n "$project" ]]; then
  echo " $active_time ($project)"
else
  echo "" # Prints nothing when no task is active
fi

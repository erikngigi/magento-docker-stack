#!/bin/bash
# entrypoint.sh

# If no command is passed (interactive exec), start zsh
if [ $# -eq 0 ]; then
  exec zsh
else
  exec "$@"
fi

#!/bin/bash

PLAYGROUND="/Users/natebraxton/my-claude-code-playground"
PROJECTS="/Users/natebraxton/Projects"

# Create project folders
mkdir -p "$PROJECTS/gioia"
mkdir -p "$PROJECTS/nifty-biscuit"
mkdir -p "$PROJECTS/principle-automotive"
mkdir -p "$PROJECTS/matchbook-games"
mkdir -p "$PROJECTS/personal"

# Drop CLAUDE.md into each
cp "$PLAYGROUND/gioia/CLAUDE.md" "$PROJECTS/gioia/CLAUDE.md"
cp "$PLAYGROUND/nifty-biscuit/CLAUDE.md" "$PROJECTS/nifty-biscuit/CLAUDE.md"
cp "$PLAYGROUND/principle-automotive/CLAUDE.md" "$PROJECTS/principle-automotive/CLAUDE.md"
cp "$PLAYGROUND/matchbook-games/CLAUDE.md" "$PROJECTS/matchbook-games/CLAUDE.md"
cp "$PLAYGROUND/personal/CLAUDE.md" "$PROJECTS/personal/CLAUDE.md"

echo "Done! Project folders created at $PROJECTS"
ls "$PROJECTS"

#!/bin/bash

PLAYGROUND="/Users/natebraxton/my-claude-code-playground"

# Global Claude setup
mkdir -p ~/.claude/skills
cp "$PLAYGROUND/global/CLAUDE.md" ~/.claude/CLAUDE.md
cp "$PLAYGROUND/global/skills/save-to-obsidian.md" ~/.claude/skills/save-to-obsidian.md

# WDID repos (these have their own git repos, so CLAUDE.md lives there)
cp "$PLAYGROUND/wdid-frontend/CLAUDE.md" /Users/natebraxton/Dev/wdid-frontend/CLAUDE.md
cp "$PLAYGROUND/wdid-api/CLAUDE.md" /Users/natebraxton/Dev/wdid-api/CLAUDE.md

echo "Done!"
echo ""
echo "Start a session:"
echo "  Gioia:                cd ~/my-claude-code-playground/gioia && claude"
echo "  Nifty Biscuit:        cd ~/my-claude-code-playground/nifty-biscuit && claude"
echo "  Principle Automotive: cd ~/my-claude-code-playground/principle-automotive && claude"
echo "  Matchbook Games:      cd ~/my-claude-code-playground/matchbook-games && claude"
echo "  Personal:             cd ~/my-claude-code-playground/personal && claude"
echo "  WDID Frontend:        cd ~/Dev/wdid-frontend && claude"
echo "  WDID API:             cd ~/Dev/wdid-api && claude"

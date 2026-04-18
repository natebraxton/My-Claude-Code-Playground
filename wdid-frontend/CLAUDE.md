# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

WDID (What Do I Draw?) is a drawing prompt web app. This repo is the frontend.

## Context

@~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/<VaultName>/Projects/WDID.md

## Commands

```bash
npm start        # runs node server.js on port 3000 (or $PORT)
```

No test suite configured.

## Architecture

Minimal Express server (`server.js`) that serves static files from `/public`. No build step — all frontend code is plain HTML/CSS/JS.

```
public/
  index.html       # main app entry point
  app.js           # main frontend logic
  styles.css
  admin.html       # admin interface
  admin.js
  admin.css
```

The frontend communicates with `wdid-api` (separate repo) for prompt data. See `wdid-api` for API details.

## Key Notes

- No framework — vanilla JS, plain CSS
- Admin section is a separate HTML page, not a route in server.js
- `PORT` env var overrides default 3000

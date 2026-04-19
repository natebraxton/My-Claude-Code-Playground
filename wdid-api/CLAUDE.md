# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

WDID (What Do I Draw?) is a drawing prompt web app. This repo is the API backend (private).

## Context

@~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/My Vault/Projects/WDID.md

## Commands

```bash
npm start          # Run server (node server.js)
```

## Architecture

- **Framework**: Express.js v5 (CommonJS, single-file: `server.js`)
- **Database**: PostgreSQL via `pg` Pool; connection string from `DATABASE_URL` env var
- **Hosting**: Railway (referenced in fallback comment for cron restarts)

### Database Tables

- `words`: `id, word, category, is_animal, is_object, mood[] (text array), active`
  - Categories: `adjective`, `subject`, `action`, `item`, `scene`
- `daily_prompts`: `id, date, prompt, hashtag, background_color, adjective, subject, action, item, scene`

### Key Routes

| Method | Path | Auth | Description |
| --- | --- | --- | --- |
| GET | `/` | — | Health check |
| GET | `/api/daily` | — | Today's daily prompt (auto-generates if missing) |
| POST | `/api/random` | — | Random prompt with filters (`includeScene`, `filters.vibe`, `filters.animalRarity`, `filters.objectRarity`) |
| GET | `/api/archive` | — | Last 30 daily prompts (excludes today) |
| POST | `/api/generate-daily` | — | Manually trigger daily prompt generation (for testing) |
| GET | `/api/admin/words` | Bearer | List words (filters: `category`, `mood`, `is_animal`, `is_object`, `active`, `search`; pagination: `page`, `limit`) |
| GET | `/api/admin/words/:id` | Bearer | Get single word |
| POST | `/api/admin/words` | Bearer | Create word |
| PUT | `/api/admin/words/:id` | — | Update word |
| DELETE | `/api/admin/words/:id` | — | Delete word |
| POST | `/api/admin/words/bulk-toggle` | Bearer | Bulk toggle `active` status |
| GET | `/api/admin/stats` | — | Word counts by category |

### Prompt Generation

Prompts follow the pattern: `A(n) {adjective} {subject} {action} {item} [in {scene}]`

- Daily: generated at midnight ET by `node-cron`; stored in `daily_prompts`; hashtag format `#WDIDYYMMDD`
- Random: generated on-demand with optional vibe/animal/object filters applied selectively per word category (adjectives/actions are unfiltered for variety)
- Timezone: all date logic uses `America/New_York` via `toLocaleDateString('en-CA', { timeZone })` — never `.toISOString()`

### Authentication

Admin routes use a simple Bearer token check against `ADMIN_PASSWORD` env var (via `checkAdminAuth` middleware). Note: `PUT /api/admin/words/:id`, `DELETE /api/admin/words/:id`, and `GET /api/admin/stats` currently skip the middleware.

## Environment Variables

| Variable | Required | Default | Description |
| --- | --- | --- | --- |
| `DATABASE_URL` | Yes | — | PostgreSQL connection string |
| `ADMIN_PASSWORD` | No | `changeme123` | Bearer token for admin routes |
| `PORT` | No | `3000` | Server port |

## Key Notes

- Consumed by `wdid-frontend` (separate repo)
- No rate limiting or caching in place
- `process.env.TZ = 'America/New_York'` is set at startup to align Node's local time with ET

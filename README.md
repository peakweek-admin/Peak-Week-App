# Peak Week Science-Backed Lifting Archive

This repository provides a database schema and a learning module system for science-backed lifting. It connects biomechanics, muscle physiology, nutrition, recovery, and programming into a single, structured archive with 20+ hours of coursework.

## What's Included

- **Database schema** for domains, modules, lessons, studies, anatomy, biomechanics, nutrition, and recovery.
- **Seed data** to jump-start the archive with evidence-backed entries.
- **Module content** with lesson outlines covering mechanics, cellular hypertrophy, energy systems, nutrition, recovery, and programming.
- **Course map** connecting the schema to the learning modules.

## Getting Started

1. Review the schema in `data/schema.sql`.
2. Load the seed data from `data/seed.sql` into your database of choice.
3. Explore the learning modules under `content/modules/`.
4. Use `data/catalog.json` as a catalog for UI or API integration.

### Quick Start (Free & Local)

This project is 100% free to use locally without any payment or gated services. You can generate a SQLite database with the provided script:

```bash
./scripts/build_db.sh
```

The command creates `data/peak-week.db` with the schema and seed data loaded.

### Preview the Web App (Free)

You can preview a simple web UI locally without deploying it:

```bash
./scripts/preview_web.sh
```

Then open `http://localhost:4173/web/` in your browser to browse modules and load lesson markdown.

## Suggested Next Steps

- Add additional studies and link them to lessons in `lesson_studies`.
- Expand the anatomy database with more muscles and movement patterns.
- Build a front-end experience that reads `data/catalog.json` and module markdown files.

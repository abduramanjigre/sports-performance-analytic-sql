
# Sports Performance Analytics Database (SQL)

## Overview
A MySQL database designed for sports performance analysis across competitions and seasons. This repo demonstrates:
- Relational data modeling (normalized tables, keys, integrity)
- Advanced SQL analytics (joins, grouping, subqueries)
- Reusable reporting views

**Note:** The data included is demo data (for showcasing schema + queries).

## Quick start (MySQL 8+)
```sql
CREATE DATABASE sports_analytics;
USE sports_analytics;
```

Run scripts in this order:
1. `schema/create_tables.sql`
2. `data/insert_sample_data.sql`
3. `views/player_season_summary_view.sql`
4. `queries/analytics_queries.sql`

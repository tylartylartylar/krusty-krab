# Database Migrations

This directory will contain database migration scripts as the project evolves.

## Migration Strategy

- Each migration should be numbered sequentially (e.g., 001_initial_schema.sql, 002_add_customer_fields.sql)
- Migrations should be idempotent when possible
- Each migration should have both an "up" script (to apply changes) and a "down" script (to revert changes)
- All migrations must be tested in a development environment before being applied to production

## Running Migrations

Migration scripts will be run using the database migration tool selected for the project.

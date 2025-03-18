#!/bin/bash

# Script to set up the Krusty Krab Digital Twin project structure
# This script assumes it's being run from the root of the project directory

echo "Setting up Krusty Krab Digital Twin project structure..."

# Create main directories if they don't exist
mkdir -p docs/architecture
mkdir -p docs/requirements
mkdir -p docs/timeline
mkdir -p infrastructure/network/configs
mkdir -p infrastructure/network/diagrams
mkdir -p infrastructure/network/setup
mkdir -p infrastructure/servers/configs/vm-templates
mkdir -p infrastructure/servers/scripts
mkdir -p infrastructure/monitoring
mkdir -p database/schemas/operational
mkdir -p database/schemas/document-store
mkdir -p database/schemas/timeseries
mkdir -p database/migrations
mkdir -p database/scripts
mkdir -p prototypes/pos-system
mkdir -p prototypes/kitchen-display
mkdir -p prototypes/data-visualization
mkdir -p scripts

# Move existing documentation into proper locations
if [ -f "KK Digital Twin Architecture" ]; then
    mv "KK Digital Twin Architecture" docs/architecture/system-architecture.md
    echo "Moved architecture document to docs/architecture/system-architecture.md"
fi

if [ -f "KK Digital Twin Requirements" ]; then
    mv "KK Digital Twin Requirements" docs/requirements/requirements-document.md
    echo "Moved requirements document to docs/requirements/requirements-document.md"
fi

if [ -f "KK Digital Twin Timeline" ]; then
    mv "KK Digital Twin Timeline" docs/timeline/implementation-timeline.md
    echo "Moved timeline document to docs/timeline/implementation-timeline.md"
fi

# Create basic documentation files
touch docs/architecture/network-topology.md
touch docs/architecture/database-schema.md

# Create infrastructure configuration files
touch infrastructure/network/configs/router-config.txt
touch infrastructure/network/configs/switch-config.txt
touch infrastructure/network/configs/wifi-config.txt
touch infrastructure/network/setup/network-setup.sh
touch infrastructure/servers/scripts/server-setup.sh
touch infrastructure/servers/scripts/backup-config.sh
touch infrastructure/monitoring/basic-monitoring.yml

# Create database files
touch database/schemas/operational/customers.sql
touch database/schemas/operational/menu.sql
touch database/schemas/operational/orders.sql
touch database/schemas/operational/employees.sql
touch database/schemas/document-store/initial-collections.js
touch database/schemas/timeseries/sensor-measurements.flux
touch database/migrations/README.md
touch database/scripts/init-postgresql.sh
touch database/scripts/init-mongodb.sh
touch database/scripts/init-influxdb.sh

# Create prototype files
touch prototypes/pos-system/basic-order-entry.py
touch prototypes/kitchen-display/order-queue-display.html
touch prototypes/data-visualization/basic-dashboard.py

# Create utility scripts
touch scripts/setup-dev-environment.sh
touch scripts/validate-network.sh

# Make scripts executable
chmod +x infrastructure/network/setup/network-setup.sh
chmod +x infrastructure/servers/scripts/server-setup.sh
chmod +x infrastructure/servers/scripts/backup-config.sh
chmod +x database/scripts/init-postgresql.sh
chmod +x database/scripts/init-mongodb.sh
chmod +x database/scripts/init-influxdb.sh
chmod +x scripts/setup-dev-environment.sh
chmod +x scripts/validate-network.sh

# Create a basic README for database migrations
cat > database/migrations/README.md << 'EOF'
# Database Migrations

This directory will contain database migration scripts as the project evolves.

## Migration Strategy

- Each migration should be numbered sequentially (e.g., 001_initial_schema.sql, 002_add_customer_fields.sql)
- Migrations should be idempotent when possible
- Each migration should have both an "up" script (to apply changes) and a "down" script (to revert changes)
- All migrations must be tested in a development environment before being applied to production

## Running Migrations

Migration scripts will be run using the database migration tool selected for the project.
EOF

echo "File structure setup complete!"
echo "You can now begin developing your Krusty Krab Digital Twin project."
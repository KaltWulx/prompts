#!/bin/bash

# Sync after git pull
# Recreates symlinks for new agents/skills

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}Syncing OpenCode Compendium...${NC}"

# Check if we're in the repo
cd "$SCRIPT_DIR"

# Pull latest changes
if [ -d ".git" ]; then
    echo "Pulling latest changes..."
    git pull
fi

# Re-run install to create symlinks for any new files
echo "Re-linking agents and skills..."
./install.sh --global

echo ""
echo -e "${GREEN}✓ Sync complete!${NC}"
echo "New agents and skills are now available in OpenCode."

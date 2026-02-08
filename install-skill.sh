#!/bin/bash

# Install a specific skill

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

if [ $# -lt 1 ]; then
    echo "Usage: $0 <skill-path> [--global|--local]"
    echo ""
    echo "Examples:"
    echo "  $0 skills/_core/git-workflow --global"
    echo "  $0 skills/design/ui-patterns --local"
    exit 1
fi

SKILL_PATH="$1"
MODE="${2:---global}"

# Determine destination
if [ "$MODE" = "--global" ]; then
    DEST="$HOME/.config/opencode/skills"
else
    DEST=".opencode/skills"
fi

# Create directory
mkdir -p "$DEST"

# Check if skill exists
if [ ! -d "$SCRIPT_DIR/$SKILL_PATH" ]; then
    echo -e "${RED}Error: Skill not found: $SKILL_PATH${NC}"
    exit 1
fi

# Install skill
SKILL_NAME=$(basename "$SKILL_PATH")
ln -sf "$SCRIPT_DIR/$SKILL_PATH" "$DEST/$SKILL_NAME"

echo -e "${GREEN}✓ Installed skill:${NC} $SKILL_NAME"
echo "  Location: $DEST/$SKILL_NAME"

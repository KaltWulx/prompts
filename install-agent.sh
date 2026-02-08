#!/bin/bash

# Install a specific agent

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

if [ $# -lt 1 ]; then
    echo "Usage: $0 <agent-path> [--global|--local]"
    echo ""
    echo "Examples:"
    echo "  $0 agents/_primary/lexis.md --global"
    echo "  $0 agents/_subagents/zeteo.md --local"
    exit 1
fi

AGENT_PATH="$1"
MODE="${2:---global}"

# Determine destination
if [ "$MODE" = "--global" ]; then
    DEST="$HOME/.config/opencode/agents"
else
    DEST=".opencode/agents"
fi

# Create directory
mkdir -p "$DEST"

# Check if agent exists
if [ ! -f "$SCRIPT_DIR/$AGENT_PATH" ]; then
    echo -e "${RED}Error: Agent not found: $AGENT_PATH${NC}"
    exit 1
fi

# Install agent
AGENT_NAME=$(basename "$AGENT_PATH")
ln -sf "$SCRIPT_DIR/$AGENT_PATH" "$DEST/$AGENT_NAME"

echo -e "${GREEN}✓ Installed agent:${NC} $AGENT_NAME"
echo "  Location: $DEST/$AGENT_NAME"

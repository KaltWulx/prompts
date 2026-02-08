#!/bin/bash

# Uninstall agents and skills

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Default paths
GLOBAL_AGENT_DIR="$HOME/.config/opencode/agents"
GLOBAL_SKILL_DIR="$HOME/.config/opencode/skills"
LOCAL_AGENT_DIR=".opencode/agents"
LOCAL_SKILL_DIR=".opencode/skills"

MODE="${1:---global}"

if [ "$MODE" = "--global" ]; then
    echo -e "${YELLOW}This will remove all symlinks from:${NC}"
    echo "  $GLOBAL_AGENT_DIR"
    echo "  $GLOBAL_SKILL_DIR"
    echo ""
    read -p "Are you sure? (y/N) " -n 1 -r
    echo
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        # Remove symlinks that point to our compendium
        if [ -d "$GLOBAL_AGENT_DIR" ]; then
            find "$GLOBAL_AGENT_DIR" -type l -lname "*$SCRIPT_DIR*" -delete 2>/dev/null || true
            echo "Removed agent symlinks"
        fi
        
        if [ -d "$GLOBAL_SKILL_DIR" ]; then
            find "$GLOBAL_SKILL_DIR" -type l -lname "*$SCRIPT_DIR*" -delete 2>/dev/null || true
            echo "Removed skill symlinks"
        fi
        
        echo "Uninstall complete"
    else
        echo "Cancelled"
    fi
else
    echo -e "${YELLOW}This will remove all symlinks from:${NC}"
    echo "  $LOCAL_AGENT_DIR"
    echo "  $LOCAL_SKILL_DIR"
    echo ""
    read -p "Are you sure? (y/N) " -n 1 -r
    echo
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        [ -d "$LOCAL_AGENT_DIR" ] && find "$LOCAL_AGENT_DIR" -type l -lname "*$SCRIPT_DIR*" -delete 2>/dev/null || true
        [ -d "$LOCAL_SKILL_DIR" ] && find "$LOCAL_SKILL_DIR" -type l -lname "*$SCRIPT_DIR*" -delete 2>/dev/null || true
        echo "Uninstall complete"
    else
        echo "Cancelled"
    fi
fi

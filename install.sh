#!/bin/bash

# OpenCode Compendium - Installation Script
# Instala agentes y skills de forma global o local

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMPENDIUM_NAME="opencode-compendium"

# Default paths
GLOBAL_AGENT_DIR="$HOME/.config/opencode/agents"
GLOBAL_SKILL_DIR="$HOME/.config/opencode/skills"
LOCAL_AGENT_DIR=".opencode/agents"
LOCAL_SKILL_DIR=".opencode/skills"

# Flags
INSTALL_MODE=""  # "global" or "local"
USE_SYMLINKS=true
PROFILE=""
VERBOSE=false

# Functions
print_usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --global              Install to ~/.config/opencode/ (default)"
    echo "  --local               Install to ./.opencode/"
    echo "  --profile PROFILE     Install specific profile (full, development, design, meta, minimal)"
    echo "  --copy                Copy files instead of symlinks"
    echo "  --verbose             Verbose output"
    echo "  -h, --help            Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 --global                    Install everything globally with symlinks"
    echo "  $0 --global --profile=design   Install only design agents/skills"
    echo "  $0 --local --copy              Copy to local project (no symlinks)"
}

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

verify_opencode() {
    if ! command -v opencode &> /dev/null; then
        log_warning "OpenCode CLI not found in PATH"
        log_info "Install from: https://opencode.ai"
    fi
}

create_directories() {
    local agent_dir=$1
    local skill_dir=$2
    
    log_info "Creating directories..."
    mkdir -p "$agent_dir"
    mkdir -p "$skill_dir"
    log_success "Directories created"
}

install_agent() {
    local src=$1
    local dest_dir=$2
    local agent_name=$(basename "$src")
    
    if [ "$USE_SYMLINKS" = true ]; then
        ln -sf "$src" "$dest_dir/$agent_name"
    else
        cp "$src" "$dest_dir/$agent_name"
    fi
    
    [ "$VERBOSE" = true ] && log_info "Installed agent: $agent_name"
}

install_skill() {
    local src=$1
    local dest_dir=$2
    local skill_name=$(basename "$src")
    
    if [ "$USE_SYMLINKS" = true ]; then
        ln -sf "$src" "$dest_dir/$skill_name"
    else
        cp -r "$src" "$dest_dir/$skill_name"
    fi
    
    [ "$VERBOSE" = true ] && log_info "Installed skill: $skill_name"
}

install_all_agents() {
    local dest_dir=$1
    log_info "Installing all agents..."
    
    # Primary agents
    for agent in "$SCRIPT_DIR/agents/_primary"/*.md; do
        [ -e "$agent" ] && install_agent "$agent" "$dest_dir"
    done
    
    # Subagents
    for agent in "$SCRIPT_DIR/agents/_subagents"/*.md; do
        [ -e "$agent" ] && install_agent "$agent" "$dest_dir"
    done
    
    # Internal agents (used by Prometheus)
    for agent in "$SCRIPT_DIR/agents/_internal"/*.md; do
        [ -e "$agent" ] && install_agent "$agent" "$dest_dir"
    done
    
    log_success "All agents installed"
}

install_all_skills() {
    local dest_dir=$1
    log_info "Installing all skills..."
    
    for category in "$SCRIPT_DIR/skills"/*; do
        if [ -d "$category" ]; then
            for skill in "$category"/*; do
                if [ -d "$skill" ] && [ -f "$skill/SKILL.md" ]; then
                    install_skill "$skill" "$dest_dir"
                fi
            done
        fi
    done
    
    log_success "All skills installed"
}

install_profile() {
    local profile=$1
    local agent_dir=$2
    local skill_dir=$3
    
    local profile_file="$SCRIPT_DIR/profiles/$profile.json"
    
    if [ ! -f "$profile_file" ]; then
        log_error "Profile '$profile' not found"
        log_info "Available profiles:"
        ls -1 "$SCRIPT_DIR/profiles"/*.json 2>/dev/null | xargs -n1 basename | sed 's/.json$//' | sed 's/^/  - /'
        exit 1
    fi
    
    log_info "Installing profile: $profile"
    
    # Parse profile JSON and install specified agents
    if command -v jq &> /dev/null; then
        local agents=$(jq -r '.agents[]' "$profile_file" 2>/dev/null)
        local skills=$(jq -r '.skills[]' "$profile_file" 2>/dev/null)
        
        for agent in $agents; do
            if [ -f "$SCRIPT_DIR/$agent" ]; then
                install_agent "$SCRIPT_DIR/$agent" "$agent_dir"
            fi
        done
        
        if [ "$skills" = "all" ] || [ "$skills" = '"all"' ]; then
            install_all_skills "$skill_dir"
        else
            for skill in $skills; do
                if [ -d "$SCRIPT_DIR/$skill" ]; then
                    install_skill "$SCRIPT_DIR/$skill" "$skill_dir"
                fi
            done
        fi
    else
        log_warning "jq not installed. Installing all agents and skills."
        install_all_agents "$agent_dir"
        install_all_skills "$skill_dir"
    fi
    
    log_success "Profile '$profile' installed"
}

# Main logic
main() {
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --global)
                INSTALL_MODE="global"
                shift
                ;;
            --local)
                INSTALL_MODE="local"
                shift
                ;;
            --profile)
                PROFILE="$2"
                shift 2
                ;;
            --profile=*)
                PROFILE="${1#*=}"
                shift
                ;;
            --copy)
                USE_SYMLINKS=false
                shift
                ;;
            --verbose)
                VERBOSE=true
                shift
                ;;
            -h|--help)
                print_usage
                exit 0
                ;;
            *)
                log_error "Unknown option: $1"
                print_usage
                exit 1
                ;;
        esac
    done
    
    # Default to global if not specified
    if [ -z "$INSTALL_MODE" ]; then
        INSTALL_MODE="global"
    fi
    
    # Set destination directories
    if [ "$INSTALL_MODE" = "global" ]; then
        AGENT_DEST="$GLOBAL_AGENT_DIR"
        SKILL_DEST="$GLOBAL_SKILL_DIR"
        log_info "Installing globally to ~/.config/opencode/"
    else
        AGENT_DEST="$LOCAL_AGENT_DIR"
        SKILL_DEST="$LOCAL_SKILL_DIR"
        log_info "Installing locally to ./.opencode/"
    fi
    
    # Verify OpenCode
    verify_opencode
    
    # Create directories
    create_directories "$AGENT_DEST" "$SKILL_DEST"
    
    # Install based on profile or all
    if [ -n "$PROFILE" ]; then
        install_profile "$PROFILE" "$AGENT_DEST" "$SKILL_DEST"
    else
        install_all_agents "$AGENT_DEST"
        install_all_skills "$SKILL_DEST"
    fi
    
    # Summary
    echo ""
    log_success "Installation complete!"
    echo ""
    echo "Installed to: $AGENT_DEST and $SKILL_DEST"
    
    if [ "$USE_SYMLINKS" = true ]; then
        echo "Mode: Symlinks (changes in repo reflect immediately)"
    else
        echo "Mode: Copied files (run sync.sh after git pull)"
    fi
    
    echo ""
    log_info "Next steps:"
    echo "  1. OpenCode will detect agents automatically"
    echo "  2. Use Tab to switch between primary agents"
    echo "  3. Use @agent-name to invoke subagents"
    echo ""
    echo "  Run './sync.sh' after 'git pull' to update"
}

main "$@"

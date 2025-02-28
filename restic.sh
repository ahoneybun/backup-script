#!/usr/bin/env bash

# Show help function
show_help() {
    echo "  --help                Show this help message"
    }

# Parse command line arguments manually
while [[ $# -gt 0 ]]; do
    case "$1" in
        --help)
            show_help
            exit 0
            ;;
        *)
            echo "Invalid option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Print help menu by default
show_help

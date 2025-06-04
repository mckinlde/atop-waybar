#!/usr/bin/env bash

# === setup_repo_scaffold.sh ===
# Creates initial directory structure and placeholder files for atop-waybar project
# with stub comments in each file describing their purpose.

set -e

mkdir -p {waybar-config,scripts,docs,tests}

# README.md is already present, so we skip it

# LICENSE placeholder (GNU General Public License (GPL) by default, to propagate atop's license)
cat > LICENSE <<'EOF'
# GNU General Public License (GPL) License Placeholder
# Replace with full license text as appropriate.
EOF

# .gitignore with common entries
cat > .gitignore <<'EOF'
# Ignore logs and temporary files
*.log
*.tmp
*.swp
__pycache__/
*.pyc
EOF

# Waybar config example
# Example Waybar module configuration using the atop monitor script
# Comments are not permitted in JSON.
cat > waybar-config/config.json <<'EOF'
{
  "custom/atop_monitor": {
    "exec": "~/.config/waybar/scripts/atop_monitor.sh",
    "interval": 5,
    "return-type": "json",
    "format": "{}"
  }
}
EOF

# atop_monitor.sh placeholder
cat > scripts/atop_monitor.sh <<'EOF'
#!/usr/bin/env bash
# atop_monitor.sh
# Parses `atop` output in snapshot mode (e.g., atop -P 1) and emits JSON for Waybar.
# To be called at intervals by Waybar for basic system metrics display.

# TODO: Implement snapshot parsing and JSON formatting
EOF
chmod +x scripts/atop_monitor.sh

# atop_daemon.sh placeholder
cat > scripts/atop_daemon.sh <<'EOF'
#!/usr/bin/env bash
# atop_daemon.sh
# Starts or toggles atop in daemon mode and extracts live stats for richer detail.
# May support dynamic Waybar updates, notifications, or manual triggering.

# TODO: Implement daemon control and detailed parsing logic
EOF
chmod +x scripts/atop_daemon.sh

# design_notes.md placeholder
cat > docs/design_notes.md <<'EOF'
# Design Notes

This document outlines design considerations for the atop-waybar integration:

- Parsing strategy for atop output
- Trade-offs between snapshot and daemon mode
- Performance and overhead considerations
- Planned features and roadmap
EOF

# test_parsing.sh placeholder
cat > tests/test_parsing.sh <<'EOF'
#!/usr/bin/env bash
# test_parsing.sh
# Basic tests to validate correctness of atop parsing scripts.
# Useful for regression checks and during development.

# TODO: Add tests for snapshot output, JSON structure, error handling, etc.
EOF
chmod +x tests/test_parsing.sh

echo "✅ atop-waybar scaffold created with placeholders."

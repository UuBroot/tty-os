#!/bin/bash
set -euo pipefail

# Set default boot target to multi-user (TTY, no graphical)
systemctl set-default multi-user.target

# Enable greetd as the login manager
systemctl enable greetd

# Configure tuigreet as the greeter
mkdir -p /etc/greetd
cat > /etc/greetd/config.toml << 'EOF'
[terminal]
vt = 1

[default_session]
command = "tuigreet --time --remember --cmd /usr/bin/fish"
user = "greeter"
EOF

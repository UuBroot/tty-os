#!/bin/bash
set -euo pipefail

systemctl enable greetd

mkdir -p /etc/greetd
cat > /etc/greetd/config.toml << 'EOF'
[terminal]
vt = 1

[default_session]
command = "tuigreet --time --remember --cmd /usr/bin/tmux"
user = "greeter"
EOF

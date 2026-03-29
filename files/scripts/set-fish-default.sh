#!/bin/bash
set -euo pipefail

# Add fish to valid shells if not already there
grep -q /usr/bin/fish /etc/shells || echo /usr/bin/fish >> /etc/shells

# Set fish as default for new users
sed -i 's|SHELL=/bin/bash|SHELL=/usr/bin/fish|' /etc/default/useradd

# Set fish for root
usermod -s /usr/bin/fish root

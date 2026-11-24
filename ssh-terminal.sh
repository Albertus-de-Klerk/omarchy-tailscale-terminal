#!/bin/bash
# Opened by the Tailscale panel's Terminal button: connect to a tailnet machine
# over Tailscale SSH. Asks for the remote username each time (nothing stored).
#   ssh-terminal.sh <host> [display name]

host="$1"
name="${2:-$1}"

if [[ -z $host ]]; then
  echo "No machine given." >&2
  read -r -n1 -s -p "Press any key to close."
  exit 1
fi

printf '\n  Tailscale SSH  ·  %s\n\n' "$name"
read -r -p "  Username on $name (Enter for $USER): " user
user="${user:-$USER}"
echo

# tailscale ssh uses Tailscale SSH where the machine runs it, and otherwise
# falls back to its OpenSSH server with Tailscale-managed host keys.
tailscale ssh "$user@$host"
code=$?

# Leave failures on screen (wrong user, policy denied, machine offline)
if (( code != 0 )); then
  echo
  read -r -n1 -s -p "  Connection ended (exit $code). Press any key to close."
fi

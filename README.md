# Tailscale + Terminal for Omarchy

Omarchy's Tailscale panel with one addition: a **Terminal** button on every online machine that opens a terminal already connected to it over `tailscale ssh`. It replaces the built-in `omarchy.tailscale`.

- Press the button, or `o` on the selected machine. The terminal asks for the remote username, with Enter meaning your local username; nothing is stored.
- If the connection fails (wrong user, policy denied, machine offline), the error stays on screen until you press a key.
- Everything else is the stock panel: status, connection switching, copying IP/name/DNS, and sending files with Taildrop.

## Install

```bash
omarchy plugin add https://github.com/Albertus-de-Klerk/omarchy-tailscale-terminal.git --enable
omarchy plugin disable omarchy.tailscale
omarchy restart shell
```

## Requirements

- `tailscale` CLI. The target machine needs Tailscale SSH enabled (`tailscale set --ssh`), and your tailnet policy must allow SSH as the user you type.
- `xdg-terminal-exec` (Omarchy default).

## Keyboard shortcuts (inside the panel)

`j`/`k` move · `enter` activate · `o` open terminal · `t` toggle Tailscale · `c` copy IP · `n` copy name · `d` copy DNS name · `s` send files · `r` refresh · `esc` close

Tested on Omarchy 4.5.0.

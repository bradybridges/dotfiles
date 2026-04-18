# dotfiles

Personal configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

Configs are split by platform with a shared `global` directory for cross-platform tools.

```
dotfiles/
├── global/          # Cross-platform configs
│   └── nvim/
├── linux/           # Linux-only configs
│   ├── alacritty/
│   ├── betterlockscreen/
│   ├── cava/
│   ├── hyprland/
│   ├── i3/
│   ├── kitty/
│   ├── nvim/
│   ├── picom/
│   ├── polybar/
│   ├── rofi/
│   ├── swaync/
│   ├── tmux/
│   ├── tmuxifier/
│   ├── waybar/
│   ├── wofi/
│   └── zsh/
└── macos/           # macOS-only configs
    ├── nvim/
    ├── supercat/
    ├── tmux/
    └── zsh/
```

Each directory under a platform is a stow **package** — its contents mirror the structure of `$HOME`.

## Using stow

Install stow first:

```bash
# Arch Linux
sudo pacman -S stow

# macOS
brew install stow
```

Symlink individual packages into your home directory:

```bash
# Stow a single package
stow -d ~/dotfiles/linux -t ~ zsh
stow -d ~/dotfiles/linux -t ~ hyprland

# Stow multiple packages at once
stow -d ~/dotfiles/linux -t ~ zsh tmux nvim hyprland waybar

# Stow all linux configs
stow -d ~/dotfiles/linux -t ~ */

# Global config (Neovim — cross-platform)
stow -d ~/dotfiles/global -t ~ nvim

# macOS
stow -d ~/dotfiles/macos -t ~ zsh tmux nvim
```

To remove symlinks (unstow):

```bash
stow -d ~/dotfiles/linux -t ~ -D zsh
```

## Dependencies

### Fonts

Two Nerd Fonts are used across configs. Install both for full compatibility.

- **JetBrainsMono Nerd Font** — Neovim, Kitty, Hyprland/Hyprlock
- **SauceCodePro Nerd Font** — Alacritty, i3, BetterLockScreen, Polybar

Install via your distro's `nerd-fonts` package, or download from [nerdfonts.com](https://www.nerdfonts.com).

---

### Neovim

A highly extensible terminal-based text editor built for keyboard-driven development.

> `global/nvim` is the current maintained config. `linux/nvim` and `macos/nvim` are older platform-specific variants.

- [`bob`](https://github.com/MordechaiHadad/bob) — Neovim version manager (or install `nvim` directly)
- `node` / `npm` — required by Mason for LSP server installation
- `python3` / `pip` — required by Python tooling

Mason auto-installs LSP servers and formatters on first launch:

| Type | Tools |
|------|-------|
| LSP servers | ts_ls, html, cssls, tailwindcss, lua_ls, emmet_ls, pyright |
| Formatters | prettierd, stylua, black, isort, eslint_d |
| Linters | pylint |

---

### Zsh

A feature-rich Unix shell with extensive customization support via Oh My Zsh.

- `zsh`
- [Oh My Zsh](https://ohmyz.sh)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) — shell prompt theme
- Plugins: `zsh-autosuggestions`, `zsh-syntax-highlighting` (Linux also uses `zsh-bat`)
- [`fzf`](https://github.com/junegunn/fzf) — fuzzy finder used for file and history search
- [`nvm`](https://github.com/nvm-sh/nvm) — Node version manager
- [`tmuxifier`](https://github.com/jimeh/tmuxifier) — required for project session aliases

> The zsh config contains some work-specific aliases that can safely be removed.

---

### Tmux

A terminal multiplexer that lets you run multiple terminal sessions within a single window, with persistent sessions that survive disconnects.

- `tmux`
- [TPM](https://github.com/tmux-plugins/tpm) — Tmux Plugin Manager, install to `~/.tmux/plugins/tpm`

Plugins are auto-installed by TPM on first launch (`prefix + I`):

- `catppuccin/tmux` — Catppuccin color theme
- `tmux-plugins/tmux-resurrect` — saves and restores sessions across reboots

---

### Hyprland (Linux / Wayland — primary stack)

A dynamic tiling Wayland compositor with smooth animations and extensive configuration.

- `hyprland`
- `hyprpaper` — wallpaper daemon for Hyprland
- `hyprlock` — GPU-accelerated lock screen for Hyprland
- `hypridle` — idle management daemon (triggers lock/sleep on inactivity)
- `waybar` — status bar (see below)
- `swaync` — notification daemon (see below)
- `kitty` — default terminal (see below)
- `wofi` — app launcher (see below)
- `cava` + `pipewire` — audio visualizer integrated into Waybar
- A `polkit` authentication agent (e.g., `polkit-gnome` or `hyprpolkitagent`)
- JetBrainsMono Nerd Font

---

### i3 (Linux / X11 — fallback stack)

A lightweight, keyboard-driven tiling window manager for X11.

- `i3`
- `picom` — compositor adding transparency and shadows to X11 windows
- `polybar` — status bar (see below)
- `rofi` — app launcher (see below)
- `alacritty` — terminal (see below)
- `feh` — lightweight image viewer used to set the desktop wallpaper
- `xrandr` — multi-monitor configuration tool
- SauceCodePro Nerd Font

---

### Waybar

A highly customizable status bar for Wayland compositors. Displays workspaces, clock, system stats, and the Cava audio visualizer.

No additional dependencies beyond what Hyprland requires.

---

### Polybar

A flexible status bar for X11 window managers. Displays workspaces, system stats, and the Cava audio visualizer.

- `polybar`

---

### Kitty

A fast, GPU-accelerated terminal emulator with extensive feature support including splits, tabs, and image rendering.

- `kitty`
- JetBrainsMono Nerd Font

---

### Alacritty

A minimal, GPU-accelerated terminal emulator focused on simplicity and performance.

- `alacritty`
- SauceCodePro Nerd Font

---

### Rofi (X11)

An application launcher, window switcher, and dmenu replacement for X11.

- `rofi`
- Oranchelo icon theme

---

### Wofi (Wayland)

An application launcher and dmenu replacement for Wayland compositors.

- `wofi`

---

### Cava

A cross-platform audio spectrum visualizer for the terminal. Used here as an animated bar in Waybar and Polybar.

- `cava`
- `pipewire`

---

### Picom

A compositor for X11 that adds transparency, blur, shadows, and fade effects to windows.

- `picom`

---

### SwayNC

A notification daemon and control center for Wayland with support for Do Not Disturb mode and media controls.

- `swaync`

---

### BetterLockScreen

A fast lock screen for X11 with support for blurred/dimmed wallpapers and custom styling.

- `betterlockscreen`
- `feh`

---

### Tmuxifier

A tmux session and layout manager. Layouts define project-specific window and pane arrangements that can be launched by name.

- [`tmuxifier`](https://github.com/jimeh/tmuxifier) — install to `~/.tmuxifier`

Session layouts are stored in `linux/tmuxifier/.tmuxifier/layouts/`. The `zsh` config includes aliases to launch them by name.

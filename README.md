# 💻 macOS Dotfiles & Development Environment

A clean, keyboard-centric, distraction-free macOS workstation setup designed for high-focus development, Computer Science coursework, and rapid terminal workflows.

---

## ⚡ Architecture & Quick Reference

| Category | Component | Purpose |
| :--- | :--- | :--- |
| **Window Manager** | [AeroSpace](https://github.com/nikitabobko/AeroSpace) | i3-like tiling window manager for frictionless workspace switching |
| **Terminal** | [Ghostty](https://ghostty.org/) | Fast, GPU-accelerated terminal with native splits |
| **Shell Prompt** | [Starship](https://starship.rs/) | Minimal prompt showing path and active language/git contexts |
| **Smart Directory Jump** | [Zoxide](https://github.com/ajeetdsouza/zoxide) | Learns frequent paths; jump instantly with `z <folder>` |
| **Fuzzy Finder** | [fzf](https://github.com/junegunn/fzf) | Interactive reverse command history search via `Ctrl + R` |
| **Git Interface** | [lazygit](https://github.com/jesseduffield/lazygit) | Full keyboard-driven terminal dashboard for staging, diffing, and commits |
| **GitHub CLI** | [gh](https://cli.github.com/) | Manage repos, pull requests, and authentication from the CLI |
| **Fast Grep** | [ripgrep](https://github.com/BurntSushi/ripgrep) | Ultra-fast regex codebase search engine |
| **POSIX Script Linter** | [ShellCheck](https://www.shellcheck.net/) | Pre-submission static analysis for Bash/sh assignment grading |
| **Modern `ls`** | [eza](https://github.com/eza-community/eza) | Directory listings with file icons, Git indicators, and tree views |
| **Interactive Cheatsheet** | [navi](https://github.com/denisidoro/navi) | On-demand command finder triggered directly at prompt via `Ctrl + G` |
| **System Monitor** | [bottom](https://github.com/ClementTsang/bottom) | Visual system performance and CPU/RAM process monitor (`btm`) |
| **Media Downloader** | [yt-dlp](https://github.com/yt-dlp/yt-dlp) | Direct Apple-compatible (H.264/AAC MP4 & MP3) media conversion |

---

## 🚀 One-Command Fresh Machine Bootstrap

On any new Mac, clone this repository and run the setup script:

    git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
    cd ~/dotfiles
    chmod +x install.sh
    ./install.sh

### What `install.sh` Does:
* **Installs Homebrew** if not already present on the system.
* **Executes bundle install**: Runs `brew bundle --file=~/dotfiles/Brewfile` to install all formulas, casks, and fonts.
* **Creates persistent symlinks** pointing system locations directly to `~/dotfiles/`:
  * `~/.aerospace.toml` ➔ `~/dotfiles/aerospace/aerospace.toml`
  * `~/.config/ghostty/config` ➔ `~/dotfiles/ghostty/config`
  * `~/.zshrc` ➔ `~/dotfiles/zshrc`
* **Silences startup clutter**: Creates `~/.hushlogin` to eliminate the redundant `Last login: ... on ttysXXX` banner.

---

## 🪟 Workspace Organization (AeroSpace)

Workspaces are pinned by number to eliminate floating window chaos:

* **Workspace 1 (`Option + 1`):** Browser / Online Portals (Canvas, Pearson, Cengage)
* **Workspace 2 (`Option + 2`):** Primary Code Editor (Cursor)
* **Workspace 3 (`Option + 3`):** Terminal Workstation (Ghostty)
* **Workspace 4 (`Option + 4`):** Communication & Reference (Discord, Mail)

### AeroSpace Shortcuts

| Shortcut | Action |
| :--- | :--- |
| `Option + [1-4]` | Switch directly to workspace 1–4 |
| `Option + Shift + [1-4]` | Move active focused window to workspace 1–4 |
| `Option + H / J / K / L` | Move focus Left / Down / Up / Right between tiled windows |
| `Option + Shift + H / J / K / L` | Shift focused window position Left / Down / Up / Right |
| `Option + Shift + R` | Reload AeroSpace configuration immediately |

---

## 📟 Ghostty Terminal Shortcuts & Splits

Ghostty manages multiple views locally without running heavy multiplexers like tmux.

| Shortcut | Action |
| :--- | :--- |
| `Cmd + D` | Split active pane **Right** |
| `Cmd + Shift + D` | Split active pane **Down** |
| `Cmd + Option + A / D` | Shift cursor focus **Left / Right** across splits |
| `Cmd + Option + W / S` | Shift cursor focus **Up / Down** across splits |
| `Cmd + Shift + Enter` | Toggle Zoom (Fullscreen current split / Restore) |
| `Cmd + W` | Close the active split pane |

---

## 🛠️ Daily Power Commands & Aliases

### Navigation & Discovery
* `z <project>`: Teleports to a folder using frecency (e.g., `z vibe`).
* `Ctrl + R`: Opens interactive fuzzy search over entire command history (`fzf`).
* `ls`: Modern file listing with icons and folders sorted first (`eza`).
* `ll`: Detailed file listings with permissions and human-readable sizes.
* `tree`: Visual tree view of the current folder up to 2 levels deep.

### Git & Code Inspection
* `lg`: Launches the full `lazygit` dashboard. Use `1-4` to jump panes, `Space` to stage, `c` to commit, `P` to push.
* `rg "query"`: Lightning-fast project code search ignoring build directories (`ripgrep`).
* `shellcheck script.sh`: Validates Bash/Unix assignments before portal submission.

### Media Downloads (`yt-dlp`)
Files are automatically transcoded to Apple-compliant formats and routed to `~/Movies/Converts`:
* `ytmp4 "<URL>"`: Downloads best quality 1080p/4K video remuxed to standard H.264/AAC MP4 (playable in QuickTime & QuickLook).
* `ytmp3 "<URL>"`: Extracts audio directly to clean MP3.

### Cheatsheet & System Cards
* `Ctrl + G`: Opens `navi` popup to search your custom cheat codes.
* `ff`: Clears the screen and displays a clean, cyan-themed Fastfetch system hardware card.
* `btm`: Opens interactive CPU, RAM, and process monitor (`bottom`).

---

## 🔄 Keeping Dotfiles in Sync

Whenever you modify any configuration file on your machine:

    cd ~/dotfiles
    git status
    git add .
    git commit -m "chore: update configs"
    git push

# Global settings (shared across all projects)

Personal assumptions and preferences that apply to every project.
Write project-specific details in each repository's own `AGENTS.md`.

## Language

- Respond in Japanese.
  - However, match the existing style of each repository for in-code comments, identifiers, and commit messages.

## Environment

- macOS / zsh (`ZDOTDIR=$XDG_CONFIG_HOME/zsh`).
- Follows the XDG Base Directory spec (`~/.config`, `~/.cache`, `~/.local/share`, `~/.local/state`).
  - When adding new config files, prefer XDG paths over the home directory root when possible.
- Runtime/language versions are managed with mise. Git hosting is GitHub (`gh` CLI available).

## Commands

- `eza` is installed as a replacement for `ls` and `tree` (use `eza --tree` for tree views).
- `fd` is installed as a replacement for `find`.
- `rg` (ripgrep) is installed as a replacement for `grep`.

## Preferences

- Respect existing code style, naming, and dependencies; do not introduce new libraries or formatters without asking.
- Keep explanations concise; avoid verbose preambles and repetition.

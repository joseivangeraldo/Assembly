# Autosave support for this repository

This repository now includes a simple git-based autosave daemon and a recommended VS Code autosave config.

Files added:

- `git_autosave_daemon.sh` — a small script that runs in a loop, checks for git changes, commits them with a timestamped message and attempts to push. Logs to `.git_autosave.log`.
- `.vscode/settings.json` — enables editor-level autosave in VS Code (optional).

Quick start (run from repository root):

1. Make the daemon executable (one-time):

```bash
chmod +x ./git_autosave_daemon.sh
```

2. Run the daemon in the background (default interval = 60s):

```bash
nohup ./git_autosave_daemon.sh &
```

3. To change the check interval (seconds) set `AUTOSAVE_INTERVAL`:

```bash
AUTOSAVE_INTERVAL=30 nohup ./git_autosave_daemon.sh &
```

Notes and warnings:

- This script does `git add -A` and commits everything. Use with caution — it will include unstaged/unwanted files unless you add ignores in `.gitignore`.
- The script will continue even if `git push` fails (e.g., offline). Push failures are logged to `.git_autosave.log`.
- For production / per-user setup, consider creating a systemd user service or supervisor instead of using `nohup`.
- If you prefer editor-only autosave, open this repo in VS Code and the `.vscode/settings.json` added here will enable autosave after 1s.

If you'd like, I can:

- Add an exclude list to avoid committing build artifacts or large binary files.
- Create a systemd user unit to manage the daemon more robustly.
- Update `git_auto.sh` to use the safer commit logic from the daemon.

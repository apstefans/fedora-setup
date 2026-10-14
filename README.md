# Fedora Setup

Personal Fedora development environment using GNU Stow, Neovim and Git.

Supports Fedora desktop and Fedora 44 under WSL2.

## 1. Initial setup

Install Git:

```bash
sudo dnf install -y git
```

Clone the repository:

```bash
mkdir -p ~/projects
cd ~/projects
git clone https://github.com/apstefans/fedora-setup.git
cd fedora-setup
```

HTTPS is used initially because GitHub SSH authentication may not yet be configured.

## 2. Install development tools

For a full Fedora desktop installation, review and run:

```bash
./packages.sh
```

For a lightweight WSL installation, install the terminal essentials:

```bash
sudo dnf install -y \
    git stow neovim tmux \
    curl wget ripgrep fzf fd-find \
    bat eza btop fastfetch zoxide \
    gcc make unzip
```

## 3. Install dotfiles

Back up any existing configuration files before linking.

```bash
cd ~/projects/fedora-setup/dotfiles
stow -t "$HOME" bash git nvim tmux vim yazi
```

Stow creates symbolic links from the home directory to the repository.

If Stow reports conflicts, inspect and resolve them rather than forcing an overwrite.

Restart the shell:

```bash
exec bash
```

Launch Neovim:

```bash
nvim
```

The `lazy.nvim` plugin manager should install the configured plugins automatically.

## 4. Install LaTeX

From the repository root:

```bash
chmod +x latex.sh
./latex.sh
```

This installs TeX Live, latexmk, VimTeX's required external compiler, Zathura and TeXcount.

## 5. Configure GitHub SSH authentication

Generate a unique key for each machine:

```bash
ssh-keygen -t ed25519 -C "Fedora - machine description"
```

Start the SSH agent and add the key:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

Copy the public key (`~/.ssh/id_ed25519.pub`) to GitHub under Settings → SSH and GPG keys.

Never upload the private key.

Test authentication:

```bash
ssh -T git@github.com
```

After authentication, Git remotes can use SSH URLs.

## 6. Test the LaTeX workflow

Clone the relevant LaTeX project and open its main `.tex` file in Neovim.

VimTeX shortcuts:

- `\ll` — Compile using latexmk
- `\lv` — View PDF in Zathura
- `\le` — View compilation errors
- `\lk` — Stop compilation

Under WSL2, Zathura uses WSLg to display its window on Windows.

## 7. Synchronising machines

Before leaving one machine:

```bash
git add .
git commit -m "Update work"
git push
```

Before starting on another:

```bash
git pull
```

Keep project repositories separate from the `fedora-setup` dotfiles repository.

## Notes

- Fedora WSL does not require a full desktop environment.
- KiCad and container tools are optional and can be installed later.
- Some Zathura graphics warnings under WSLg may be harmless if PDFs display correctly.
- Review any machine-specific paths in Bash aliases before using them.
- Never commit SSH private keys, credentials or tokens.

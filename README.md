# nix

Another nix + dotfile repository.

<!--Add picture here from assets when done-->

## Prerequisites

- macOS
- Git
- Command Line Tools (`xcode-select --install`)

## Installation

1. Install Nix:

```bash
curl -L https://nixos.org/nix/install | sh
```

2. Clone this repository:

```bash
mkdir -p ~/src/github.com/projects
nix-shell -p git --run 'git clone https://github.com/MattiasMTS/dotfiles
~/src/github.com/projects/.dotfiles'
cd ~/src/github.com/projects.dotfiles
```

3. Initialize nix-darwin:

```bash
nix run nix-darwin --extra-experimental-features 'nix-command flakes' -- switch --flake .#
```

4. Set up dotfile symlinks and build system:

```bash
make init     # Create symlinks for nvim and wezterm configs
make rebuild  # Build initial system configuration
```

## Daily Usage

### Common Commands

- `make rebuild` - Rebuild system after nix config changes
- `make sync` - Sync dotfiles with git repository

### Maintenance

- `make update` - Update nix flake inputs
- `make update-all` - Update flakes, rebuild system, and clean up
- `make clean` - Run garbage collection
- `make check` - Check nix flake for errors

Run `make help` to see all available commands.

.PHONY: help
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Setup:"
	@echo "  deps                  Install Nix dependencies"
	@echo "  init                  Initialize dotfile symlinks"
	@echo ""
	@echo "Daily commands:"
	@echo "  rebuild               Rebuild nix-darwin configuration"
	@echo "  sync                  Sync dotfiles with git repository"
	@echo ""
	@echo "Maintenance:"
	@echo "  update                Update nix-darwin flake inputs"
	@echo "  update-all            Update flake, rebuild, and cleanup"
	@echo "  clean                 Run garbage collection"
	@echo "  check                 Check nix flake for errors"

.PHONY: deps
deps:
	@echo "Installing dependencies.."
	@command xcode-select --version >/dev/null 2>&1 || echo "Install Xcode: xcode-select --install"
	@command nix --version >/dev/null 2>&1 || echo "Install Nix: curl -L https://nixos.org/nix/install | sh"

.PHONY: rebuild
rebuild:
	@echo "Rebuilding nix-darwin configuration.."
	git add .
	darwin-rebuild switch --flake .# --show-trace

.PHONY: update
update:
	@echo "Updating flake inputs.."
	nix flake update

.PHONY: update-all
update-all:
	@echo "Updating and rebuilding system.."
	nix flake update
	darwin-rebuild switch --flake .# --show-trace
	nix-collect-garbage -d
	@echo "System updated and cleaned!"

.PHONY: clean
clean:
	@echo "Running garbage collection.."
	nix-collect-garbage -d

.PHONY: check
check:
	@echo "Checking flake.."
	nix flake check

.PHONY: sync
sync:
	@echo "Syncing dotfiles.."
	git add .
	git commit -m "chore: auto-sync dotfiles"
	git pull --rebase
	git push

.PHONY: init
init:
	@echo "Initializing dotfile symlinks.."
	[ -d ~/.config/nvim ] && rm -rf ~/.config/nvim || true
	[ -d ~/.config/wezterm ] && rm -rf ~/.config/wezterm || true
	ln -sf $(PWD)/.config/nvim ~/.config/nvim
	ln -sf $(PWD)/.config/wezterm ~/.config/wezterm

.PHONY: all
all: deps check rebuild

.DEFAULT_GOAL := help

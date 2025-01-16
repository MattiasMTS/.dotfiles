{ config, pkgs, lib, ... }:
let
  username = "mattiassjodin"; # TODO: fix as import instead
  inherit (config.lib.file) mkOutOfStoreSymlink;
in 
{
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";

  home.username = username;
  home.homeDirectory = "/Users/${username}";
  xdg.enable = true;

  # nvim managed by lazy.nvim instead of home-manager
  xdg.configFile.nvim.source = mkOutOfStoreSymlink "/Users/${username}/.config/nvim";

  # user specific packages instead of system wide
  home.packages = with pkgs; [
    raycast # unfree license
    fzf
    fd
    delta
    # sesh # better tmux session management
    kubectl
    kubectx
    stern
    terraform # unfree license
    terragrunt
    python310
    nodejs_22
    kubernetes-helm
    # podman-desktop
    # podman
    # podman-compose
    kotlin
    jdk17
    gradle
    # uv
    # duckdb
    wezterm # TODO: consider migrating fully to ghostty later.
    mosquitto
    go-migrate
    rancher
    # TODO: double check if lua5.1 is needed
    # luarocks
    # lua
  ];

  # wezterm managed by lua instead of home-manager
  xdg.configFile.wezterm.source = mkOutOfStoreSymlink "/Users/${username}/.config/wezterm";

  # TODO: add the following
  # postgresq git-sync against repo
  # add tmux-sesh / zoxide
  programs = {
    # ghostty = import ./programs/ghostty.nix { inherit pkgs; }; # TODO: broken on v1.0.1
    zsh = import ./programs/zsh.nix { inherit config pkgs lib; };
    starship = import ./programs/starship.nix { inherit pkgs; };
    git = import ./programs/git.nix { inherit username; };
    tmux = import ./programs/tmux.nix {inherit pkgs;};
    fzf = import ./programs/fzf.nix { inherit pkgs; };
    zoxide = (import ./programs/zoxide.nix { inherit pkgs; });
    go = import ./programs/go.nix {inherit pkgs;};
    java = import ./programs/java.nix {inherit pkgs;};
    awscli = { enable = true; };
    lazygit = import ./programs/lazygit.nix {inherit pkgs;};
    poetry = { enable = true; };
    gh = import ./programs/gh.nix { inherit pkgs; };
    bat = { enable = true; };
    k9s = { enable = true; };
    ripgrep = { enable = true; };
    jq = { enable = true; };
  };
}

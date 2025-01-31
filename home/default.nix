{ config, pkgs, lib, inputs, ... }:
let
  username = "mattiassjodin"; # TODO: fix as import instead
  inherit (config.lib.file) mkOutOfStoreSymlink;
in {
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";

  home.username = username;
  home.homeDirectory = "/Users/${username}";
  xdg.enable = true;

  # user specific packages instead of system wide
  home.packages = with pkgs; [
    fzf
    fd
    delta
    sesh
    kubectl
    kubectx
    # stern
    terraform # unfree license
    terragrunt
    python310
    nodejs_23
    kubernetes-helm

    kotlin
    jdk17
    gradle
    # uv
    # duckdb
    wezterm # TODO: consider migrating fully to ghostty later when nix fixed v1.0.1
    # mosquitto # mqtt broker
    go-migrate
    # sketchybar

    inputs.nixpkgs-poetry-1_8_5.legacyPackages.${pkgs.system}.poetry
    inputs.nixpkgs-rancher-2_7_0.legacyPackages.${pkgs.system}.rancher

  ];

  # packages managed outside of home-manager
  xdg.configFile.nvim = {
    source = mkOutOfStoreSymlink
      "/Users/${username}/src/github.com/projects/.dotfiles/.config/nvim";
    force = true;
  };
  xdg.configFile.wezterm.source = mkOutOfStoreSymlink
    "/Users/${username}/src/github.com/projects/.dotfiles/.config/wezterm";
  xdg.configFile.ghostty.source = mkOutOfStoreSymlink
    "/Users/${username}/src/github.com/projects/.dotfiles/.config/ghostty";
  xdg.configFile.sesh.source = mkOutOfStoreSymlink
    "/Users/${username}/src/github.com/projects/.dotfiles/.config/sesh";

  # applications/programs
  programs = {
    neovim = {
      enable = true;
      extraLuaPackages = ps: [ ps.magick ];
      extraPackages = [ pkgs.imagemagick ];
    };
    # FIXME: broken build on v1.0.1
    # ghostty = import ./programs/ghostty.nix { inherit pkgs; }; 
    zsh = import ./programs/zsh.nix { inherit config pkgs lib; };
    starship = import ./programs/starship.nix { inherit pkgs; };
    git = import ./programs/git.nix { inherit username; };
    tmux = import ./programs/tmux.nix { inherit pkgs; };
    fzf = import ./programs/fzf.nix { inherit pkgs; };
    zoxide = (import ./programs/zoxide.nix { inherit pkgs; });
    go = import ./programs/go.nix { inherit pkgs; };
    java = import ./programs/java.nix { inherit pkgs; };
    awscli = { enable = true; };
    lazygit = import ./programs/lazygit.nix { inherit pkgs; };
    # poetry = { enable = true; };
    gh = import ./programs/gh.nix { inherit pkgs; };
    bat = { enable = true; };
    k9s = { enable = true; };
    ripgrep = { enable = true; };
    jq = { enable = true; };
    ssh = import ./programs/ssh.nix { inherit pkgs; };
  };
}
